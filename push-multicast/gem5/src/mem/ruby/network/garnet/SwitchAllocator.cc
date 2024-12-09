/*
 * Copyright (c) 2020 Inria
 * Copyright (c) 2016 Georgia Institute of Technology
 * Copyright (c) 2008 Princeton University
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include "mem/ruby/network/garnet/SwitchAllocator.hh"

#include "debug/GarnetMulticast.hh"
#include "debug/PrepushFilter.hh"
#include "debug/RubyNetwork.hh"
#include "mem/ruby/network/garnet/GarnetNetwork.hh"
#include "mem/ruby/network/garnet/InputUnit.hh"
#include "mem/ruby/network/garnet/OutputUnit.hh"
#include "mem/ruby/network/garnet/PrepushFilter.hh"
#include "mem/ruby/network/garnet/Router.hh"

SwitchAllocator::SwitchAllocator(Router *router)
    : Consumer(router)
{
    m_router = router;
    m_num_vcs = m_router->get_num_vcs();
    m_vc_per_vnet = m_router->get_vc_per_vnet();

    m_input_arbiter_activity = 0;
    m_output_arbiter_activity = 0;

    prepushFilterActivity = 0;
}

void
SwitchAllocator::init()
{
    m_num_inports = m_router->get_num_inports();
    m_num_outports = m_router->get_num_outports();
    m_round_robin_inport.resize(m_num_outports);
    m_round_robin_invc.resize(m_num_inports);
    m_port_requests.resize(m_num_outports);
    m_vc_winners.resize(m_num_outports);
    grantedSwitchInportForOutports.resize(m_num_outports);
    outportWinnerVCs.resize(m_num_outports);

    inportSentOrDropped.resize(m_num_inports);
    filterRoundRobinInvc.resize(m_num_inports);
    heldSwitchInportForOutports.resize(m_num_outports);
    inportReplicas.resize(m_num_inports);

    for (int vc = 0; vc < m_num_vcs; vc++) {
        int vnet = vc / m_vc_per_vnet;
        vcToVnetMap[vc] = vnet;
        vcToVnetTypeMap[vc] = m_router->get_net_ptr()->get_vnet_type(vnet);
    }

    for (int i = 0; i < m_num_inports; i++) {
        m_round_robin_invc[i] = 0;
        inportSentOrDropped[i] = false;
        filterRoundRobinInvc[i] = 0;
        inportReplicas[i] = 0;
    }

    for (int i = 0; i < m_num_outports; i++) {
        m_port_requests[i].resize(m_num_inports);
        m_vc_winners[i].resize(m_num_inports);

        grantedSwitchInportForOutports[i] = -1;
        outportWinnerVCs[i] = -1;;

        m_round_robin_inport[i] = 0;

        for (int j = 0; j < m_num_inports; j++) {
            m_port_requests[i][j] = false; // [outport][inport]
        }

        heldSwitchInportForOutports[i] = -1;
    }

    holdSwitchForMulticastOnly =
        m_router->get_net_ptr()->holdSwitchForMulticastOnly();
}

/*
 * The wakeup function of the SwitchAllocator performs a 2-stage
 * seperable switch allocation. At the end of the 2nd stage, a free
 * output VC is assigned to the winning flits of each output port.
 * There is no separate VCAllocator stage like the one in garnet1.0.
 * At the end of this function, the router is rescheduled to wakeup
 * next cycle for peforming SA for any flits ready next cycle.
 */

void
SwitchAllocator::wakeup()
{
    if (m_router->isPrepushFilterEnabled())
        checkPrepushFiltering(); // Check and mark for filtering

    arbitrate_inports(); // First stage of allocation
    arbitrate_outports(); // Second stage of allocation
    grantSwitch();

    if (m_router->isPrepushFilterEnabled())
        executePrepushFiltering(); // run prepush filtering

    clear_request_vector();
    check_for_wakeup();
}

/*
 * Check prepush filtering loops through all input VCs at every input port,
 * and determins if the (GETS request) should be dropped or not by querying
 * the input's local prepush filter. If it should be dropped, the VC should
 * be marked.
 */

