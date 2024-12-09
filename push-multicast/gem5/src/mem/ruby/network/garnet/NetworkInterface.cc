/*
 * Copyright (c) 2020 Advanced Micro Devices, Inc.
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


#include "mem/ruby/network/garnet/NetworkInterface.hh"

#include <cassert>
#include <cmath>

#include "base/cast.hh"
#include "debug/GarnetMulticast.hh"
#include "debug/PrepushFilter.hh"
#include "debug/RubyNetwork.hh"
#include "mem/ruby/network/MessageBuffer.hh"
#include "mem/ruby/network/garnet/Credit.hh"
#include "mem/ruby/network/garnet/flitBuffer.hh"
#include "mem/ruby/slicc_interface/Message.hh"

using namespace std;

NetworkInterface::NetworkInterface(const Params &p)
  : ClockedObject(p), Consumer(this), m_id(p.id),
    m_virtual_networks(p.virt_nets), m_vc_per_vnet(0),
    m_vc_allocator(m_virtual_networks, 0),
    m_deadlock_threshold(p.garnet_deadlock_threshold),
    vc_busy_counter(m_virtual_networks, 0)
{
    m_stall_count.resize(m_virtual_networks);
    niOutVcs.resize(0);

    for (int m = 0; m < (int) MachineType_NUM; m++) {
        auto mach_type_base_num = MachineType_base_number((MachineType) m);
        auto next_mach_type_base_num =
            MachineType_base_number((MachineType) (m+1));

        if (m_id >= mach_type_base_num && m_id < next_mach_type_base_num)
            machineID = MachineID((MachineType) m,
                    (m_id - mach_type_base_num));
    }

    prunedPrepushPacketIDs.clear();

    coreNIPrepushFilterActivity = 0;
    llcNIPrepushFilterActivity = 0;
}

void
NetworkInterface::addInPort(NetworkLink *in_link,
                              CreditLink *credit_link)
{
    InputPort *newInPort = new InputPort(in_link, credit_link);
    inPorts.push_back(newInPort);
    DPRINTF(RubyNetwork, "Adding input port:%s with vnets %s\n",
    in_link->name(), newInPort->printVnets());

    in_link->setLinkConsumer(this);
    credit_link->setSourceQueue(newInPort->outCreditQueue(), this);
    if (m_vc_per_vnet != 0) {
        in_link->setVcsPerVnet(m_vc_per_vnet);
        credit_link->setVcsPerVnet(m_vc_per_vnet);
    }

}

void
NetworkInterface::addOutPort(NetworkLink *out_link,
                             CreditLink *credit_link,
                             SwitchID router_id, uint32_t consumerVcs)
{
    OutputPort *newOutPort = new OutputPort(out_link, credit_link, router_id);
    outPorts.push_back(newOutPort);

    assert(consumerVcs > 0);
    // We are not allowing different physical links to have different vcs
    // If it is required that the Network Interface support different VCs
    // for every physical link connected to it. Then they need to change
    // the logic within outport and inport.
    if (niOutVcs.size() == 0) {
        m_vc_per_vnet = consumerVcs;
        int m_num_vcs = consumerVcs * m_virtual_networks;
        niOutVcs.resize(m_num_vcs);
        outVcState.reserve(m_num_vcs);
        m_ni_out_vcs_enqueue_time.resize(m_num_vcs);
        // instantiating the NI flit buffers
        for (int i = 0; i < m_num_vcs; i++) {
            m_ni_out_vcs_enqueue_time[i] = Tick(INFINITE_);
            outVcState.emplace_back(i, m_net_ptr, consumerVcs);
        }

        // Reset VC Per VNET for input links already instantiated
        for (auto &iPort: inPorts) {
            NetworkLink *inNetLink = iPort->inNetLink();
            inNetLink->setVcsPerVnet(m_vc_per_vnet);
            credit_link->setVcsPerVnet(m_vc_per_vnet);
        }
    } else {
        fatal_if(consumerVcs != m_vc_per_vnet,
        "%s: Connected Physical links have different vc requests: %d and %d\n",
        name(), consumerVcs, m_vc_per_vnet);
    }

    DPRINTF(RubyNetwork, "OutputPort:%s Vnet: %s\n",
    out_link->name(), newOutPort->printVnets());

    out_link->setSourceQueue(newOutPort->outFlitQueue(), this);
    out_link->setVcsPerVnet(m_vc_per_vnet);
    credit_link->setLinkConsumer(this);
    credit_link->setVcsPerVnet(m_vc_per_vnet);
}

void
NetworkInterface::addNode(vector<MessageBuffer *>& in,
                            vector<MessageBuffer *>& out)
{
    inNode_ptr = in;
    outNode_ptr = out;

    for (auto& it : in) {
        if (it != nullptr) {
            it->setConsumer(this);
        }
    }
}

void
NetworkInterface::dequeueCallback()
{
    // An output MessageBuffer has dequeued something this cycle and there
    // is now space to enqueue a stalled message. However, we cannot wake
    // on the same cycle as the dequeue. Schedule a wake at the soonest
    // possible time (next cycle).
    scheduleEventAbsolute(clockEdge(Cycles(1)));
}

void
NetworkInterface::incrementStats(flit *t_flit)
{
    int vnet = t_flit->get_vnet();

    // Latency
    m_net_ptr->increment_received_flits(vnet);
    Tick network_delay =
        t_flit->get_dequeue_time() -
        t_flit->get_enqueue_time() - cyclesToTicks(Cycles(1));
    Tick src_queueing_delay = t_flit->get_src_delay();
    Tick dest_queueing_delay = (curTick() - t_flit->get_dequeue_time());
    Tick queueing_delay = src_queueing_delay + dest_queueing_delay;

    m_net_ptr->increment_flit_network_latency(network_delay, vnet);
    m_net_ptr->increment_flit_queueing_latency(queueing_delay, vnet);

    if (t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_) {
        m_net_ptr->increment_received_packets(vnet);
        m_net_ptr->increment_packet_network_latency(network_delay, vnet);
        m_net_ptr->increment_packet_queueing_latency(queueing_delay, vnet);
    }

    // Hops
    m_net_ptr->increment_total_hops(t_flit->get_route().hops_traversed);
}

/*
 * The NI wakeup checks whether there are any ready messages in the protocol
 * buffer. If yes, it picks that up, flitisizes it into a number of flits and
 * puts it into an output buffer and schedules the output link. On a wakeup
 * it also checks whether there are flits in the input link. If yes, it picks
 * them up and if the flit is a tail, the NI inserts the corresponding message
 * into the protocol buffer. It also checks for credits being sent by the
 * downstream router.
 */

