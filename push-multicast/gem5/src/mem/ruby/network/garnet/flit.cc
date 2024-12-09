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


#include "mem/ruby/network/garnet/flit.hh"

#include "base/intmath.hh"
#include "debug/RubyNetwork.hh"
#include "mem/ruby/common/IntVec.hh"

uint64_t flit::globalPacketID = 0;

// Constructor for the flit
flit::flit(int id, int  vc, int vnet, RouteInfo route, int size,
    MsgPtr msg_ptr, int MsgSize, uint32_t bWidth, Tick curTime,
    bool replica)
{
    m_size = size;
    m_msg_ptr = msg_ptr;
    m_enqueue_time = curTime;
    m_dequeue_time = curTime;
    m_time = curTime;
    m_id = id;
    m_vnet = vnet;
    m_vc = vc;
    m_route = route;
    m_stage.first = I_;
    m_stage.second = curTime;
    m_width = bWidth;
    msgSize = MsgSize;

    _multicast = false;
    _prepush = false;
    _readRequest = false;
    _addr = 0;

    // Not credit and not a flit replica
    if (size != 0 && !replica) {
        if (id == 0) // HEAD_TAIL_ or HEAD flit
            globalPacketID++;

        packetID = globalPacketID;
    } else {
        packetID = 0;
    }

    if (size == 1) {
        m_type = HEAD_TAIL_;
        return;
    }
    if (id == 0)
        m_type = HEAD_;
    else if (id == (size - 1))
        m_type = TAIL_;
    else
        m_type = BODY_;
}

void
flit::updateMulticastMetadata(const RouteInfo &new_route,
        const std::map<NodeID, MsgPtr> &msg_ptrs_map)
{
    m_route = new_route;

    SwitchID dest_router = m_route.dest_router;
    if (dest_router != -1) {
        assert(msg_ptrs_map.size() == 1);
        NodeID dest_node = m_route.dest_ni;
        m_msg_ptr = _msgPtrsMap[dest_node];
        _msgPtrsMap[dest_node] = nullptr;
        _multicast = false;
    } else {
        _msgPtrsMap = msg_ptrs_map;
    }
}

flit *
flit::makeReplica()
{
    flit *fl = new flit(m_id, m_vc, m_vnet, m_route, m_size,
            m_msg_ptr, msgSize, m_width, m_time, true);

    fl->setPacketID(packetID);
    fl->set_src_delay(src_delay);
    fl->set_enqueue_time(m_enqueue_time);
    fl->set_dequeue_time(m_dequeue_time);
    fl->advance_stage(m_stage.first, m_stage.second);
    fl->setMsgPtrsMap(_msgPtrsMap);
    assert(_multicast);
    fl->setMulticast();
    fl->setPrepush(_prepush);
    fl->setAddr(_addr);

    return fl;
}

flit *
flit::serialize(int ser_id, int parts, uint32_t bWidth)
{
    assert(m_width > bWidth);

    int ratio = (int)divCeil(m_width, bWidth);
    int new_id = (m_id*ratio) + ser_id;
    int new_size = (int)divCeil((float)msgSize, (float)bWidth);
    assert(new_id < new_size);

    flit *fl = new flit(new_id, m_vc, m_vnet, m_route,
                    new_size, m_msg_ptr, msgSize, bWidth, m_time);
    fl->set_enqueue_time(m_enqueue_time);
    fl->set_src_delay(src_delay);
    return fl;
}

flit *
flit::deserialize(int des_id, int num_flits, uint32_t bWidth)
{
    int ratio = (int)divCeil((float)bWidth, (float)m_width);
    int new_id = ((int)divCeil((float)(m_id+1), (float)ratio)) - 1;
    int new_size = (int)divCeil((float)msgSize, (float)bWidth);
    assert(new_id < new_size);

    flit *fl = new flit(new_id, m_vc, m_vnet, m_route,
                    new_size, m_msg_ptr, msgSize, bWidth, m_time);
    fl->set_enqueue_time(m_enqueue_time);
    fl->set_src_delay(src_delay);
    return fl;
}

// Flit can be printed out for debugging purposes
void
flit::print(std::ostream& out) const
{
    out << "[flit:: ";
    out << "PktID=" << packetID << " ";
    out << "Id=" << m_id << " ";
    out << "Type=" << m_type << " ";
    out << "Size=" << m_size << " ";
    out << "Vnet=" << m_vnet << " ";
    out << "VC=" << m_vc << " ";
    out << "Src NI=" << m_route.src_ni << " ";
    out << "Src Router=" << m_route.src_router << " ";
    if (m_route.destNIs.size() <= 1) {
        out << "Dest NI=" << m_route.dest_ni << " ";
        out << "Dest Router=" << m_route.dest_router << " ";
    } else {
        assert(m_route.dest_router == -1);
        out << "Dest NIs={" << m_route.destNIs << " } ";
        out << "Dest Routers={" << m_route.destRouters << " } ";
    }
    out << "Set Time=" << m_time << " ";
    out << "Width=" << m_width<< " ";
    out << "]";
}

bool
flit::functionalRead(Packet *pkt)
{
    Message *msg = m_msg_ptr.get();
    return msg->functionalRead(pkt);
}

bool
flit::functionalWrite(Packet *pkt)
{
    Message *msg = m_msg_ptr.get();
    return msg->functionalWrite(pkt);
}