void
SwitchAllocator::checkPrepushFiltering()
{
    for (int inport = 0; inport < m_num_inports; inport++) {
        auto input_unit = m_router->getInputUnit(inport);
        auto prepush_filter = m_router->getPrepushFilter(inport);

        // TODO: optimize it to only check control VCs
        for (int vc = 0; vc < m_num_vcs; vc++) {
            if (!input_unit->isToBeFiltered(vc) && !input_unit->isEmpty(vc)) {
                flit *t_flit = input_unit->peekTopFlit(vc);

                if (t_flit->isReadRequest()) {
                    Addr addr = t_flit->getAddr();
                    MachineID mach_id = t_flit->getRoute().srcMachID;

                    if (prepush_filter->queryToDropRequest(addr, mach_id)) {
                        input_unit->setToBeFiltered(vc);

                        DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d "
                                "(%s) at SWAllocator: (addr %#x) set flit %s "
                                "at inport %d vc %d to be filtered.\n",
                                m_router->get_id(), inport,
                                input_unit->get_direction(), addr, *t_flit,
                                inport, vc);

                        std::pair<int, int> prepush_inport_invc =
                            prepush_filter->getInportAndInvc(addr);

                        if (prepush_inport_invc.first != -1) {
                            auto prepush_input_unit = m_router->getInputUnit(
                                    prepush_inport_invc.first);
                            prepush_input_unit->updateDemandDests(addr,
                                    prepush_inport_invc.second, mach_id,
                                    inport);
                        }
                    }
                }
            }
        }
    }
}

/*
 * SA-I (or SA-i) loops through all input VCs at every input port,
 * and selects one in a round robin manner.
 *    - For HEAD/HEAD_TAIL flits only selects an input VC whose output port
 *     has at least one free output VC.
 *    - For BODY/TAIL flits, only selects an input VC that has credits
 *      in its output VC.
 * Places a request for the output port from this input VC.
 */