void
NetworkInterface::wakeup()
{
    std::ostringstream oss;
    for (auto &oPort: outPorts) {
        oss << oPort->routerID() << "[" << oPort->printVnets() << "] ";
    }
    DPRINTF(RubyNetwork, "Network Interface %d connected to router:%s "
            "woke up. Period: %ld\n", m_id, oss.str(), clockPeriod());

    assert(curTick() == clockEdge());
    MsgPtr msg_ptr;
    Tick curTime = clockEdge();

    // Checking for messages coming from the protocol
    // can pick up a message/cycle for each virtual net
    for (int vnet = 0; vnet < inNode_ptr.size(); ++vnet) {
        MessageBuffer *b = inNode_ptr[vnet];
        if (b == nullptr) {
            continue;
        }

        if (b->isReady(curTime)) { // Is there a message waiting
            msg_ptr = b->peekMsgPtr();

            // Check if the message is a Invalidation request, don't process
            // it until all the prepush flits for the same address are sent
            // out from LLC-NI to the network to ensure coherence.
            // Note: LLC-NI is associated with outPrepushFilter.
            if (m_net_ptr->getCoherenceConstraint() != UNORDERED_ &&
                    msg_ptr->isInvRequest() &&
                    outPrepushFilter.find(msg_ptr->getLineAddr()) !=
                    outPrepushFilter.end()) {
                continue;
            }

            // Check if the message is a GetS requst and filter it if a
            // prepush has an entry in the inPrepushFilter (for private
            // cache). This means a prepush response can be used to reply for
            // this request.
            bool filter_msg = checkFilterForRequestFromCoreToNet(msg_ptr) && isPrepushFilterEnabled() && (!isPrepushFilterButNoDrop());

            if (filter_msg) {
                b->dequeue(curTime);

                coreNIPrepushFilterActivity++;
                // TODO: profile message delay for stats
            } else if (flitisizeMessage(msg_ptr, vnet)) {
                b->dequeue(curTime);
            }
        }
    }

    scheduleOutputLink();

    // Check if there are flits stalling a virtual channel. Track if a
    // message is enqueued to restrict ejection to one message per cycle.
    checkStallQueue();

    /*********** Check the incoming flit link **********/
    DPRINTF(RubyNetwork, "Number of input ports: %d\n", inPorts.size());
    for (auto &iPort: inPorts) {
        NetworkLink *inNetLink = iPort->inNetLink();
        if (inNetLink->isReady(curTick())) {
            flit *t_flit = inNetLink->consumeLink();
            DPRINTF(RubyNetwork, "Received flit:%s\n", *t_flit);
            assert(t_flit->m_width == iPort->bitWidth());

            int vnet = t_flit->get_vnet();
            t_flit->set_dequeue_time(curTick());

            // If a head flit is received, register in the filter if it is for
            // a prepush message. Meanwhile, filter waiting GetS requests if
            // the prepush message carries data for the requestor.
            if (t_flit->get_type() == HEAD_ ||
                t_flit->get_type() == HEAD_TAIL_) {

                MsgPtr msg_ptr = t_flit->get_msg_ptr();

                // register prepush in NI and filter to-be-sent filts
                if (msg_ptr->isPrepushMsg()) {
                    bool registered = registerPrepushInCoreNI(t_flit);
                    if (registered && isPrepushFilterEnabled() && (!isPrepushFilterButNoDrop()))
                        filterWaitingGetSFromCoreToNet(msg_ptr);
                }
            }

            // If a tail flit is received, enqueue into the protocol buffers
            // if space is available. Otherwise, exchange non-tail flits for
            // credits.
            if (t_flit->get_type() == TAIL_ ||
                t_flit->get_type() == HEAD_TAIL_) {

                MsgPtr msg_ptr = t_flit->get_msg_ptr();

                // Check if the flit is a GetS request (possbily sent to LLC
                // if not forwarded to a private L1); if so, filter it if
                // an entry is found in the prepush filter (for LLC).
                bool filter_flit = checkFilterForRequestFromNetToLLC(msg_ptr) && (!isPrepushFilterButNoDrop());

                // Check if the message should be dropped if it is a prepush
                bool drop_msg = false;
                if (msg_ptr->isPrepushMsg()) {
                    uint64_t packet_id = t_flit->getPacketID();
                    auto it = prunedPrepushPacketIDs.find(packet_id);
                    if (it != prunedPrepushPacketIDs.end()) {
                        drop_msg = true;
                        prunedPrepushPacketIDs.erase(it);

                        DPRINTF(PrepushFilter, "PrepushFilter: dropping "
                                "redudant prepush for addr %#x with dest %s "
                                "by %s in inPrepushFilter in Core-NI\n",
                                msg_ptr->getLineAddr(),
                                msg_ptr->getDestination().smallestElement(),
                                msg_ptr->getPrepushRequestor());
                    }
                }

                // filter incoming GetS requests if possible
                if ((filter_flit || drop_msg) && isPrepushFilterEnabled()) {
                    if (filter_flit)
                        llcNIPrepushFilterActivity++;

                    // Simply send a credit back since we are not buffering
                    // this flit in the NI
                    Credit *cFlit = new Credit(t_flit->get_vc(),
                                               true, curTick());
                    iPort->sendCredit(cFlit);
                    // Update stats and delete flit pointer
                    incrementStats(t_flit);
                    delete t_flit;
                } else if (!iPort->messageEnqueuedThisCycle &&
                    outNode_ptr[vnet]->areNSlotsAvailable(1, curTime)) {
                    // Space is available. Enqueue to protocol buffer.
                    outNode_ptr[vnet]->enqueue(msg_ptr, curTime,
                                               cyclesToTicks(Cycles(1)));

                    // register prepush in cache filter and perform filtering
                    if (msg_ptr->isPrepushMsg()) {
                        deregisterPrepushInCoreNI(msg_ptr);
                        if(isPrepushFilterEnabled()){
                            registerPrepushInCoreAndFiltering(msg_ptr);
                        }
                    }

                    // Simply send a credit back since we are not buffering
                    // this flit in the NI
                    Credit *cFlit = new Credit(t_flit->get_vc(),
                                               true, curTick());
                    iPort->sendCredit(cFlit);
                    // Update stats and delete flit pointer
                    incrementStats(t_flit);
                    delete t_flit;
                } else {
                    // No space available- Place tail flit in stall queue and
                    // set up a callback for when protocol buffer is dequeued.
                    // Stat update and flit pointer deletion will occur upon
                    // unstall.
                    iPort->m_stall_queue.push_back(t_flit);
                    m_stall_count[vnet]++;

                    outNode_ptr[vnet]->registerDequeueCallback([this]() {
                        dequeueCallback(); });
                }
            } else {
                // Non-tail flit. Send back a credit but not VC free signal.
                Credit *cFlit = new Credit(t_flit->get_vc(), false,
                                               curTick());
                // Simply send a credit back since we are not buffering
                // this flit in the NI
                iPort->sendCredit(cFlit);

                // Update stats and delete flit pointer.
                incrementStats(t_flit);
                delete t_flit;
            }
        }
    }

    /****************** Check the incoming credit link *******/

    for (auto &oPort: outPorts) {
        CreditLink *inCreditLink = oPort->inCreditLink();
        if (inCreditLink->isReady(curTick())) {
            Credit *t_credit = (Credit*) inCreditLink->consumeLink();
            outVcState[t_credit->get_vc()].increment_credit();
            if (t_credit->is_free_signal()) {
                outVcState[t_credit->get_vc()].setState(IDLE_,
                    curTick());
            }
            delete t_credit;
        }
    }


    // It is possible to enqueue multiple outgoing credit flits if a message
    // was unstalled in the same cycle as a new message arrives. In this
    // case, we should schedule another wakeup to ensure the credit is sent
    // back.
    for (auto &iPort: inPorts) {
        if (iPort->outCreditQueue()->getSize() > 0) {
            DPRINTF(RubyNetwork, "Sending a credit %s via %s at %ld\n",
            *(iPort->outCreditQueue()->peekTopFlit()),
            iPort->outCreditLink()->name(), clockEdge(Cycles(1)));
            iPort->outCreditLink()->
                scheduleEventAbsolute(clockEdge(Cycles(1)));
        }
    }

    deregisterPrepushInLLCNI();

    checkReschedule();
}

