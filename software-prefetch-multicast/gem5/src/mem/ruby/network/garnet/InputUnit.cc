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


#include "mem/ruby/network/garnet/InputUnit.hh"

#include "debug/GarnetMulticast.hh"
#include "debug/PrepushFilter.hh"
#include "debug/RubyNetwork.hh"
#include "mem/ruby/common/IntVec.hh"
#include "mem/ruby/network/garnet/Credit.hh"
#include "mem/ruby/network/garnet/PrepushFilter.hh"
#include "mem/ruby/network/garnet/Router.hh"

using namespace std;

InputUnit::InputUnit(int id, PortDirection direction, Router *router)
  : Consumer(router), m_router(router), m_id(id), m_direction(direction),
    m_vc_per_vnet(m_router->get_vc_per_vnet())
{
    const int m_num_vcs = m_router->get_num_vcs();
    m_num_buffer_reads.resize(m_num_vcs/m_vc_per_vnet);
    m_num_buffer_writes.resize(m_num_vcs/m_vc_per_vnet);
    for (int i = 0; i < m_num_buffer_reads.size(); i++) {
        m_num_buffer_reads[i] = 0;
        m_num_buffer_writes[i] = 0;
    }

    int num_data_flits = (int) divCeil((float)
            m_router->get_net_ptr()->getDataMessageSize(),
            (float) m_router->get_net_ptr()->getNiFlitSize());
    int num_ctrl_flits = (int) divCeil((float)
            m_router->get_net_ptr()->getCtrlMessageSize(),
            (float) m_router->get_net_ptr()->getNiFlitSize());

    // Instantiating the virtual channels
    virtualChannels.reserve(m_num_vcs);
    for (int i=0; i < m_num_vcs; i++) {
        virtualChannels.emplace_back();

        int vnet = i / m_vc_per_vnet;
        if (m_router->get_net_ptr()->get_vnet_type(vnet) == DATA_VNET_)
            virtualChannels[i].setPacketSize(num_data_flits);
        else
            virtualChannels[i].setPacketSize(num_ctrl_flits);
    }
}

/*
 * The InputUnit wakeup function reads the input flit from its input link.
 * Each flit arrives with an input VC.
 * For HEAD/HEAD_TAIL flits, performs route computation,
 * and updates route in the input VC.
 * The flit is buffered for (m_latency - 1) cycles in the input VC
 * and marked as valid for SwitchAllocation starting that cycle.
 *
 */