void
SwitchAllocator::arbitrate_inports()
{
    // Select a VC from each input in a round robin manner
    // Independent arbiter at each input port
    for (int inport = 0; inport < m_num_inports; inport++) {
        int invc = m_round_robin_invc[inport];

        for (int invc_iter = 0; invc_iter < m_num_vcs; invc_iter++) {
            auto input_unit = m_router->getInputUnit(inport);

            if (input_unit->need_stage(invc, SA_, curTick())) {
                // This flit is in SA stage

                const bool is_multicast = input_unit->isMulticast(invc);

                if (is_multicast) {
                    // Synchronous multicast handling
                    std::vector<int> outports;
                    bool is_head_flit = input_unit->isHeadFlit(invc);
                    if (is_head_flit) {
                        outports =
                            input_unit->getMulticastRemainingOutports(invc);
                    } else {
                        outports =
                            input_unit->getMulticastActiveOutports(invc);
                    }

                    bool succeed = false;

                    // Request for switch for all the remaining outports
                    for (auto outport: outports) {
                        int outvc =
                            input_unit->getMulticastOutvc(invc, outport);

                        // check if the flit is allowed to be sent
                        bool make_request =
                            send_allowed(inport, invc, outport, outvc);

                        int held_inport_for_outport =
                            heldSwitchInportForOutports[outport];

                        if (make_request) {
                            if (held_inport_for_outport == -1) {
                                // outport is not hled by any inports
                                DPRINTF(GarnetMulticast, "Router[%d]: "
                                        "SwitchAllocator: made a switch "
                                        "request for multicast Flit: %s from "
                                        "VC %d at inport %d (%s) to VC %d at "
                                        "outport %d (%s)\n",
                                        m_router->get_id(),
                                        *input_unit->peekMulticastFlit(invc),
                                        invc, inport,
                                        input_unit->get_direction(),
                                        outvc, outport,
                                        m_router->getOutportDirection(
                                            outport));

                                succeed = true;
                                m_port_requests[outport][inport] = true;
                                m_vc_winners[outport][inport] = invc;
                            } else {
                                // outport is held by one of the inports
                                // should not hold switch outport for head flit
                                assert(held_inport_for_outport != inport ||
                                        !is_head_flit);

                                if (held_inport_for_outport == inport) {
                                    succeed = true;
                                    m_port_requests[outport][inport] = true;
                                    m_vc_winners[outport][inport] = invc;

                                    DPRINTF(RubyNetwork, "Router[%d]: "
                                            "SwitchAllocator: request held "
                                            "switch for multicast Flit %s "
                                            "from VC %d at inport %d (%s) to "
                                            "VC %d at outport %d (%s)\n",
                                            m_router->get_id(),
                                            *input_unit->peekMulticastFlit(
                                                invc),
                                            invc, inport,
                                            input_unit->get_direction(),
                                            outvc, outport,
                                            m_router->getOutportDirection(
                                                outport));
                                }
                            }
                        } else {
                            // Switch will be held only when there are flits
                            // to be sent, which is the case in virtual
                            // cut-through for response vnet (data), for
                            // request vnet, writeback may not be able to hold
                            // switch if buffer depth is only one.
                            if (held_inport_for_outport == inport &&
                                    !is_head_flit) {
                                DPRINTF(RubyNetwork, "Router[%d]: "
                                        "SwitchAllocator: request switch for "
                                        "multicast Flit %s from VC %d at "
                                        "inport %d (%s) to outport %d (%s) "
                                        "[make request disallowed]\n",
                                        m_router->get_id(),
                                        *input_unit->peekMulticastFlit(invc),
                                        invc, inport,
                                        input_unit->get_direction(),
                                        outport,
                                        m_router->getOutportDirection(
                                            outport));
                            }
                            assert(held_inport_for_outport != inport ||
                                    is_head_flit);
                        }
                    }

                    if (succeed) {
                        m_input_arbiter_activity++;

                        break; // got one vc winner for this port
                    }
                } else {
                    int outport = input_unit->get_outport(invc);
                    int outvc = input_unit->get_outvc(invc);

                    // check if the flit in this InputVC is allowed to be sent
                    // send_allowed conditions described in that function.
                    bool make_request =
                        send_allowed(inport, invc, outport, outvc);

                    if (make_request) {
                        if (heldSwitchInportForOutports[outport] == -1) {
                            // outport is not held by any inports
                            m_input_arbiter_activity++;
                            m_port_requests[outport][inport] = true;
                            m_vc_winners[outport][inport]= invc;

                            break; // got one vc winner for this port
                        } else {
                            int held_inport =
                                heldSwitchInportForOutports[outport];

                            assert(held_inport != inport ||
                                    !holdSwitchForMulticastOnly);

                            if (!holdSwitchForMulticastOnly &&
                                    held_inport == inport) {
                                assert(m_vc_winners[outport][inport] == invc);

                                m_input_arbiter_activity++;
                                m_port_requests[outport][inport] = true;

                                DPRINTF(RubyNetwork, "Router[%d]: "
                                        "SwitchAllocator: request held switch"
                                        " for Flit %s from VC %d at inport %d"
                                        " (%s) to VC %d at outport %d (%s)\n",
                                        m_router->get_id(),
                                        *input_unit->peekTopFlit(invc), invc,
                                        inport, input_unit->get_direction(),
                                        outvc, outport,
                                        m_router->getOutportDirection(
                                            outport));

                                break;
                            }
                        }
                    } else {
                        if (heldSwitchInportForOutports[outport] == inport &&
                                !holdSwitchForMulticastOnly) {
                            heldSwitchInportForOutports[outport] = -1;
                        }
                    }
                }
            }

            invc++;
            if (invc >= m_num_vcs)
                invc = 0;
        }
    }
}

/*
 * SA-II (or SA-o) loops through all output ports,
 * and selects one input VC (that placed a request during SA-I)
 * as the winner for this output port in a round robin manner.
 *      - For HEAD/HEAD_TAIL flits, performs simplified outvc allocation.
 *        (i.e., select a free VC from the output port).
 *      - For BODY/TAIL flits, decrement a credit in the output vc.
 * The winning flit is read out from the input VC and sent to the
 * CrossbarSwitch.
 * An increment_credit signal is sent from the InputUnit
 * to the upstream router. For HEAD_TAIL/TAIL flits, is_free_signal in the
 * credit is set to true.
 */