void
NetworkInterface::checkStallQueue()
{
    // Check all stall queues.
    // There is one stall queue for each input link
    for (auto &iPort: inPorts) {
        iPort->messageEnqueuedThisCycle = false;
        Tick curTime = clockEdge();

        if (!iPort->m_stall_queue.empty()) {
            for (auto stallIter = iPort->m_stall_queue.begin();
                 stallIter != iPort->m_stall_queue.end(); ) {
                flit *stallFlit = *stallIter;
                int vnet = stallFlit->get_vnet();

                // If we can now eject to the protocol buffer,
                // send back credits
                if (outNode_ptr[vnet]->areNSlotsAvailable(1, curTime)) {
                    outNode_ptr[vnet]->enqueue(stallFlit->get_msg_ptr(),
                        curTime, cyclesToTicks(Cycles(1)));

                    // deregister prepush in core-NI and register it in core
                    // meanwhile performing filtering
                    MsgPtr msg_ptr = stallFlit->get_msg_ptr();
                    if (msg_ptr->isPrepushMsg()) {
                        deregisterPrepushInCoreNI(msg_ptr);
                        if(isPrepushFilterEnabled()){
                            registerPrepushInCoreAndFiltering(msg_ptr);
                        }
                    }

                    // Send back a credit with free signal now that the
                    // VC is no longer stalled.
                    Credit *cFlit = new Credit(stallFlit->get_vc(), true,
                                                   curTick());
                    iPort->sendCredit(cFlit);

                    // Update Stats
                    incrementStats(stallFlit);

                    // Flit can now safely be deleted and removed from stall
                    // queue
                    delete stallFlit;
                    iPort->m_stall_queue.erase(stallIter);
                    m_stall_count[vnet]--;

                    // If there are no more stalled messages for this vnet, the
                    // callback on it's MessageBuffer is not needed.
                    if (m_stall_count[vnet] == 0)
                        outNode_ptr[vnet]->unregisterDequeueCallback();

                    iPort->messageEnqueuedThisCycle = true;
                    break;
                } else {
                    ++stallIter;
                }
            }
        }
    }
}

