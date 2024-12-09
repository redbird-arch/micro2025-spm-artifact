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


#ifndef __MEM_RUBY_NETWORK_GARNET_0_VIRTUALCHANNEL_HH__
#define __MEM_RUBY_NETWORK_GARNET_0_VIRTUALCHANNEL_HH__

#include <utility>

#include "mem/ruby/network/garnet/CommonTypes.hh"
#include "mem/ruby/network/garnet/flitBuffer.hh"

class VirtualChannel
{
  public:
    VirtualChannel();
    ~VirtualChannel() = default;

    bool need_stage(flit_stage stage, Tick time);
    void set_idle(Tick curTime);
    void set_active(Tick curTime);
    void set_outvc(int outvc)               { m_output_vc = outvc; }
    inline int get_outvc()                  { return m_output_vc; }
    void set_outport(int outport)           { m_output_port = outport; };
    inline int get_outport()                { return m_output_port; }
    inline void setToBeFiltered()           { toBeFiltered = true; }
    inline bool isToBeFiltered()            { return toBeFiltered; }

    // For multicast support
    void setPacketSize(int size) { pktSize = size; }

    void
    setMulticastOutvc(int outport, int outvc)
    {
        _outportOutvcMap[outport] = outvc;
    }

    inline int
    getMulticastOutvc(int outport) const
    {
        auto it = _outportOutvcMap.find(outport);
        if (it == _outportOutvcMap.end())
            return -1;
        else
            return it->second;
    }

    inline std::map<int, int>
    getMulticastOutportOutvcMap()
    {
        return _outportOutvcMap;
    }

    void setMulticastOutports(std::vector<int> outports,
                              std::set<int> demand_outports,
                              std::map<int, RouteInfo> outport_route_map,
                              std::map<NodeID, MsgPtr> msg_ptrs_map);

    inline std::vector<int> getMulticastOutports() { return _outputPorts; }

    inline std::set<int>
    getMulticastDemandOutports()
    {
        return _demandOutports;
    }

    inline bool
    isDemandOutport(int outport)
    {
        return _demandOutports.find(outport) != _demandOutports.end();
    }

    void updateDemandDests(Addr addr, MachineID mid, int outport);

    inline std::vector<int>
    getMulticastRemainingOutports()
    {
        return _remainingOutputPorts;
    }

    inline std::vector<int>
    getMulticastActiveOutports()
    {
        return _activeOutputPorts;
    }

    inline int
    getMulticastFirstRemainingOutports()
    {
        assert(!_remainingOutputPorts.empty());
        return _remainingOutputPorts[0];
    }

    inline void
    resetMulticastRemainingOutports()
    {
        assert(_remainingOutputPorts.size() == 0);
        _remainingOutputPorts = _outputPorts;
    }

    void clearMulticastInfo();

    void removeFromMulticastRemainingOutports(int outport);
    void insertToMulticastActiveOutports(int outport);
    void removeFromMulticastActiveOutports(int outport);

    inline const RouteInfo &
    getMulticastRouteInfoForOutport(int outport)
    {
        return _outportRouteMap[outport];
    }

    inline const std::map<NodeID, MsgPtr> &
    getMulticastMsgPtrsMapForOutport(int outport)
    {
        return _outportMsgPtrsMap[outport];
    }

    inline bool isMulticast() { return multicast; }

    inline bool
    isMulticastHeadFlit()
    {
        assert(!inputBuffer.isEmpty());
        flit_type ftype = inputBuffer.peekTopFlit()->get_type();

        return multicast && multicastNthFlit == 0 &&
            (ftype == HEAD_ || ftype == HEAD_TAIL_);
    }

    inline bool
    isHeadFlit()
    {
        assert(!inputBuffer.isEmpty());
        flit_type ftype = inputBuffer.peekTopFlit()->get_type();

        return multicastNthFlit == 0 &&
            (ftype == HEAD_ || ftype == HEAD_TAIL_);
    }

    inline Tick get_enqueue_time()          { return m_enqueue_time; }
    inline void set_enqueue_time(Tick time) { m_enqueue_time = time; }
    inline VC_state_type get_state()        { return m_vc_state.first; }

    inline bool
    isReady(Tick curTime)
    {
        return inputBuffer.isReady(curTime);
    }

    inline void
    insertFlit(flit *t_flit)
    {
        inputBuffer.insert(t_flit);
    }

    inline void
    set_state(VC_state_type m_state, Tick curTime)
    {
        m_vc_state.first = m_state;
        m_vc_state.second = curTime;
    }

    inline flit*
    peekTopFlit()
    {
        return inputBuffer.peekTopFlit();
    }

    inline flit*
    peekMulticastFlit()
    {
        return inputBuffer.peekNthFlit(multicastNthFlit);
    }

    inline void
    advanceToNextMulticastFlit()
    {
        multicastNthFlit++;
        multicastNthFlit %= pktSize;
    }

    inline flit*
    getTopFlit()
    {
        return inputBuffer.getTopFlit();
    }

    inline bool isEmpty() { return inputBuffer.isEmpty(); }

    std::string printVCString(int id) const;

    bool functionalRead(Packet *pkt);
    uint32_t functionalWrite(Packet *pkt);

  private:
    flitBuffer inputBuffer;
    std::pair<VC_state_type, Tick> m_vc_state;
    int m_output_port;
    Tick m_enqueue_time;
    uint64_t packetID;
    int m_output_vc;
    bool multicast;
    std::vector<int> _outputPorts;
    std::set<int> _demandOutports;
    std::vector<int> _remainingOutputPorts;
    std::vector<int> _activeOutputPorts;
    std::map<int, int> _outportOutvcMap; // output port to output vc map
    std::map<int, RouteInfo> _outportRouteMap;
    std::map<int, std::map<NodeID, MsgPtr>> _outportMsgPtrsMap;
    int multicastNthFlit;
    int pktSize;
    bool toBeFiltered;
};

#endif // __MEM_RUBY_NETWORK_GARNET_0_VIRTUALCHANNEL_HH__