void
SwitchAllocator::arbitrate_outports()
{
    // Now there are a set of input vc requests for output vcs.
    // Again do round robin arbitration on these requests
    // Independent arbiter at each output port
    for (int outport = 0; outport < m_num_outports; outport++) {
        int inport = m_round_robin_inport[outport];

        for (int inport_iter = 0; inport_iter < m_num_inports;
                 inport_iter++) {

            // inport has a request this cycle for outport
            if (m_port_requests[outport][inport]) {
                auto input_unit = m_router->getInputUnit(inport);

                // grant this outport to this inport
                int invc = m_vc_winners[outport][inport];

                const bool is_multicast = input_unit->isMulticast(invc);

                int outvc = -1;
                if (is_multicast) {
                    outvc = input_unit->getMulticastOutvc(invc, outport);
                } else {
                    outvc = input_unit->get_outvc(invc);
                }

                if (outvc == -1) {
                    // VC Allocation - select any free VC from outport
                    outvc = vc_allocate(outport, inport, invc);
                }

                assert(grantedSwitchInportForOutports[outport] == -1 &&
                        outportWinnerVCs[outport] == -1);
                grantedSwitchInportForOutports[outport] = inport;
                outportWinnerVCs[outport] = outvc;

                inportReplicas[inport]++;

                m_output_arbiter_activity++;

                break; // got a input winner for this outport
            }

            inport++;
            if (inport >= m_num_inports)
                inport = 0;
        }
    }
}