// Embed the protocol message into flits
bool
NetworkInterface::flitisizeMessage(MsgPtr msg_ptr, int vnet)
{
    Message *net_msg_ptr = msg_ptr.get();
    NetDest net_msg_dest = net_msg_ptr->getDestination();

    // gets all the destinations associated with this message.
    vector<NodeID> dest_nodes = net_msg_dest.getAllDest();

    // Number of flits is dependent on the link bandwidth available.
    // This is expressed in terms of bytes/cycle or the flit size
    OutputPort *oPort = getOutportForVnet(vnet);
    assert(oPort);
    int num_flits = (int)divCeil((float) m_net_ptr->MessageSizeType_to_int(
        net_msg_ptr->getMessageSize()), (float)oPort->bitWidth());

    DPRINTF(RubyNetwork, "Message Size:%d vnet:%d bitWidth:%d\n",
        m_net_ptr->MessageSizeType_to_int(net_msg_ptr->getMessageSize()),
        vnet, oPort->bitWidth());

    if (!m_net_ptr->isMulticastEnabled() || dest_nodes.size() == 1) {
        // loop to convert all multicast messages into unicast messages
        for (int ctr = 0; ctr < dest_nodes.size(); ctr++) {

            // this will return a free output virtual channel
            int vc = calculateVC(vnet);

            if (vc == -1) {
                return false ;
            }
            MsgPtr new_msg_ptr = msg_ptr->clone();
            NodeID destID = dest_nodes[ctr];

            Message *new_net_msg_ptr = new_msg_ptr.get();
            if (dest_nodes.size() > 1) {
                NetDest personal_dest;
                for (int m = 0; m < (int) MachineType_NUM; m++) {
                    auto mach_type_base_num =
                        MachineType_base_number((MachineType) m);
                    auto next_mach_type_base_num =
                        MachineType_base_number((MachineType) (m+1));
                    if (destID >= mach_type_base_num &&
                            destID < next_mach_type_base_num) {
                        // calculating the NetDest associated with this destID
                        personal_dest.clear();
                        personal_dest.add((MachineID) {(MachineType) m,
                                (destID - mach_type_base_num)});
                        new_net_msg_ptr->getDestination() = personal_dest;
                        break;
                    }
                }
                net_msg_dest.removeNetDest(personal_dest);
                // removing the destination from the original message to
                // reflect that a message with this particular destination has
                // been flitisized and an output vc is acquired
                net_msg_ptr->getDestination().removeNetDest(personal_dest);
            }

            // Embed Route into the flits
            // NetDest format is used by the routing table
            // Custom routing algorithms just need destID

            RouteInfo route;
            route.vnet = vnet;
            route.net_dest = new_net_msg_ptr->getDestination();
            route.src_ni = m_id;
            route.src_router = oPort->routerID();
            route.dest_ni = destID;
            route.dest_router = m_net_ptr->get_router_id(destID, vnet);
            route.srcMachID = machineID;

            // initialize hops_traversed to -1
            // so that the first router increments it to 0
            route.hops_traversed = -1;

            // indicate if prepush or not for in-network filtering
            bool prepush = net_msg_ptr->isPrepushMsg();
            bool read_request = net_msg_ptr->isReadRequest();
            Addr addr = net_msg_ptr->getLineAddr();
            assert(!prepush || !read_request);

            // deregister prepush in LLC, then register prepush in NI and
            // filter GetS requests
            if (prepush) {
                deregisterPrepushInLLC(new_msg_ptr);
                bool drop_msg = registerPrepushInLLCNI(new_msg_ptr);
                if (drop_msg)
                    continue;
                if(isPrepushFilterEnabled() && (!isPrepushFilterButNoDrop())){
                    filterStalledGetSFromNetToLLC(new_msg_ptr);
                }
            }

            m_net_ptr->increment_injected_packets(vnet);
            for (int i = 0; i < num_flits; i++) {
                m_net_ptr->increment_injected_flits(vnet);
                flit *fl = new flit(i, vc, vnet, route, num_flits, new_msg_ptr,
                        m_net_ptr->MessageSizeType_to_int(
                            net_msg_ptr->getMessageSize()),
                        oPort->bitWidth(), curTick());

                fl->setReadRequest(read_request);
                fl->setPrepush(prepush);
                fl->setAddr(addr);
                fl->set_src_delay(curTick() - msg_ptr->getTime());
                niOutVcs[vc].insert(fl);
            }

            uint64_t packet_id = niOutVcs[vc].peekTopFlit()->getPacketID();

            m_ni_out_vcs_enqueue_time[vc] = curTick();
            outVcState[vc].setState(ACTIVE_, curTick(), packet_id);
        }
    } else {
        // this will return a free output virtual channel
        int vc = calculateVC(vnet);

        if (vc == -1) {
            return false ;
        }

        map<NodeID, MsgPtr> msg_ptrs_map;
        vector<NetDest> net_dests;
        for (int ctr = 0; ctr < dest_nodes.size(); ctr++) {
            MsgPtr new_msg_ptr = msg_ptr->clone();
            NodeID destID = dest_nodes[ctr];

            Message *new_net_msg_ptr = new_msg_ptr.get();

            NetDest personal_dest;
            for (int m = 0; m < (int) MachineType_NUM; m++) {
                auto mach_type_base_num =
                    MachineType_base_number((MachineType) m);
                auto next_mach_type_base_num =
                    MachineType_base_number((MachineType) (m+1));
                if (destID >= mach_type_base_num &&
                        destID < next_mach_type_base_num) {
                    // calculating the NetDest associated with this destID
                    personal_dest.clear();
                    personal_dest.add((MachineID) {(MachineType) m,
                            (destID - mach_type_base_num)});
                    new_net_msg_ptr->getDestination() = personal_dest;
                    break;
                }
            }
            net_msg_dest.removeNetDest(personal_dest);

            msg_ptrs_map[destID] = new_msg_ptr;
            net_dests.push_back(personal_dest);
        }

        // indicate if prepush or not for in-network filtering
        bool prepush = net_msg_ptr->isPrepushMsg();
        Addr addr = net_msg_ptr->getLineAddr();
        assert(!net_msg_ptr->isReadRequest());

        // deregister prepush in LLC, then register prepush in NI and
        // filter GetS requests
        if (prepush) {
            deregisterPrepushInLLC(msg_ptr);
            bool drop_msg = registerPrepushInLLCNI(msg_ptr);
            if (drop_msg)
                return true;
            if(isPrepushFilterEnabled() && (!isPrepushFilterButNoDrop())){
                filterStalledGetSFromNetToLLC(msg_ptr);
            }
        }

        // Embed Route into the flits
        // NetDest format is used by the routing table
        // Custom routing algorithms just need destID

        RouteInfo route;
        route.vnet = vnet;
        route.net_dest = net_msg_ptr->getDestination();
        route.src_ni = m_id;
        route.src_router = oPort->routerID();
        route.dest_ni = -1; // multicast has multiple destinations
        if (prepush) {
            route.dest_ni = net_msg_ptr->getPrepushRequestor().getNodeID();
            std::vector<NodeID> demand_dest_nis =
                net_msg_ptr->getDemandDests().getAllDest();
            for (auto dest_ni: demand_dest_nis) {
                route.demandDestNIs.insert(dest_ni);
            }
        }
        route.srcMachID = machineID;
        route.dest_router = -1; // multicast has multiple destination routers
        route.destRouters = m_net_ptr->getRouterIDs(dest_nodes, vnet);
        route.destNIs = dest_nodes;
        route.netDests = net_dests;

        // initialize hops_traversed to -1
        // so that the first router increments it to 0
        route.hops_traversed = -1;

        m_net_ptr->increment_injected_packets(vnet);
        for (int i = 0; i < num_flits; i++) {
            m_net_ptr->increment_injected_flits(vnet);
            flit *fl = new flit(i, vc, vnet, route, num_flits, msg_ptr,
                    m_net_ptr->MessageSizeType_to_int(
                        net_msg_ptr->getMessageSize()),
                    oPort->bitWidth(), curTick());

            fl->setPrepush(prepush);
            fl->setAddr(addr);
            fl->setMulticast();
            fl->setMsgPtrsMap(msg_ptrs_map);

            fl->set_src_delay(curTick() - msg_ptr->getTime());
            niOutVcs[vc].insert(fl);
        }

        uint64_t packet_id = niOutVcs[vc].peekTopFlit()->getPacketID();

        m_ni_out_vcs_enqueue_time[vc] = curTick();
        outVcState[vc].setState(ACTIVE_, curTick(), packet_id);
    }

    return true ;
}

