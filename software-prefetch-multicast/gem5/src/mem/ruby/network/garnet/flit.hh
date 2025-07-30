/*
 * Copyright (c) 2008 Princeton University
 * Copyright (c) 2016 Georgia Institute of Technology
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


#ifndef __MEM_RUBY_NETWORK_GARNET_0_FLIT_HH__
#define __MEM_RUBY_NETWORK_GARNET_0_FLIT_HH__

#include <cassert>
#include <iostream>
#include <map>

#include "base/types.hh"
#include "mem/ruby/network/garnet/CommonTypes.hh"
#include "mem/ruby/slicc_interface/Message.hh"

class flit
{
  public:
    flit() {}
    flit(int id, int vc, int vnet, RouteInfo route, int size,
         MsgPtr msg_ptr, int MsgSize, uint32_t bWidth, Tick curTime,
         bool replica = false);

    virtual ~flit(){};

    int get_outport() {return m_outport; }
    int get_size() { return m_size; }
    Tick get_enqueue_time() { return m_enqueue_time; }
    Tick get_dequeue_time() { return m_dequeue_time; }
    int get_id() { return m_id; }
    Tick get_time() { return m_time; }
    int get_vnet() { return m_vnet; }
    int get_vc() { return m_vc; }
    RouteInfo get_route() { return m_route; }
    MsgPtr& get_msg_ptr() { return m_msg_ptr; }
    flit_type get_type() { return m_type; }
    std::pair<flit_stage, Tick> get_stage() { return m_stage; }
    Tick get_src_delay() { return src_delay; }
    inline uint64_t getPacketID() { return packetID; }
    inline bool getMulticast() { return _multicast; }
    inline bool isMulticast() { return _multicast; }
    inline bool isPrepush() { return _prepush; }
    inline bool getPrepush() { return _prepush; }
    inline bool isReadRequest() { return _readRequest; }
    inline bool getReadRequest() { return _readRequest; }
    inline Addr getAddr() { return _addr; }

    inline MsgPtr&
    getMsgPtr(NodeID node_id)
    {
        assert(_multicast && _msgPtrsMap.find(node_id) != _msgPtrsMap.end());
        return _msgPtrsMap[node_id];
    }

    void set_outport(int port) { m_outport = port; }
    void set_time(Tick time) { m_time = time; }
    void set_vc(int vc) { m_vc = vc; }
    void set_route(RouteInfo route) { m_route = route; }
    void set_src_delay(Tick delay) { src_delay = delay; }
    void set_dequeue_time(Tick time) { m_dequeue_time = time; }
    void set_enqueue_time(Tick time) { m_enqueue_time = time; }
    void setPacketID(uint64_t packet_id) { packetID = packet_id; }
    inline void setMulticast() { _multicast = true; }
    inline void clearMulticast() { _multicast = false; }
    inline void setPrepush(bool prepush) { _prepush = prepush; }
    inline void setReadRequest(bool read) { _readRequest = read; }
    inline void setAddr(Addr addr) { _addr = addr; }

    RouteInfo& getRoute() { return m_route; }

    void
    setMsgPtrsMap(std::map<NodeID, MsgPtr> msg_ptrs_map)
    {
        _msgPtrsMap = msg_ptrs_map;
    }

    inline std::map<NodeID, MsgPtr> getMsgPtrsMap() { return _msgPtrsMap; }

    void updateMulticastMetadata(const RouteInfo &new_route,
            const std::map<NodeID, MsgPtr> &msg_ptrs_map);

    flit* makeReplica();

    void increment_hops() { m_route.hops_traversed++; }
    virtual void print(std::ostream& out) const;

    bool
    is_stage(flit_stage stage, Tick time)
    {
        return (stage == m_stage.first &&
                time >= m_stage.second);
    }

    void
    advance_stage(flit_stage t_stage, Tick newTime)
    {
        m_stage.first = t_stage;
        m_stage.second = newTime;
    }

    static bool
    greater(flit* n1, flit* n2)
    {
        if (n1->get_time() == n2->get_time()) {
            //assert(n1->flit_id != n2->flit_id);
            return (n1->get_id() > n2->get_id());
        } else {
            return (n1->get_time() > n2->get_time());
        }
    }

    bool functionalRead(Packet *pkt);
    bool functionalWrite(Packet *pkt);

    virtual flit* serialize(int ser_id, int parts, uint32_t bWidth);
    virtual flit* deserialize(int des_id, int num_flits, uint32_t bWidth);

    uint32_t m_width;
    int msgSize;

    static uint64_t globalPacketID;
  protected:
    uint64_t packetID;
    int m_id;
    int m_vnet;
    int m_vc;
    RouteInfo m_route;
    int m_size;
    Tick m_enqueue_time, m_dequeue_time;
    Tick m_time;
    flit_type m_type;
    MsgPtr m_msg_ptr;
    int m_outport;
    Tick src_delay;
    std::pair<flit_stage, Tick> m_stage;
    std::map<NodeID, MsgPtr> _msgPtrsMap;
    bool _multicast;
    bool _prepush;
    bool _readRequest;
    Addr _addr;
};

inline std::ostream&
operator<<(std::ostream& out, const flit& obj)
{
    obj.print(out);
    out << std::flush;
    return out;
}

#endif // __MEM_RUBY_NETWORK_GARNET_0_FLIT_HH__