void
SwitchAllocator::grantSwitch()
{
    // Grant the switch to the allocated flits
    for (int outport = 0; outport < m_num_outports; outport++) {
        int inport = grantedSwitchInportForOutports[outport];

        // inport has a request this cycle for outport
        if (inport != -1) {
            auto output_unit = m_router->getOutputUnit(outport);
            auto input_unit = m_router->getInputUnit(inport);

            // grant this outport to this inport
            int invc = m_vc_winners[outport][inport];
            int outvc = outportWinnerVCs[outport];

            const bool is_multicast = input_unit->isMulticast(invc);

            // one flit (replica) will be sent
            inportReplicas[inport]--;

            flit *t_flit = nullptr;

            bool last_multicast_replica = false;

            if (is_multicast) {
                t_flit = input_unit->peekMulticastFlit(invc);

                // Remove the granted outport in invc's remaining outports for
                // multicast if it is a head flit; meanwhile, insert the
                // outport to invc's active outports for data head flit; and
                // remove the outports from invc's active outports if it is a
                // tail flit
                flit_type ftype = t_flit->get_type();
                if (ftype == HEAD_) {
                    input_unit->removeFromMulticastRemainingOutports(
                            invc, outport);
                    input_unit->insertToMulticastActiveOutports(
                            invc, outport);
                } else if (ftype == HEAD_TAIL_) {
                    input_unit->removeFromMulticastRemainingOutports(
                            invc, outport);
                } else if (ftype == TAIL_) {
                    input_unit->removeFromMulticastActiveOutports(
                            invc, outport);
                }

                last_multicast_replica =
                    input_unit->isLastActiveGroup(invc) &&
                    (inportReplicas[inport] == 0);

                if (last_multicast_replica) {
                    // last replica, remove flit from Input VC
                    t_flit = input_unit->getTopFlit(invc);
                } else {
                    if (inportReplicas[inport] == 0) {
                        // last active replica
                        input_unit->advanceToNextMulticastFlit(invc);
                    }

                    DPRINTF(GarnetMulticast, "Router[%d]: SwitchAllocator "
                            "made a replica multicast Flit: PktID=%d Id=%d "
                            "from invc %d at inport %d (%s) to outvc %d at "
                            "output %d (%s)\n",
                            m_router->get_id(),
                            t_flit->getPacketID(), t_flit->get_id(),
                            invc, inport, input_unit->get_direction(),
                            outvc, outport,output_unit->get_direction());

                    t_flit = t_flit->makeReplica();
                }

                t_flit->updateMulticastMetadata(
                        input_unit->getMulticastRouteInfoForOutport(
                            invc, outport),
                        input_unit->getMulticastMsgPtrsMapForOutport(
                            invc, outport));

                DPRINTF(GarnetMulticast, "Router[%d]: SwitchAllocator "
                        "granted outvc %d at outport %d (%s) to invc %d at "
                        "inport %d (%s) to multicast flit %s\n",
                        m_router->get_id(),
                        outvc, outport, output_unit->get_direction(),
                        invc, inport, input_unit->get_direction(),
                        *t_flit);
            } else {
                // remove flit from Input VC
                t_flit = input_unit->getTopFlit(invc);

                DPRINTF(RubyNetwork, "Router[%d]: SwitchAllocator granted "
                        "outvc %d at outport %d (%s) to invc %d at inport %d "
                        "(%s) to flit %s\n",
                        m_router->get_id(),
                        outvc, outport, output_unit->get_direction(),
                        invc, inport, input_unit->get_direction(),
                        *t_flit);
            }

            bool drop_flit = m_router->isPrepushFilterEnabled() &&
                input_unit->isToBeFiltered(invc);

            if (!drop_flit) {
                // Update outport field in the flit since this is used by
                // CrossbarSwitch code to send it out of correct outport.
                // Note: post route compute in InputUnit, outport is updated
                // in VC, but not in flit
                t_flit->set_outport(outport);

                // set outvc (i.e., invc for next hop) in flit
                // (This was updated in VC by vc_allocate, but not in flit)
                t_flit->set_vc(outvc);

                // decrement credit in outvc
                output_unit->decrement_credit(outvc);

                // flit ready for Switch Traversal
                t_flit->advance_stage(ST_, curTick());
                m_router->grant_switch(inport, t_flit);
            }

            if ((t_flit->get_type() == TAIL_) ||
                    t_flit->get_type() == HEAD_TAIL_) {

                // If it's a unicast or the last multicast replica
                if (!is_multicast || last_multicast_replica) {
                    // This Input VC should now be empty
                    assert(!(input_unit->isReady(invc, curTick())));

                    // Free this VC
                    input_unit->set_vc_idle(invc, curTick());

                    // Send a credit back
                    // along with the information that this VC is now idle
                    input_unit->increment_credit(invc, true, curTick());

                    if (is_multicast) {
                        assert(last_multicast_replica);
                        input_unit->clearMulticastInfo(invc);
                    }
                }

                if (m_router->isPrepushFilterEnabled() &&
                        t_flit->isPrepush()) {
                    auto prepush_filter = m_router->getPrepushFilter(outport);

                    Cycles wait_cycles = Cycles(3);
                    Tick clear_time = m_router->clockEdge(wait_cycles);

                    prepush_filter->clearPrepushAtTime(
                            t_flit->getAddr(),
                            clear_time,
                            t_flit->getRoute().net_dest);

                    DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d "
                            "(%s): clear prepush addr %#x dest %s at tick"
                            " %ld\n", m_router->get_id(),
                            outport, output_unit->get_direction(),
                            t_flit->getAddr(),
                            t_flit->getRoute().net_dest,
                            clear_time);

                    if (!m_router->alreadyScheduled(clear_time))
                        m_router->schedule_wakeup(wait_cycles);
                }
            } else {
                // If it's a unicast or the last multicast replica
                if (!is_multicast || last_multicast_replica) {
                    // Send a credit back
                    // but do not indicate that the VC is idle
                    input_unit->increment_credit(invc, false, curTick());
                }
            }

            if (t_flit->get_type() == TAIL_ ||
                    t_flit->get_type() == HEAD_TAIL_ ||
                    (holdSwitchForMulticastOnly &&
                     !input_unit->isMulticast(invc)) ||
                    !input_unit->need_stage(
                        invc, SA_, m_router->clockEdge(Cycles(1)))) {

                // if not hold switch for multicast only, data packet head or
                // body flits must belong to writeback data on request channel
                if (!holdSwitchForMulticastOnly &&
                        (t_flit->get_type() == HEAD_ ||
                         t_flit->get_type() == BODY_) &&
                        !input_unit->need_stage(
                            invc, SA_, m_router->clockEdge(Cycles(1)))) {
                    assert(vcToVnetTypeMap[invc] == CTRL_VNET_);
                }

                heldSwitchInportForOutports[outport] = -1;

                // remove this request
                m_port_requests[outport][inport] = false;

                // Update Round Robin pointer
                m_round_robin_inport[outport] = inport + 1;
                if (m_round_robin_inport[outport] >= m_num_inports)
                    m_round_robin_inport[outport] = 0;

                // Update Round Robin pointer to the next VC
                // We do it here to keep it fair.
                // Only the VC which got switch traversal is updated.
                m_round_robin_invc[inport] = invc + 1;
                if (m_round_robin_invc[inport] >= m_num_vcs)
                    m_round_robin_invc[inport] = 0;
            } else {
                m_round_robin_invc[inport] = invc;
                heldSwitchInportForOutports[outport] = inport;

                DPRINTF(RubyNetwork, "Router[%d]: SwitchAllocator: Flit %s "
                        "holds the switch  from VC %d at inport %d (%s) to "
                        "VC %d at outport %d (%s)\n",
                        m_router->get_id(),
                        *t_flit, invc,
                        inport, input_unit->get_direction(),
                        outvc, outport,
                        output_unit->get_direction());
            }

            if (drop_flit) {
                // Return the allocated VC.
                output_unit->set_vc_state(IDLE_, outvc, curTick());

                DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d "
                        "(%s) at SWAllocator: (addr %#x) drop flit %s\n",
                        m_router->get_id(),
                        inport, input_unit->get_direction(),
                        t_flit->getAddr(),
                        *t_flit);

                delete t_flit;

                prepushFilterActivity++;
            }

            // Indicate the credit channel has been used to send a credit to
            // the upstream for the sent or dropped flit, no more prepush
            // filtering for this inport in the current cycle since credit
            // channel is busy. Note that filtering drops a flit and returns a
            // credit to the upstream.
            inportSentOrDropped[inport] = true;

            grantedSwitchInportForOutports[outport] = -1;
            outportWinnerVCs[outport] = -1;
        }
    }
}