// Looking for a free output vc
int
NetworkInterface::calculateVC(int vnet)
{
    for (int i = 0; i < m_vc_per_vnet; i++) {
        int delta = m_vc_allocator[vnet];
        m_vc_allocator[vnet]++;
        if (m_vc_allocator[vnet] == m_vc_per_vnet)
            m_vc_allocator[vnet] = 0;

        if (outVcState[(vnet*m_vc_per_vnet) + delta].isInState(
                    IDLE_, curTick())) {
            vc_busy_counter[vnet] = 0;
            return ((vnet*m_vc_per_vnet) + delta);
        }
    }

    vc_busy_counter[vnet] += 1;
    if (vc_busy_counter[vnet] > m_deadlock_threshold) {
        std::string network_states;
        for (int i = 0; i < m_virtual_networks; i++) {
            network_states += m_net_ptr->printNetworkString(i);
        }

        panic("%s: Possible network deadlock in vnet: %d at time: %llu \n%s",
              name(), vnet, curTick(), network_states);
    }

    return -1;
}

void
NetworkInterface::scheduleOutputPort(OutputPort *oPort)
{
   int vc = oPort->vcRoundRobin();

   for (int i = 0; i < niOutVcs.size(); i++) {
       int t_vnet = get_vnet(vc);
       if (oPort->isVnetSupported(t_vnet)) {
           // model buffer backpressure
           if (niOutVcs[vc].isReady(curTick()) &&
               outVcState[vc].has_credit()) {

               bool is_candidate_vc = true;
               int vc_base = t_vnet * m_vc_per_vnet;

               if (m_net_ptr->isVNetOrdered(t_vnet)) {
                   for (int vc_offset = 0; vc_offset < m_vc_per_vnet;
                        vc_offset++) {
                       int t_vc = vc_base + vc_offset;
                       if (niOutVcs[t_vc].isReady(curTick())) {
                           if (m_ni_out_vcs_enqueue_time[t_vc] <
                               m_ni_out_vcs_enqueue_time[vc]) {
                               is_candidate_vc = false;
                               break;
                           }
                       }
                   }
               }
               if (!is_candidate_vc) {
                   vc++;
                   if (vc == niOutVcs.size())
                       vc = 0;

                   continue;
               }

               outVcState[vc].decrement_credit();

               // Just removing the top flit
               flit *t_flit = niOutVcs[vc].getTopFlit();
               t_flit->set_time(clockEdge(Cycles(1)));

               // Scheduling the flit
               scheduleFlit(t_flit);

               if (m_net_ptr->holdSwitchForMulticastOnly()) {
                   if (t_flit->get_type() == HEAD_ && t_flit->isMulticast()) {
                       oPort->vcRoundRobin(vc);
                   } else if (!t_flit->isMulticast() ||
                           t_flit->get_type() == TAIL_ ||
                           t_flit->get_type() == HEAD_TAIL_) {
                       // Update the round robin arbiter
                       vc++;
                       if (vc == niOutVcs.size())
                           vc = 0;
                       oPort->vcRoundRobin(vc);

                       if (t_flit->get_type() == TAIL_ ||
                               t_flit->get_type() == HEAD_TAIL_) {
                           m_ni_out_vcs_enqueue_time[vc] = Tick(INFINITE_);
                       }
                   }
               } else {
                   if (t_flit->get_type() == HEAD_) {
                       oPort->vcRoundRobin(vc);
                   } else if (t_flit->get_type() == TAIL_ ||
                           t_flit->get_type() == HEAD_TAIL_) {
                       m_ni_out_vcs_enqueue_time[vc] = Tick(INFINITE_);

                       // Update the round robin arbiter
                       vc++;
                       if (vc == niOutVcs.size())
                           vc = 0;
                       oPort->vcRoundRobin(vc);
                   }
               }

               // Done with this port, continue to schedule
               // other ports
               return;
           }
       }

       vc++;
       if (vc == niOutVcs.size())
           vc = 0;
   }
}

/** This function checks if a prepush has an entry the inPrepushFilter
 * assocated with the private cache. If so, it means this message can be
 * dropped as the registered prepush response can be used to reply for this
 * request.
 */