void
InputUnit::wakeup()
{
    flit *t_flit;
    if (m_in_link->isReady(curTick())) {

        t_flit = m_in_link->consumeLink();
        DPRINTF(RubyNetwork, "Router[%d] Consuming:%s Width: %d Flit:%s\n",
                m_router->get_id(), m_in_link->name(),
                m_router->getBitWidth(), *t_flit);
        assert(t_flit->m_width == m_router->getBitWidth());
        int vc = t_flit->get_vc();
        t_flit->increment_hops(); // for stats

        // Buffer the flit
        virtualChannels[vc].insertFlit(t_flit);

        int vnet = vc/m_vc_per_vnet;

        if ((t_flit->get_type() == HEAD_) ||
            (t_flit->get_type() == HEAD_TAIL_)) {

            assert(virtualChannels[vc].get_state() == IDLE_);
            set_vc_active(vc, curTick());

            assert(!virtualChannels[vc].isMulticast());
            assert(virtualChannels[vc].getMulticastOutports().empty());
            assert(virtualChannels[vc].
                    getMulticastRemainingOutports().empty());
            assert(virtualChannels[vc].getMulticastOutportOutvcMap().empty());

            if (t_flit->isMulticast()) {
                // Route computation for multicast packet
                vector<int> outports = m_router->multicastRouteCompute(
                        t_flit->getRoute(), m_id, m_direction, vnet);

                std::map<int, RouteInfo> outport_route_map =
                    t_flit->get_route().outportRouteMap;

                std::ostringstream oss;
                oss << "{";
                for (auto outport: outports)
                    oss << outport << " ("
                        << m_router->getOutportDirection(outport) << "): {"
                        << outport_route_map[outport].destRouters << " } ";
                oss << "}";

                DPRINTF(GarnetMulticast, "Router[%d]: InputUnit %d (%s): "
                        "computed routes for multicast packet: Flit:%s, "
                        "outports: %s\n",
                        m_router->get_id(), m_id, m_direction,
                        *t_flit, oss.str());

                // Update output ports in VC
                // All flits in this packet will be replicated and sent to the
                // computed output port(s)
                grantMulticastOutports(vc, outports,
                        t_flit->get_route().demandOutports,
                        t_flit->get_route().outportRouteMap,
                        t_flit->getMsgPtrsMap());

                // register prepush filter for prepush packet
                assert(!t_flit->isReadRequest());
                if (m_router->isPrepushFilterEnabled() &&
                        t_flit->isPrepush()) {
                    for (auto outport: outports) {
                        auto prepush_filter =
                            m_router->getPrepushFilter(outport);
                        prepush_filter->registerPrepush(t_flit->getAddr(),
                                outport_route_map[outport].net_dest,
                                m_id, vc);

                        DPRINTF(PrepushFilter, "Router[%d]: InputUnit %d (%s)"
                                ": register prepush in PrepushFilter %d (%s) "
                                "for address %#x, destinations %s\n",
                                m_router->get_id(), m_id, m_direction,
                                outport,
                                m_router->getOutportDirection(outport),
                                t_flit->getAddr(),
                                outport_route_map[outport].net_dest);
                    }
                }
            } else {
                // Route computation for this vc
                int outport = m_router->route_compute(t_flit->get_route(),
                        m_id, m_direction, vnet);

                if (m_router->isPrepushFilterEnabled() &&
                        t_flit->isPrepush()) {
                    auto prepush_filter = m_router->getPrepushFilter(outport);
                    prepush_filter->registerPrepush(t_flit->getAddr(),
                            t_flit->getRoute().net_dest, m_id, vc);

                    DPRINTF(PrepushFilter, "Router[%d]: InputUnit %d (%s): "
                            "register prepush in PrepushFilter %d (%s) for "
                            "address %#x, destinations %s\n",
                            m_router->get_id(), m_id, m_direction,
                            outport, m_router->getOutportDirection(outport),
                            t_flit->getAddr(), t_flit->getRoute().net_dest);
                }

                // Update output port in VC
                // All flits in this packet will use this output port
                // The outport field in the flit is updated after it wins SA
                grant_outport(vc, outport);
            }
        } else {
            assert(virtualChannels[vc].get_state() == ACTIVE_);

            if (isMulticast(vc)) {
                DPRINTF(GarnetMulticast, "Router[%d]: InputUnit %d (%s): "
                        "received a new multicast" " Flit:%s\n",
                        m_router->get_id(), m_id, m_direction, *t_flit);
            }
        }

        // number of writes same as reads
        // any flit that is written will be read only once
        m_num_buffer_writes[vnet]++;
        m_num_buffer_reads[vnet]++;

        Cycles pipe_stages = m_router->get_pipe_stages();
        if (pipe_stages == 1) {
            // 1-cycle router
            // Flit goes for SA directly
            t_flit->advance_stage(SA_, curTick());
        } else {
            assert(pipe_stages > 1);
            // Router delay is modeled by making flit wait in buffer for
            // (pipe_stages cycles - 1) cycles before going for SA

            Cycles wait_time = pipe_stages - Cycles(1);
            t_flit->advance_stage(SA_, m_router->clockEdge(wait_time));

            // Wakeup the router in that cycle to perform SA
            m_router->schedule_wakeup(Cycles(wait_time));
        }

        if (m_in_link->isReady(curTick())) {
            m_router->schedule_wakeup(Cycles(1));
        }
    }
}

// Send a credit back to upstream router for this VC.
// Called by SwitchAllocator when the flit in this VC wins the Switch.
void
InputUnit::increment_credit(int in_vc, bool free_signal, Tick curTime)
{
    DPRINTF(RubyNetwork, "Router[%d]: InputUnit %d (%s): Sending a credit "
            "vc:%d free:%d to %s\n",
            m_router->get_id(), m_id, m_direction,
            in_vc, free_signal, m_credit_link->name());
    Credit *t_credit = new Credit(in_vc, free_signal, curTime);
    creditQueue.insert(t_credit);
    m_credit_link->scheduleEventAbsolute(m_router->clockEdge(Cycles(1)));
}

std::string
InputUnit::printInputString(int vnet) const
{
    ostringstream oss;;

    int vc_start = 0;
    int vc_end = m_router->get_num_vcs();

    if (vnet == -1) {
        oss << "    - InputUnit[" << m_id << "] (" << m_direction << "):\n";
    } else if (vnet >= 0 && vnet < m_router->get_num_vnets()) {
        vc_start = m_vc_per_vnet * vnet;
        vc_end = vc_start + m_vc_per_vnet;
        oss << "    - InputUnit[" << m_id << "] (" << m_direction
            << ") virtual network " << vnet << ":\n";
    } else {
        oss << "Unknown vnet " << vnet << "!\n";
        return oss.str();
    }

    for (int vc = vc_start; vc < vc_end; vc++)
        oss << virtualChannels[vc].printVCString(vc);

    return oss.str();
}

bool
InputUnit::functionalRead(Packet *pkt)
{
    for (auto& virtual_channel : virtualChannels) {
        if (virtual_channel.functionalRead(pkt))
            return true;
    }

    return false;
}

uint32_t
InputUnit::functionalWrite(Packet *pkt)
{
    uint32_t num_functional_writes = 0;
    for (auto& virtual_channel : virtualChannels) {
        num_functional_writes += virtual_channel.functionalWrite(pkt);
    }

    return num_functional_writes;
}

void
InputUnit::resetStats()
{
    for (int j = 0; j < m_num_buffer_reads.size(); j++) {
        m_num_buffer_reads[j] = 0;
        m_num_buffer_writes[j] = 0;
    }
}