/*
 * Loop over all the inports and check if there are requests flits (packets)
 * need to be filtered when the corresponding credit channel is free,
 * indicated by the inportSentOrDrop flag. If find one, drop it and return a
 * credit.
 */

void
SwitchAllocator::executePrepushFiltering()
{
    // Select a VC from each input in a round robin manner
    // Independent arbiter at each input port
    for (int inport = 0; inport < m_num_inports; inport++) {

        if (inportSentOrDropped[inport]) {
            inportSentOrDropped[inport] = false;
            continue;
        }

        auto input_unit = m_router->getInputUnit(inport);
        int invc = filterRoundRobinInvc[inport];

        for (int invc_iter = 0; invc_iter < m_num_vcs; invc_iter++) {

            if (input_unit->isToBeFiltered(invc)) {
                flit *t_flit = input_unit->getTopFlit(invc);

                assert(t_flit->get_type() == HEAD_TAIL_ &&
                        t_flit->isReadRequest());

                DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d (%s): "
                        "(addr %#x) drop flit %s from inport %d vc %d\n",
                        m_router->get_id(),
                        inport, input_unit->get_direction(),
                        t_flit->getAddr(), *t_flit,
                        inport, invc);

                delete t_flit;

                prepushFilterActivity++;

                // It should not have the output vc allocated, otherwise the
                // switch allocaiton should have been successfull and it is
                // not supposed to come here.
                assert(input_unit->get_outvc(invc) == -1);

                // Free this VC
                input_unit->set_vc_idle(invc, curTick());

                // Send a credit back
                // along with the information that this VC is now idle
                input_unit->increment_credit(invc, true, curTick());

                filterRoundRobinInvc[inport] = invc + 1;
                if (filterRoundRobinInvc[inport] >= m_num_vcs)
                    filterRoundRobinInvc[inport] = 0;

                break;
            }

            invc++;
            if (invc >= m_num_vcs)
                invc = 0;
        }
    }

    // clear prepush entries 3 cycles after prepush response are sent out
    for (int inport = 0; inport < m_num_inports; inport++) {
        auto prepush_filter = m_router->getPrepushFilter(inport);

        prepush_filter->clearPrepushes(curTick());
    }
}

