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


#ifndef __MEM_RUBY_NETWORK_GARNET_0_INPUTUNIT_HH__
#define __MEM_RUBY_NETWORK_GARNET_0_INPUTUNIT_HH__

#include <iostream>
#include <vector>

#include "mem/ruby/common/Consumer.hh"
#include "mem/ruby/network/garnet/CommonTypes.hh"
#include "mem/ruby/network/garnet/CreditLink.hh"
#include "mem/ruby/network/garnet/NetworkLink.hh"
#include "mem/ruby/network/garnet/Router.hh"
#include "mem/ruby/network/garnet/VirtualChannel.hh"
#include "mem/ruby/network/garnet/flitBuffer.hh"

class InputUnit : public Consumer
{
  public:
    InputUnit(int id, PortDirection direction, Router *router);
    ~InputUnit() = default;

    void wakeup();
    void print(std::ostream& out) const {};

    inline PortDirection get_direction() { return m_direction; }
    inline int get_id() { return m_id; }

    inline void
    set_vc_idle(int vc, Tick curTime)
    {
        virtualChannels[vc].set_idle(curTime);
    }

    inline void
    set_vc_active(int vc, Tick curTime)
    {
        virtualChannels[vc].set_active(curTime);
    }

    inline void
    grant_outport(int vc, int outport)
    {
        virtualChannels[vc].set_outport(outport);
    }

    inline void
    grantMulticastOutports(int vc, std::vector<int> outports,
            std::set<int> demand_outports,
            std::map<int, RouteInfo> outport_route_map,
            std::map<NodeID, MsgPtr> msg_ptrs_map)
    {
        virtualChannels[vc].setMulticastOutports(
                outports, demand_outports, outport_route_map, msg_ptrs_map);
    }

    inline void
    grant_outvc(int vc, int outvc)
    {
        virtualChannels[vc].set_outvc(outvc);
    }

    inline void
    grantMulticastOutvc(int vc, int outport, int outvc)
    {
        virtualChannels[vc].setMulticastOutvc(outport, outvc);
    }

    inline void
    resetMulticastRemainingOutports(int vc)
    {
        virtualChannels[vc].resetMulticastRemainingOutports();
    }

    inline void
    clearMulticastInfo(int vc)
    {
        virtualChannels[vc].clearMulticastInfo();
    }

    inline int
    get_outport(int invc)
    {
        return virtualChannels[invc].get_outport();
    }

    inline std::vector<int>
    getMulticastOutports(int invc)
    {
        return virtualChannels[invc].getMulticastOutports();
    }

    inline std::vector<int>
    getMulticastRemainingOutports(int invc)
    {
        return virtualChannels[invc].getMulticastRemainingOutports();
    }

    inline std::vector<int>
    getMulticastActiveOutports(int invc)
    {
        return virtualChannels[invc].getMulticastActiveOutports();
    }

    inline int
    getMulticastFirstRemainingOutports(int invc)
    {
        return virtualChannels[invc].getMulticastFirstRemainingOutports();
    }

    inline bool
    isDemandOutport(int invc, int outport)
    {
        return virtualChannels[invc].isDemandOutport(outport);
    }

    inline void
    removeFromMulticastRemainingOutports(int invc, int outport)
    {
        virtualChannels[invc].removeFromMulticastRemainingOutports(outport);
    }

    inline void
    insertToMulticastActiveOutports(int invc, int outport)
    {
        virtualChannels[invc].insertToMulticastActiveOutports(outport);
    }

    inline void
    removeFromMulticastActiveOutports(int invc, int outport)
    {
        virtualChannels[invc].removeFromMulticastActiveOutports(outport);
    }

    inline const RouteInfo &
    getMulticastRouteInfoForOutport(int invc, int outport)
    {
        return virtualChannels[invc].getMulticastRouteInfoForOutport(outport);
    }

    inline const std::map<NodeID, MsgPtr> &
    getMulticastMsgPtrsMapForOutport(int invc, int outport)
    {
        return virtualChannels[invc].getMulticastMsgPtrsMapForOutport(outport);
    }

    inline bool
    isLastActiveGroup(int invc)
    {
        int num_remaining_outports =
            virtualChannels[invc].getMulticastRemainingOutports().size();

        return num_remaining_outports == 0;
    }

    inline int
    get_outvc(int invc)
    {
        return virtualChannels[invc].get_outvc();
    }

    inline int
    getMulticastOutvc(int invc, int outport)
    {
        return virtualChannels[invc].getMulticastOutvc(outport);
    }

    inline bool
    isMulticast(int invc)
    {
        return virtualChannels[invc].isMulticast();
    }

    inline bool
    isMulticastHeadFlit(int invc)
    {
        return virtualChannels[invc].isMulticastHeadFlit();
    }

    inline bool
    isHeadFlit(int invc) {
        return virtualChannels[invc].isHeadFlit();
    }

    inline bool
    isToBeFiltered(int invc)
    {
        return virtualChannels[invc].isToBeFiltered();
    }

    inline void
    setToBeFiltered(int invc)
    {
        virtualChannels[invc].setToBeFiltered();
    }

    inline void
    updateDemandDests(Addr addr, int invc, MachineID mid, int outport)
    {
        virtualChannels[invc].updateDemandDests(addr, mid, outport);
    }

    inline Tick
    get_enqueue_time(int invc)
    {
        return virtualChannels[invc].get_enqueue_time();
    }

    void increment_credit(int in_vc, bool free_signal, Tick curTime);

    inline flit*
    peekTopFlit(int vc)
    {
        return virtualChannels[vc].peekTopFlit();
    }

    inline flit*
    peekMulticastFlit(int vc)
    {
        return virtualChannels[vc].peekMulticastFlit();
    }

    inline void
    advanceToNextMulticastFlit(int vc)
    {
        return virtualChannels[vc].advanceToNextMulticastFlit();
    }

    inline flit*
    getTopFlit(int vc)
    {
        return virtualChannels[vc].getTopFlit();
    }

    inline bool
    need_stage(int vc, flit_stage stage, Tick time)
    {
        return virtualChannels[vc].need_stage(stage, time);
    }

    inline bool
    isReady(int invc, Tick curTime)
    {
        return virtualChannels[invc].isReady(curTime);
    }

    inline bool isEmpty(int vc) { return virtualChannels[vc].isEmpty(); }

    flitBuffer* getCreditQueue() { return &creditQueue; }

    inline void
    set_in_link(NetworkLink *link)
    {
        m_in_link = link;
    }

    inline int get_inlink_id() { return m_in_link->get_id(); }

    inline void
    set_credit_link(CreditLink *credit_link)
    {
        m_credit_link = credit_link;
    }

    double get_buf_read_activity(unsigned int vnet) const
    { return m_num_buffer_reads[vnet]; }
    double get_buf_write_activity(unsigned int vnet) const
    { return m_num_buffer_writes[vnet]; }

    // Debug print
    std::string printInputString(int vnet = -1) const;

    bool functionalRead(Packet *pkt);
    uint32_t functionalWrite(Packet *pkt);
    void resetStats();

  private:
    Router *m_router;
    int m_id;
    PortDirection m_direction;
    int m_vc_per_vnet;
    NetworkLink *m_in_link;
    CreditLink *m_credit_link;
    flitBuffer creditQueue;

    // Input Virtual channels
    std::vector<VirtualChannel> virtualChannels;

    // Statistical variables
    std::vector<double> m_num_buffer_writes;
    std::vector<double> m_num_buffer_reads;
};

#endif // __MEM_RUBY_NETWORK_GARNET_0_INPUTUNIT_HH__