bool
NetworkInterface::checkFilterForRequestFromCoreToNet(MsgPtr msg_ptr)
{
    if (!msg_ptr->isReadRequest())
        return false;

    Addr addr = msg_ptr->getLineAddr();
    if (inPrepushFilter.find(addr) != inPrepushFilter.end()) {
        MachineID requestor = msg_ptr->getRequestor();

        if (inPrepushFilter[addr].isElement(requestor)) {
            DPRINTF(PrepushFilter, "PrepushFilter: request from %s for addr "
                    "%#x is filtered by inPrepushFilter in Core-NI\n",
                    requestor, addr);

            return true;
        }
    }

    return false;
}

bool
NetworkInterface::registerPrepushInLLCNI(MsgPtr msg_ptr)
{
    Addr addr = msg_ptr->getLineAddr();
    NetDest &net_dest = msg_ptr->getDestination();
    NetDest redundant_net_dest;

    auto it = outPrepushFilter.find(addr);

    if (it == outPrepushFilter.end()) {
        outPrepushFilter[addr] = net_dest;
    } else {
        // remove the redundant prepush destinations
        redundant_net_dest = net_dest.AND(outPrepushFilter[addr]);

        if (!redundant_net_dest.isEmpty()) {
            DPRINTF(PrepushFilter, "PrepushFilter: prune redundant prepush "
                    "dest %s from %s for addr %#x by %s with existing entry "
                    "%s in outPrepushFilter in LLC-NI\n",
                    addr, redundant_net_dest, net_dest,
                    msg_ptr->getPrepushRequestor(), outPrepushFilter[addr]);
        }

        net_dest.removeNetDest(redundant_net_dest);

        if (net_dest.isEmpty()) {
            DPRINTF(PrepushFilter, "PrepushFilter: all prepush dest %s for "
                    "addr %#x by %s are redundant in outPrepushFilter (%s) in"
                    " LLC-NI, drop it\n",
                    redundant_net_dest, addr, msg_ptr->getPrepushRequestor(),
                    outPrepushFilter[addr]);

            return true;
        }

        outPrepushFilter[addr].addNetDest(net_dest);
    }

    DPRINTF(PrepushFilter, "PrepushFilter: register prepush for addr %#x by "
            "%s (dest %s) in outPrepushFilter in LLC-NI, updated dest %s\n",
            addr, msg_ptr->getPrepushRequestor(), net_dest,
            outPrepushFilter[addr]);

    return false;
}

void
NetworkInterface::filterStalledGetSFromNetToLLC(MsgPtr msg_ptr)
{
    Addr addr = msg_ptr->getLineAddr();
    NetDest net_dest = msg_ptr->getDestination();
    NetDest &demand_dests = msg_ptr->getDemandDests();

    // filter incoming GetS requests stalled in NI
    for (auto &iPort: inPorts) {
        if (!iPort->m_stall_queue.empty()) {

            vector<unsigned> filtered_positions;
            unsigned pos = 0;

            for (auto it = iPort->m_stall_queue.begin();
                    it != iPort->m_stall_queue.end(); it++) {
                flit *stall_flit = *it;

                MsgPtr msg_ptr = stall_flit->get_msg_ptr();
                if (msg_ptr->isReadRequest()) {
                    MachineID requestor = msg_ptr->getRequestor();

                    if (msg_ptr->getLineAddr() == addr &&
                            net_dest.isElement(requestor)) {
                        filtered_positions.push_back(pos);

                        demand_dests.add(requestor);
                    }
                }

                pos++;
            }

            int filtered_num = filtered_positions.size();

            if (filtered_num >  0) {
                llcNIPrepushFilterActivity += filtered_num;

                for (auto i = 0; i < filtered_num; i++) {
                    auto iter = iPort->m_stall_queue.begin() +
                        filtered_positions[i] - i;

                    DPRINTF(PrepushFilter, "PrepushFilter: request from %s "
                            "for addr %#x is filtered by prepush initiated "
                            "by %s in LLC-NI\n",
                            (*iter)->get_msg_ptr()->getRequestor(),
                            (*iter)->get_msg_ptr()->getLineAddr(),
                            msg_ptr->getPrepushRequestor());

                    iPort->m_stall_queue.erase(iter);

                    // TODO: profile message delay for stats
                }
            }
        }
    }
}

bool
NetworkInterface::checkFilterForRequestFromNetToLLC(MsgPtr msg_ptr)
{
    if (!msg_ptr->isReadRequest())
        return false;

    Addr addr = msg_ptr->getLineAddr();
    auto it = outPrepushFilter.find(addr);

    if (it != outPrepushFilter.end()) {
        MachineID requestor = msg_ptr->getRequestor();

        if (outPrepushFilter[addr].isElement(requestor)) {
            DPRINTF(PrepushFilter, "PrepushFilter: request from %s for addr "
                    "%#x is filtered by outPrepushFilter in LLC-NI\n",
                    requestor, addr);

            // TODO: profile message delay for stats

            return true;
        }
    }

    return false;
}

void
NetworkInterface::registerPrepushInCoreAndFiltering(MsgPtr msg_ptr)
{
    NetDest net_dest = msg_ptr->getDestination();
    MachineID initiator = msg_ptr->getPrepushRequestor();

    if (!net_dest.isElement(initiator)) {
        Addr addr = msg_ptr->getLineAddr();

        inNode_ptr[requestVnet]->registerPrepush(addr, net_dest, initiator);
        inNode_ptr[requestVnet]->filterGetSRequestors(addr, net_dest,
                msg_ptr->getDemandDests(), initiator, curTick(), false);

        // faciliate prepush invalidation ordering for coherence
        if (m_net_ptr->getCoherenceConstraint() != UNORDERED_) {
            outNode_ptr[forwardRequestVnet]->insertPrepushAddr(addr, net_dest,
                    initiator);
        }
    }
}