/*
 * A flit can be sent only if
 * (1) there is at least one free output VC at the
 *     output port (for HEAD/HEAD_TAIL),
 *  or
 * (2) if there is at least one credit (i.e., buffer slot)
 *     within the VC for BODY/TAIL flits of multi-flit packets.
 * and
 * (3) pt-to-pt ordering is not violated in ordered vnets, i.e.,
 *     there should be no other flit in this input port
 *     within an ordered vnet
 *     that arrived before this flit and is requesting the same output port.
 */

bool
SwitchAllocator::send_allowed(int inport, int invc, int outport, int outvc)
{
    // Check if outvc needed
    // Check if credit needed (for multi-flit packet)
    // Check if ordering violated (in ordered vnet)

    int vnet = get_vnet(invc);
    bool has_outvc = (outvc != -1);
    bool has_credit = false;

    auto output_unit = m_router->getOutputUnit(outport);
    if (!has_outvc) {

        // needs outvc
        // this is only true for HEAD and HEAD_TAIL flits.

        if (output_unit->has_free_vc(vnet)) {

            has_outvc = true;

            // each VC has at least one buffer,
            // so no need for additional credit check
            has_credit = true;
        }
    } else {
        has_credit = output_unit->has_credit(outvc);
    }

    // cannot send if no outvc or no credit.
    if (!has_outvc || !has_credit)
        return false;

    // protocol ordering check
    GarnetNetwork *net_ptr = m_router->get_net_ptr();
    // XXX: hardcoded for performance assuming request vnet is 0 and
    //      response/unblock-forward vnet is 1/2, respectively.
    if (net_ptr->getCoherenceConstraint() == ORDERED_VNET_ && vnet > 0) {
        // Enforce coherence traffic ordering for response/unblock-forward
        // virtual networks
        assert(net_ptr->getRequestVnet() == 0);
        assert(m_router->isPrepushFilterEnabled());

        auto input_unit = m_router->getInputUnit(inport);

        // enqueue time of this flit
        Tick t_enqueue_time = input_unit->get_enqueue_time(invc);

        // check if any other flit is ready for SA and for same output port
        // and was enqueued before this flit
        int vc_start = m_vc_per_vnet;
        int vc_end = m_vc_per_vnet * 3;
        for (int vc = vc_start; vc < vc_end; vc++) {
            if (input_unit->need_stage(vc, SA_, curTick()) &&
               (input_unit->get_enqueue_time(vc) < t_enqueue_time)) {

                // unicast comparison
                bool outport_match = input_unit->get_outport(vc) == outport;

                // multicast `get_outport` above is -1, compare with multicast
                if (input_unit->isMulticast(vc)) {
                    std::vector<int> active_outports =
                        input_unit->getMulticastActiveOutports(vc);
                    outport_match = std::count(active_outports.begin(),
                            active_outports.end(), outport);

                    std::vector<int> remaining_outports =
                        input_unit->getMulticastRemainingOutports(vc);
                    outport_match |= std::count(remaining_outports.begin(),
                            remaining_outports.end(), outport);
                }

                if (outport_match)
                    return false;
            }
        }
    } else if (net_ptr->getCoherenceConstraint() == ORDERED_PREPUSH_INV_ &&
            vnet == 2) {
        // Enforce coherence traffic ordering for prepush and invalidation
        assert(net_ptr->getRequestVnet() == 0);
        assert(m_router->isPrepushFilterEnabled());

        flit *t_flit = m_router->getInputUnit(inport)->peekTopFlit(invc);

        // check the prepush filter to see if there are prepush for the same
        // cache line waiting for being sent to the outport, if so, force
        // invalidation after prepush
        if (t_flit->get_msg_ptr()->isInvRequest()) {
            Addr addr = t_flit->getAddr();
            auto prepush_filter = m_router->getPrepushFilter(outport);

            if (prepush_filter->addrHasRegistry(addr))
                return false;
        }
    }

    if (net_ptr->getCoherenceConstraint() != ORDERED_VNET_ &&
            net_ptr->isVNetOrdered(vnet)) {
        auto input_unit = m_router->getInputUnit(inport);

        if (holdSwitchForMulticastOnly) {
            flit_type ftype = input_unit->peekMulticastFlit(invc)->get_type();
            if (input_unit->isMulticast(invc) &&
                    ftype != HEAD_ && ftype != HEAD_TAIL_) {
                return true;
            }
        }
        // enqueue time of this flit
        Tick t_enqueue_time = input_unit->get_enqueue_time(invc);

        // check if any other flit is ready for SA and for same output port
        // and was enqueued before this flit
        int vc_base = vnet*m_vc_per_vnet;
        for (int vc_offset = 0; vc_offset < m_vc_per_vnet; vc_offset++) {
            int vc = vc_base + vc_offset;

            if (input_unit->need_stage(vc, SA_, curTick()) &&
                (input_unit->get_enqueue_time(vc) < t_enqueue_time)) {

                // unicast comparison
                bool outport_match = input_unit->get_outport(vc) == outport;

                // multicast `get_outport` above is -1, compare with multicast
                if (input_unit->isMulticast(vc)) {
                    std::vector<int> active_outports =
                        input_unit->getMulticastActiveOutports(vc);
                    outport_match = std::count(active_outports.begin(),
                            active_outports.end(), outport);

                    std::vector<int> remaining_outports =
                        input_unit->getMulticastRemainingOutports(vc);
                    outport_match |= std::count(remaining_outports.begin(),
                            remaining_outports.end(), outport);
                }

                if (outport_match)
                    return false;
            }
        }
    }

    return true;
}

