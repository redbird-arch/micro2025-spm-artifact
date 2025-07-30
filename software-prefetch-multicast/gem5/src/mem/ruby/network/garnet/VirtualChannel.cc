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


#include "mem/ruby/network/garnet/VirtualChannel.hh"

#include "mem/ruby/common/IntVec.hh"

VirtualChannel::VirtualChannel()
  : inputBuffer(), m_vc_state(IDLE_, Tick(0)), m_output_port(-1),
    m_enqueue_time(INFINITE_), packetID(0), m_output_vc(-1), multicast(false),
    multicastNthFlit(0), pktSize(0), toBeFiltered(false)
{
}

void
VirtualChannel::set_idle(Tick curTime)
{
    m_vc_state.first = IDLE_;
    m_vc_state.second = curTime;
    m_enqueue_time = Tick(INFINITE_);
    m_output_port = -1;
    m_output_vc = -1;
    packetID = 0;
    toBeFiltered = false;
}

void
VirtualChannel::set_active(Tick curTime)
{
    m_vc_state.first = ACTIVE_;
    m_vc_state.second = curTime;
    m_enqueue_time = curTime;
    packetID = inputBuffer.peekTopFlit()->getPacketID();
}

bool
VirtualChannel::need_stage(flit_stage stage, Tick time)
{
    // If not multicast data packet/flit, multicastNthFlit will always be 0.
    // In these cases, it is always checking the first flit of the
    // inputBuffer, and peekNthFlit() is essentially peekTopFlit().
    if (inputBuffer.isReady(time, multicastNthFlit)) {
        assert(m_vc_state.first == ACTIVE_ && m_vc_state.second <= time);
        flit *t_flit = inputBuffer.peekNthFlit(multicastNthFlit);
        return(t_flit->is_stage(stage, time));
    }
    return false;
}

void
VirtualChannel::setMulticastOutports(std::vector<int> outports,
        std::set<int> demand_outports,
        std::map<int, RouteInfo> outport_route_map,
        std::map<NodeID, MsgPtr> msg_ptrs_map)
{
    assert(!multicast);
    assert(_outputPorts.empty());
    assert(_demandOutports.empty());
    assert(_remainingOutputPorts.empty());
    assert(_activeOutputPorts.empty());
    assert(_outportRouteMap.empty());
    assert(_outportMsgPtrsMap.empty());

    multicast = true;
    _outputPorts = outports;
    _demandOutports = demand_outports;
    _remainingOutputPorts = outports;
    _outportRouteMap = outport_route_map;

    // generate msg ptrs map
    for (auto outport: outports) {
        auto route = _outportRouteMap[outport];

        std::map<NodeID, MsgPtr> new_msg_ptrs_map;
        if (route.dest_router != -1) {
            new_msg_ptrs_map[route.dest_ni] = msg_ptrs_map[route.dest_ni];
        } else {
            for (auto dest_node: route.destNIs)
                new_msg_ptrs_map[dest_node] = msg_ptrs_map[dest_node];
        }

        _outportMsgPtrsMap[outport] = new_msg_ptrs_map;
    }
}

void
VirtualChannel::updateDemandDests(Addr addr, MachineID mid, int outport)
{
    flit *fl = inputBuffer.peekTopFlit();
    if (fl->getAddr() == addr) {
        _demandOutports.insert(outport);

        NodeID node_id = mid.getNodeID();

        _outportMsgPtrsMap[outport][node_id]->getDemandDests().add(mid);
        _outportRouteMap[outport].demandDestNIs.insert(node_id);
    }
}

void
VirtualChannel::clearMulticastInfo()
{
    assert(multicast);
    multicast = false;
    _outputPorts.clear();
    _remainingOutputPorts.clear();
    _activeOutputPorts.clear();
    _outportOutvcMap.clear();
    _outportRouteMap.clear();
    _outportMsgPtrsMap.clear();
}

void
VirtualChannel::removeFromMulticastRemainingOutports(int outport)
{
    auto it = std::find(_remainingOutputPorts.begin(),
            _remainingOutputPorts.end(), outport);
    assert(it != _remainingOutputPorts.end());
    _remainingOutputPorts.erase(it);

    _demandOutports.erase(outport);

    assert(multicastNthFlit == 0 || multicastNthFlit == 1);
}

void
VirtualChannel::insertToMulticastActiveOutports(int outport)
{
    assert(std::find(_activeOutputPorts.begin(), _activeOutputPorts.end(),
                outport) == _activeOutputPorts.end());
    _activeOutputPorts.push_back(outport);
}

void
VirtualChannel::removeFromMulticastActiveOutports(int outport)
{
    auto it = std::find(_activeOutputPorts.begin(),
            _activeOutputPorts.end(), outport);
    assert(it != _activeOutputPorts.end());
    _activeOutputPorts.erase(it);
}

std::string
VirtualChannel::printVCString(int vc) const
{
    std::ostringstream oss;
    oss << "      - VC[" << vc << "]: {";

    oss << "state = ";
    std::string state;
    switch (m_vc_state.first) {
        case IDLE_:   state = "Idle";   break;
        case VC_AB_:  state = "VC-AB";  break;
        case ACTIVE_: state = "Active"; break;
        default: panic("Unkown VC state type %d\n", m_vc_state.first);
    }
    oss << state << ", ";
    oss << "PktID=" << packetID << ", ";
    oss << "buffer = {";
    if (inputBuffer.getSize()) {
        for (int i = 0; i < inputBuffer.getSize(); i++) {
            flit *fl = inputBuffer.peekNthFlit(i);
            flit_type fl_type = fl->get_type();
            switch (fl_type) {
                case HEAD_: oss << " Head"; break;
                case BODY_: oss << " Body-" << fl->get_id(); break;
                case TAIL_: oss << " Tail"; break;
                case HEAD_TAIL_: oss << " HeadTail"; break;
                default: panic("Unkown filt type %d\n", fl_type);
            }
        }
        oss << " }, ";
    } else {
        oss << "empty}, ";
    }

    oss << "outport = " << m_output_port << ", outvc = " << m_output_vc;

    if (multicast) {
        oss << ", multicast, outports = { ";
        for (auto outport: _outputPorts) {
            oss << outport << " (outvc:" << getMulticastOutvc(outport)
                << ") : {";
            std::map<int, RouteInfo> &ref =
                const_cast<std::map<int, RouteInfo>&>(_outportRouteMap);
            oss << ref[outport].destRouters << " }, ";
        }
        oss << "}, active outports: {" << _activeOutputPorts << " }, ";
        oss << "remaining outports: {" << _remainingOutputPorts << " }";
    }

    oss << "}\n";

    return oss.str();
}

bool
VirtualChannel::functionalRead(Packet *pkt)
{
    return inputBuffer.functionalRead(pkt);
}

uint32_t
VirtualChannel::functionalWrite(Packet *pkt)
{
    return inputBuffer.functionalWrite(pkt);
}