bool
NetworkInterface::registerPrepushInCoreNI(flit *t_flit)
{
    MsgPtr msg_ptr = t_flit->get_msg_ptr();
    NetDest net_dest = msg_ptr->getDestination();
    MachineID initiator = msg_ptr->getPrepushRequestor();

    if (net_dest.isElement(initiator))
        return false;

    Addr addr = msg_ptr->getLineAddr();

    if (inPrepushFilter.find(addr) != inPrepushFilter.end()) {
        assert(inPrepushFilter[addr].smallestElement() ==
                net_dest.smallestElement());

        DPRINTF(PrepushFilter, "PrepushFilter: prune and drop redudant "
                "prepush for addr %#x with dest %s by %s in inPrepushFilter "
                "in Core-NI\n", addr, net_dest.smallestElement(), initiator);

        prunedPrepushPacketIDs.insert(t_flit->getPacketID());

        return false;
    }

    assert(net_dest.count() == 1);

    inPrepushFilter[addr] = net_dest;
    DPRINTF(PrepushFilter, "PrepushFilter: register prepush for addr %#x with"
            " dest %s by %s in inPrepushFilter in Core-NI\n",
            addr, net_dest.smallestElement(), initiator);

    return true;
}

void
NetworkInterface::filterWaitingGetSFromCoreToNet(MsgPtr msg_ptr)
{
    int base_vc = requestVnet * m_vc_per_vnet;
    Addr addr = msg_ptr->getLineAddr();
    NetDest net_dest = msg_ptr->getDestination();

    for (int vc = base_vc; vc < base_vc + m_vc_per_vnet; vc++)
    {
        // check and filter GetS flit
        if (!niOutVcs[vc].isEmpty()) {

            flit *t_flit = niOutVcs[vc].peekTopFlit();

            MsgPtr req_msg_ptr = t_flit->get_msg_ptr();
            MachineID requestor = req_msg_ptr->getRequestor();
            if (req_msg_ptr->isReadRequest() &&
                    req_msg_ptr->getLineAddr() == addr &&
                    net_dest.isElement(requestor)) {

                DPRINTF(PrepushFilter, "PrepushFilter: requestor from %s for"
                        " addr %#x is filtered by prepush initiated by %s in"
                        " Core-NI\n",
                        requestor, addr, msg_ptr->getPrepushRequestor());

                // filter flit
                niOutVcs[vc].getTopFlit();
                // reset VC state
                outVcState[vc].setState(IDLE_, curTick());

                coreNIPrepushFilterActivity++;
            }
        }
    }
}

void
NetworkInterface::deregisterPrepushInCoreNI(MsgPtr msg_ptr)
{
    NetDest net_dest = msg_ptr->getDestination();
    MachineID initiator = msg_ptr->getPrepushRequestor();

    if (net_dest.isElement(initiator))
        return;

    Addr addr = msg_ptr->getLineAddr();
    auto it = inPrepushFilter.find(addr);

    panic_if(it == inPrepushFilter.end(), "%s: inPrepushFilter: entry not "
            "found for addr %#x while deregistering\n", name(), addr);

    DPRINTF(PrepushFilter, "PrepushFilter: deregister prepush dest %s for "
            "addr %#x initiated by %s and remove entry from inPrepushFilter "
            "in Core-NI\n",
            net_dest, addr, msg_ptr->getPrepushRequestor());

    inPrepushFilter.erase(it);
}

void
NetworkInterface::deregisterPrepushInLLC(MsgPtr msg_ptr)
{
    Addr addr = msg_ptr->getLineAddr();
    NetDest net_dest = msg_ptr->getDestination();
    MachineID initiator = msg_ptr->getPrepushRequestor();

    bool erase = outNode_ptr[requestVnet]->deregisterPrepush(addr, net_dest,
                                                             initiator);
    if (erase && m_net_ptr->getCoherenceConstraint() != UNORDERED_) {
        inNode_ptr[forwardRequestVnet]->erasePrepushAddr(addr, initiator);
    }
}

// Remove after link traversal to accommodate the link latency.
void
NetworkInterface::deregisterPrepushInLLCNIAtTime(MsgPtr msg_ptr)
{
    Addr addr = msg_ptr->getLineAddr();
    NetDest net_dest = msg_ptr->getDestination();
    MachineID initiator = msg_ptr->getPrepushRequestor();

    pendingDeregisterPrepushBuffer.push_back(
            PendingDeregisterPrepush(clockEdge(Cycles(3)),
                                     addr, net_dest, initiator));

    DPRINTF(PrepushFilter, "PrepushFilter: schedule to deregister prepush for"
            " addr %#x dest %s initiated by %s from outPrepushFilter in "
            "LLC-NI at tick %ld, current registered dest %s\n",
            addr, net_dest, initiator, clockEdge(Cycles(3)),
            outPrepushFilter[addr]);
}

void
NetworkInterface::deregisterPrepushInLLCNI()
{
    while (!pendingDeregisterPrepushBuffer.empty()) {
        auto pending_entry = pendingDeregisterPrepushBuffer[0];

        if (pending_entry.deregisterTime <= curTick()) {
            Addr addr = pending_entry.addr;
            NetDest net_dest = pending_entry.netDest;

            auto it = outPrepushFilter.find(addr);

            if (it != outPrepushFilter.end()){
                it->second.removeNetDest(net_dest);
                pendingDeregisterPrepushBuffer.pop_front();

                DPRINTF(PrepushFilter, "PrepushFilter: deregister prepush dest %s"
                        " for addr %#x initiated by %s in outPrepushFilter in "
                        "LLC-NI, remaning dest %s\n",
                        net_dest, addr, pending_entry.initiator, it->second);

                if (it->second.isEmpty()) {
                    DPRINTF(PrepushFilter, "PrepushFilter: remove prepush entry "
                            "for addr %#x from outPrepushFilter in LLC-NI\n",
                            addr);
                    outPrepushFilter.erase(it);
                }
            }
        } else {
            break;
        }
    }
}

uint64_t
NetworkInterface::getCorePrepushFilterActivity()
{
    uint64_t counter = 0;

    if (inNode_ptr.size() > 0 && inNode_ptr[requestVnet] != nullptr)
        counter = inNode_ptr[requestVnet]->getPrepushFilterActivity();

    return counter;
}