// Assign a free VC to the winner of the output port.
int
SwitchAllocator::vc_allocate(int outport, int inport, int invc)
{
    auto input_unit = m_router->getInputUnit(inport);

    // Select a free VC from the output port
    int outvc =
        m_router->getOutputUnit(outport)->select_free_vc(get_vnet(invc),
                input_unit->peekTopFlit(invc)->getPacketID());

    // has to get a valid VC since it checked before performing SA
    assert(outvc != -1);

    if (input_unit->isMulticast(invc)) {
        DPRINTF(GarnetMulticast, "Router[%d]: VCAllocator: granted VC %d at "
               "outport %d (%s) to Flit: PktID=%d Id=%d from VC %d at "
               "inport %d (%s)\n",
               m_router->get_id(), outvc, outport,
               m_router->getOutportDirection(outport),
               input_unit->peekTopFlit(invc)->getPacketID(),
               input_unit->peekTopFlit(invc)->get_id(),
               invc, inport, input_unit->get_direction());

        input_unit->grantMulticastOutvc(invc, outport, outvc);
    } else {
        input_unit->grant_outvc(invc, outvc);
    }
    return outvc;
}

// Wakeup the router next cycle to perform SA again
// if there are flits ready.
void
SwitchAllocator::check_for_wakeup()
{
    Tick nextCycle = m_router->clockEdge(Cycles(1));

    if (m_router->alreadyScheduled(nextCycle)) {
        return;
    }

    for (int i = 0; i < m_num_inports; i++) {
        for (int j = 0; j < m_num_vcs; j++) {
            if (m_router->getInputUnit(i)->need_stage(j, SA_, nextCycle)) {
                m_router->schedule_wakeup(Cycles(1));
                return;
            }
        }
    }
}

int
SwitchAllocator::get_vnet(int invc)
{
    int vnet = invc/m_vc_per_vnet;
    assert(vnet < m_router->get_num_vnets());
    return vnet;
}


// Clear the request vector within the allocator at end of SA-II.
// Was populated by SA-I.
void
SwitchAllocator::clear_request_vector()
{
    for (int i = 0; i < m_num_outports; i++) {
        for (int j = 0; j < m_num_inports; j++) {
            m_port_requests[i][j] = false;
        }
    }
}

void
SwitchAllocator::resetStats()
{
    m_input_arbiter_activity = 0;
    m_output_arbiter_activity = 0;
    prepushFilterActivity = 0;
}