uint64_t
NetworkInterface::getLLCPrepushFilterActivity()
{
    uint64_t counter = 0;

    if (outNode_ptr.size() > 0 && outNode_ptr[requestVnet] != nullptr)
        counter = outNode_ptr[requestVnet]->getPrepushFilterActivity();

    return counter;
}

/** This function looks at the NI buffers
 *  if some buffer has flits which are ready to traverse the link in the next
 *  cycle, and the downstream output vc associated with this flit has buffers
 *  left, the link is scheduled for the next cycle
 */

void
NetworkInterface::scheduleOutputLink()
{
    // Schedule each output link
    for (auto &oPort: outPorts) {
        scheduleOutputPort(oPort);
    }
}

NetworkInterface::InputPort *
NetworkInterface::getInportForVnet(int vnet)
{
    for (auto &iPort : inPorts) {
        if (iPort->isVnetSupported(vnet)) {
            return iPort;
        }
    }

    return nullptr;
}

/*
 * This function returns the outport which supports the given vnet.
 * Currently, HeteroGarnet does not support multiple outports to
 * support same vnet. Thus, this function returns the first-and
 * only outport which supports the vnet.
 */
NetworkInterface::OutputPort *
NetworkInterface::getOutportForVnet(int vnet) const
{
    for (auto &oPort : outPorts) {
        if (oPort->isVnetSupported(vnet)) {
            return oPort;
        }
    }

    return nullptr;
}
void
NetworkInterface::scheduleFlit(flit *t_flit)
{
    OutputPort *oPort = getOutportForVnet(t_flit->get_vnet());

    if (oPort) {
        MsgPtr msg_ptr = t_flit->get_msg_ptr();

        if (t_flit->isMulticast()) {
            DPRINTF(GarnetMulticast, "Scheduling at %s time:%ld multicast "
                    "flit:%s Message:%s\n", oPort->outNetLink()->name(),
                    clockEdge(Cycles(1)), *t_flit, *msg_ptr);
        } else {
            DPRINTF(RubyNetwork, "Scheduling at %s time:%ld flit:%s "
                    "Message:%s\n", oPort->outNetLink()->name(),
                    clockEdge(Cycles(1)), *t_flit, *msg_ptr);
        }
        oPort->outFlitQueue()->insert(t_flit);
        oPort->outNetLink()->scheduleEventAbsolute(clockEdge(Cycles(1)));

        if ((t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_)
                && msg_ptr->isPrepushMsg())
            deregisterPrepushInLLCNIAtTime(msg_ptr);

        return;
    }

    panic("No output port found for vnet:%d\n", t_flit->get_vnet());
    return;
}

int
NetworkInterface::get_vnet(int vc)
{
    for (int i = 0; i < m_virtual_networks; i++) {
        if (vc >= (i*m_vc_per_vnet) && vc < ((i+1)*m_vc_per_vnet)) {
            return i;
        }
    }
    fatal("Could not determine vc");
}


// Wakeup the NI in the next cycle if there are waiting
// messages in the protocol buffer, or waiting flits in the
// output VC buffer.
// Also check if we have to reschedule because of a clock period
// difference.
void
NetworkInterface::checkReschedule()
{
    for (const auto& it : inNode_ptr) {
        if (it == nullptr) {
            continue;
        }

        while (it->isReady(clockEdge())) { // Is there a message waiting
            scheduleEvent(Cycles(1));
            return;
        }
    }

    for (auto& ni_out_vc : niOutVcs) {
        if (ni_out_vc.isReady(clockEdge(Cycles(1)))) {
            scheduleEvent(Cycles(1));
            return;
        }
    }

    // Check if any input links have flits to be popped.
    // This can happen if the links are operating at
    // a higher frequency.
    for (auto &iPort : inPorts) {
        NetworkLink *inNetLink = iPort->inNetLink();
        if (inNetLink->isReady(curTick())) {
            scheduleEvent(Cycles(1));
            return;
        }
    }

    for (auto &oPort : outPorts) {
        CreditLink *inCreditLink = oPort->inCreditLink();
        if (inCreditLink->isReady(curTick())) {
            scheduleEvent(Cycles(1));
            return;
        }
    }

    // Check if any prepush need to deregister in the filter with LLC.
    if (!pendingDeregisterPrepushBuffer.empty()) {
        scheduleEvent(Cycles(1));
        return;
    }
}

void
NetworkInterface::print(std::ostream& out) const
{
    out << "[Network Interface]";
}

std::string
NetworkInterface::printNIString(int vnet)  const
{
    std::ostringstream oss;

    int vc_start = 0;
    int vc_end = m_vc_per_vnet * m_virtual_networks;
    if (vnet == -1) {
        oss << "  - NI[" << m_id << "]:\n";
    } else if (vnet >= 0 && vnet < m_virtual_networks) {
        vc_start = m_vc_per_vnet * vnet;
        vc_end = vc_start + m_vc_per_vnet;
        OutputPort *oPort = getOutportForVnet(vnet);
        oss << "  - NI[" << m_id << "] " << "virtual network " << vnet
            << " Router[" << oPort->routerID() << "]:\n";
    } else {
        oss << "Unknown vnet " << vnet << "!\n";
        return oss.str();
    }

    for (int outvc = vc_start; outvc < vc_end; outvc++) {
        oss << outVcState[outvc].printOutVcStateString();
    }

    return oss.str();
}

bool
NetworkInterface::functionalRead(Packet *pkt)
{
    for (auto& ni_out_vc : niOutVcs) {
        if (ni_out_vc.functionalRead(pkt))
            return true;
    }

    for (auto &oPort: outPorts) {
        if (oPort->outFlitQueue()->functionalRead(pkt))
            return true;
    }
    return false;
}

uint32_t
NetworkInterface::functionalWrite(Packet *pkt)
{
    uint32_t num_functional_writes = 0;
    for (auto& ni_out_vc : niOutVcs) {
        num_functional_writes += ni_out_vc.functionalWrite(pkt);
    }

    for (auto &oPort: outPorts) {
        num_functional_writes += oPort->outFlitQueue()->functionalWrite(pkt);
    }
    return num_functional_writes;
}
