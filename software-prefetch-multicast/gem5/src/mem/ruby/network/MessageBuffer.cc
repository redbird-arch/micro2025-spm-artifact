/*
 * Copyright (c) 2019,2020 ARM Limited
 * All rights reserved.
 *
 * The license below extends only to copyright in the software and shall
 * not be construed as granting a license to any other intellectual
 * property including but not limited to intellectual property relating
 * to a hardware implementation of the functionality of the software
 * licensed hereunder.  You may use the software subject to the license
 * terms below provided that you ensure that this notice is replicated
 * unmodified and in its entirety in all distributions of the software,
 * modified or unmodified, in source code or in binary form.
 *
 * Copyright (c) 1999-2008 Mark D. Hill and David A. Wood
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

#include "mem/ruby/network/MessageBuffer.hh"

#include <cassert>

#include "base/cprintf.hh"
#include "base/logging.hh"
#include "base/random.hh"
#include "base/stl_helpers.hh"
#include "debug/PrepushFilter.hh"
#include "debug/RubyCoalescing.hh"
#include "debug/RubyQueue.hh"
#include "mem/ruby/system/RubySystem.hh"

using namespace std;
using m5::stl_helpers::operator<<;

MessageBuffer::MessageBuffer(const Params &p)
    : SimObject(p), m_stall_map_size(0),
    m_enable_filter_drop(p.enable_filter_drop), // add for enabling filter drop or not
    m_max_size(p.buffer_size), m_time_last_time_size_checked(0),
    m_time_last_time_enqueue(0), m_time_last_time_pop(0),
    m_last_arrival_time(0), m_strict_fifo(p.ordered),
    m_randomization(p.randomization),
    m_allow_zero_latency(p.allow_zero_latency)
{
    m_msg_counter = 0;
    m_consumer = NULL;
    m_size_last_time_size_checked = 0;
    m_size_at_cycle_start = 0;
    m_stalled_at_cycle_start = 0;
    m_msgs_this_cycle = 0;
    m_priority_rank = 0;

    m_stall_msg_map.clear();
    m_input_link_id = 0;
    m_vnet_id = 0;

    m_buf_msgs = 0;
    m_stall_time = 0;

    m_dequeue_callback = nullptr;

    coalescing = p.coalescing;
    getSRequestorsMap.clear();
    getSMsgPtrVecMap.clear();

    prepushFilter.clear();
    prepushAddrs.clear();

    profile = p.profile;
    profilePCLow = p.profilePCLow;
    profilePCHigh = p.profilePCHigh;

    profileAllPCs = (profilePCLow == 0 && profilePCHigh == 0);
}

unsigned int
MessageBuffer::getSize(Tick curTime)
{
    if (m_time_last_time_size_checked != curTime) {
        m_time_last_time_size_checked = curTime;
        m_size_last_time_size_checked = m_prio_heap.size();
    }

    return m_size_last_time_size_checked;
}

bool
MessageBuffer::areNSlotsAvailable(unsigned int n, Tick current_time)
{

    // fast path when message buffers have infinite size
    if (m_max_size == 0) {
        return true;
    }

    // determine the correct size for the current cycle
    // pop operations shouldn't effect the network's visible size
    // until schd cycle, but enqueue operations effect the visible
    // size immediately
    unsigned int current_size = 0;
    unsigned int current_stall_size = 0;

    if (m_time_last_time_pop < current_time) {
        // no pops this cycle - heap and stall queue size is correct
        current_size = m_prio_heap.size();
        current_stall_size = m_stall_map_size;
    } else {
        if (m_time_last_time_enqueue < current_time) {
            // no enqueues this cycle - m_size_at_cycle_start is correct
            current_size = m_size_at_cycle_start;
        } else {
            // both pops and enqueues occured this cycle - add new
            // enqueued msgs to m_size_at_cycle_start
            current_size = m_size_at_cycle_start + m_msgs_this_cycle;
        }

        // Stall queue size at start is considered
        current_stall_size = m_stalled_at_cycle_start;
    }

    // now compare the new size with our max size
    if (current_size + current_stall_size + n <= m_max_size) {
        return true;
    } else {
        DPRINTF(RubyQueue, "n: %d, current_size: %d, heap size: %d, "
                "m_max_size: %d\n",
                n, current_size + current_stall_size,
                m_prio_heap.size(), m_max_size);
        m_not_avail_count++;
        return false;
    }
}

const Message*
MessageBuffer::peek() const
{
    DPRINTF(RubyQueue, "Peeking at head of queue.\n");
    const Message* msg_ptr = m_prio_heap.front().get();
    assert(msg_ptr);

    DPRINTF(RubyQueue, "Message: %s\n", (*msg_ptr));
    return msg_ptr;
}

// FIXME - move me somewhere else
Tick
random_time()
{
    Tick time = 1;
    time += random_mt.random(0, 3);  // [0...3]
    if (random_mt.random(0, 7) == 0) {  // 1 in 8 chance
        time += 100 + random_mt.random(1, 15); // 100 + [1...15]
    }
    return time;
}

void
MessageBuffer::enqueue(MsgPtr message, Tick current_time, Tick delta)
{
    // For dropped prepush response message
    if (message->isPrepushMsg() && message->getDestination().isEmpty()) {
        DPRINTF(PrepushFilter, "PrepushFilter: prepush response for addr %#x "
                "from %s is dropped due to redandency\n",
                message->getLineAddr(), message->getPrepushRequestor());

        // TODO: profile message delay for stats
        return;
    }

    // record current time incase we have a pop that also adjusts my size
    if (m_time_last_time_enqueue < current_time) {
        m_msgs_this_cycle = 0;  // first msg this cycle
        m_time_last_time_enqueue = current_time;
    }

    // filter/drop the packet if a prepush is in the response queue
    if (m_enable_filter_drop) {
    if (message->isReadRequest()) {
        Addr addr = message->getLineAddr();

        if (prepushFilter.find(addr) != prepushFilter.end() &&
                prepushFilter[addr].isElement(message->getRequestor())) {

            DPRINTF(PrepushFilter, "PrepushFilter: request for addr %#x from "
                    "%s is filtered by prepush in response queue\n",
                    addr, message->getRequestor());

            // TODO: profile message delay for stats
            message->updateDelayedTicks(current_time);

            prepushFilterActivity++;
            return;
            }
        }
    }

    m_msg_counter++;
    m_msgs_this_cycle++;

    // Calculate the arrival time of the message, that is, the first
    // cycle the message can be dequeued.
    panic_if((delta == 0) && !m_allow_zero_latency,
           "Delta equals zero and allow_zero_latency is false during enqueue");
    Tick arrival_time = 0;

    // random delays are inserted if the RubySystem level randomization flag
    // is turned on and this buffer allows it
    if ((m_randomization == MessageRandomization::disabled) ||
        ((m_randomization == MessageRandomization::ruby_system) &&
          !RubySystem::getRandomization())) {
        // No randomization
        arrival_time = current_time + delta;
    } else {
        // Randomization - ignore delta
        if (m_strict_fifo) {
            if (m_last_arrival_time < current_time) {
                m_last_arrival_time = current_time;
            }
            arrival_time = m_last_arrival_time + random_time();
        } else {
            arrival_time = current_time + random_time();
        }
    }

    // Check the arrival time
    assert(arrival_time >= current_time);
    if (m_strict_fifo) {
        if (arrival_time < m_last_arrival_time) {
            //panic("FIFO ordering violated: %s name: %s current time: %d "
            warn("FIFO ordering violated: %s name: %s current time: %d "
                  "delta: %d arrival_time: %d last arrival_time: %d\n",
                  *this, name(), current_time, delta, arrival_time,
                  m_last_arrival_time);
        }
    }

    // If running a cache trace, don't worry about the last arrival checks
    if (!RubySystem::getWarmupEnabled()) {
        m_last_arrival_time = arrival_time;
    }

    // compute the delay cycles and set enqueue time
    Message* msg_ptr = message.get();
    assert(msg_ptr != NULL);

    assert(current_time >= msg_ptr->getLastEnqueueTime() &&
           "ensure we aren't dequeued early");

    msg_ptr->updateDelayedTicks(current_time);
    msg_ptr->setLastEnqueueTime(arrival_time);
    msg_ptr->setMsgCounter(m_msg_counter);

    // Insert the message into the priority heap
    m_prio_heap.push_back(message);
    push_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());
    // Increment the number of messages statistic
    m_buf_msgs++;

    assert((m_max_size == 0) ||
           ((m_prio_heap.size() + m_stall_map_size) <= m_max_size));

    DPRINTF(RubyQueue, "Enqueue arrival_time: %lld, Message: %s\n",
            arrival_time, *(message.get()));

    // Update outstanding GetS requestors
    if ((profile || coalescing) && msg_ptr->isReadRequest()) {
        Addr addr = msg_ptr->getLineAddr();

        assert(!getSRequestorsMap[addr].isElement(msg_ptr->getRequestor()));
        getSRequestorsMap[addr].add(msg_ptr->getRequestor());
        getSMsgPtrVecMap[addr].push_back(message);

        DPRINTF(RubyCoalescing, "Coalescing: enqueue: adding %s to "
                "getSRequestorsMap entry for address %#x (PC: %#x): %s, "
                "requestor count: %d, msg count: %d\n",
                msg_ptr->getRequestor(), addr, msg_ptr->getpc(),
                getSRequestorsMap[addr], getSRequestorsMap[addr].count(),
                getSMsgPtrVecMap[addr].size());

        if (isProfile(msg_ptr->getpc()))
            concurrentReqHistogram.sample(getSRequestorsMap[addr].count());
    }

    // Schedule the wakeup
    assert(m_consumer != NULL);
    m_consumer->scheduleEventAbsolute(arrival_time);
    m_consumer->storeEventInfo(m_vnet_id);
}

Tick
MessageBuffer::dequeue(Tick current_time, bool decrement_messages)
{
    DPRINTF(RubyQueue, "Popping\n");
    assert(isReady(current_time));

    // get MsgPtr of the message about to be dequeued
    MsgPtr message = m_prio_heap.front();

    // update GetS requestors map for coalescing
    if (decrement_messages && (profile || coalescing) &&
            message->isReadRequest()) {
        Addr addr = message->getLineAddr();

        DPRINTF(RubyCoalescing, "Coalescing: dequeue: removing %s from "
                "getSRequestorsMap entry for address %#x (PC: %#x): %s\n",
                message->getRequestor(), addr, message->getpc(),
                getSRequestorsMap[addr]);

        assert(getSRequestorsMap.count(addr));
        assert(getSRequestorsMap[addr].isElement(message->getRequestor()));

        getSRequestorsMap[addr].remove(message->getRequestor());

        // remove the dequeued message
        pop_heap(getSMsgPtrVecMap[addr].begin(), getSMsgPtrVecMap[addr].end(),
                greater<MsgPtr>());
        MsgPtr msg_ptr = getSMsgPtrVecMap[addr].back();
        getSMsgPtrVecMap[addr].pop_back();

        DPRINTF(RubyCoalescing, "Coalescing: dequeue: removing %s from "
                "getSMsgPtrVecMap for address %#x (PC: %#x), requestor count:"
                " %d, msg count: %d\n",
                msg_ptr->getRequestor(), addr, msg_ptr->getpc(),
                getSRequestorsMap[addr].count(),
                getSMsgPtrVecMap[addr].size());

        if (getSRequestorsMap[addr].isEmpty()) {
            assert(getSMsgPtrVecMap[addr].empty());

            getSRequestorsMap.erase(addr);
            getSMsgPtrVecMap.erase(addr);

            DPRINTF(RubyCoalescing, "Coalescing: dequeue: remove empty "
                    "getSRequestorsMap entry for address %#x\n", addr);
        }
    }

    // get the delay cycles
    message->updateDelayedTicks(current_time);
    Tick delay = message->getDelayedTicks();

    m_stall_time = curTick() - message->getTime();

    // record previous size and time so the current buffer size isn't
    // adjusted until schd cycle
    if (m_time_last_time_pop < current_time) {
        m_size_at_cycle_start = m_prio_heap.size();
        m_stalled_at_cycle_start = m_stall_map_size;
        m_time_last_time_pop = current_time;
    }

    pop_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());
    m_prio_heap.pop_back();
    if (decrement_messages) {
        // If the message will be removed from the queue, decrement the
        // number of message in the queue.
        m_buf_msgs--;
    }

    // if a dequeue callback was requested, call it now
    if (m_dequeue_callback) {
        m_dequeue_callback();
    }

    return delay;
}

void
MessageBuffer::registerDequeueCallback(std::function<void()> callback)
{
    m_dequeue_callback = callback;
}

void
MessageBuffer::unregisterDequeueCallback()
{
    m_dequeue_callback = nullptr;
}

void
MessageBuffer::clear()
{
    m_prio_heap.clear();

    m_msg_counter = 0;
    m_time_last_time_enqueue = 0;
    m_time_last_time_pop = 0;
    m_size_at_cycle_start = 0;
    m_stalled_at_cycle_start = 0;
    m_msgs_this_cycle = 0;
}

void
MessageBuffer::recycle(Tick current_time, Tick recycle_latency)
{
    DPRINTF(RubyQueue, "Recycling.\n");
    assert(isReady(current_time));
    MsgPtr node = m_prio_heap.front();
    pop_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());

    Tick future_time = current_time + recycle_latency;
    node->setLastEnqueueTime(future_time);

    m_prio_heap.back() = node;
    push_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());
    m_consumer->scheduleEventAbsolute(future_time);
}

void
MessageBuffer::reanalyzeList(list<MsgPtr> &lt, Tick schdTick)
{
    while (!lt.empty()) {
        MsgPtr m = lt.front();
        assert(m->getLastEnqueueTime() <= schdTick);

        m_prio_heap.push_back(m);
        push_heap(m_prio_heap.begin(), m_prio_heap.end(),
                  greater<MsgPtr>());

        m_consumer->scheduleEventAbsolute(schdTick);

        DPRINTF(RubyQueue, "Requeue arrival_time: %lld, Message: %s\n",
            schdTick, *(m.get()));

        lt.pop_front();
    }
}

void
MessageBuffer::reanalyzeMessages(Addr addr, Tick current_time)
{
    DPRINTF(RubyQueue, "ReanalyzeMessages %#x\n", addr);
    assert(m_stall_msg_map.count(addr) > 0);

    //
    // Put all stalled messages associated with this address back on the
    // prio heap.  The reanalyzeList call will make sure the consumer is
    // scheduled for the current cycle so that the previously stalled messages
    // will be observed before any younger messages that may arrive this cycle
    //
    m_stall_map_size -= m_stall_msg_map[addr].size();
    assert(m_stall_map_size >= 0);
    reanalyzeList(m_stall_msg_map[addr], current_time);
    m_stall_msg_map.erase(addr);
}

void
MessageBuffer::reanalyzeAllMessages(Tick current_time)
{
    DPRINTF(RubyQueue, "ReanalyzeAllMessages\n");

    //
    // Put all stalled messages associated with this address back on the
    // prio heap.  The reanalyzeList call will make sure the consumer is
    // scheduled for the current cycle so that the previously stalled messages
    // will be observed before any younger messages that may arrive this cycle.
    //
    for (StallMsgMapType::iterator map_iter = m_stall_msg_map.begin();
         map_iter != m_stall_msg_map.end(); ++map_iter) {
        m_stall_map_size -= map_iter->second.size();
        assert(m_stall_map_size >= 0);
        reanalyzeList(map_iter->second, current_time);
    }
    m_stall_msg_map.clear();
}

void
MessageBuffer::stallMessage(Addr addr, Tick current_time)
{
    DPRINTF(RubyQueue, "Stalling due to %#x\n", addr);
    assert(isReady(current_time));
    assert(getOffset(addr) == 0);
    MsgPtr message = m_prio_heap.front();

    // Since the message will just be moved to stall map, indicate that the
    // buffer should not decrement the m_buf_msgs statistic
    dequeue(current_time, false);

    //
    // Note: no event is scheduled to analyze the map at a later time.
    // Instead the controller is responsible to call reanalyzeMessages when
    // these addresses change state.
    //
    (m_stall_msg_map[addr]).push_back(message);
    m_stall_map_size++;
    m_stall_count++;
}

bool
MessageBuffer::hasStalledMsg(Addr addr) const
{
    return (m_stall_msg_map.count(addr) != 0);
}

void
MessageBuffer::deferEnqueueingMessage(Addr addr, MsgPtr message)
{
    DPRINTF(RubyQueue, "Deferring enqueueing message: %s, Address %#x\n",
            *(message.get()), addr);
    (m_deferred_msg_map[addr]).push_back(message);
}

void
MessageBuffer::enqueueDeferredMessages(Addr addr, Tick curTime, Tick delay)
{
    assert(!isDeferredMsgMapEmpty(addr));
    std::vector<MsgPtr>& msg_vec = m_deferred_msg_map[addr];
    assert(msg_vec.size() > 0);

    // enqueue all deferred messages associated with this address
    for (MsgPtr m : msg_vec) {
        enqueue(m, curTime, delay);
    }

    msg_vec.clear();
    m_deferred_msg_map.erase(addr);
}

bool
MessageBuffer::isDeferredMsgMapEmpty(Addr addr) const
{
    return m_deferred_msg_map.count(addr) == 0;
}

void
MessageBuffer::print(ostream& out) const
{
    ccprintf(out, "[MessageBuffer: ");
    if (m_consumer != NULL) {
        ccprintf(out, " consumer-yes ");
    }

    vector<MsgPtr> copy(m_prio_heap);
    sort_heap(copy.begin(), copy.end(), greater<MsgPtr>());
    ccprintf(out, "%s] %s", copy, name());
}

bool
MessageBuffer::isReady(Tick current_time) const
{
    if ((m_prio_heap.size() > 0) &&
            (m_prio_heap.front()->getLastEnqueueTime() <= current_time)) {
        MsgPtr msg_ptr = m_prio_heap.front();
        bool ready = !msg_ptr->isInvRequest() ||
            prepushAddrs.find(msg_ptr->getLineAddr()) == prepushAddrs.end();
        return ready;
    }

    return false;
}

NetDest
MessageBuffer::getGetSRequestors(Tick current_time, Addr addr, MachineID mid)
{
    assert(getSRequestorsMap.count(addr));
    assert(getSMsgPtrVecMap.count(addr));

    assert(getSMsgPtrVecMap[addr][0]->getRequestor() == mid);

    NetDest requestors;

    for (int i = 1; i < getSMsgPtrVecMap[addr].size(); i++) {
        MsgPtr msg_ptr = getSMsgPtrVecMap[addr][i];

        if (msg_ptr->getLastEnqueueTime() <= current_time)
            requestors.add(msg_ptr->getRequestor());
    }

    return requestors;
}

void
MessageBuffer::coalesceGetSRequestors(Tick current_time,
                                      Addr addr,
                                      MachineID mid)
{
    assert(getSRequestorsMap.count(addr));
    assert(getSRequestorsMap[addr].isElement(mid));

    if (!coalescing)
        return;

    vector<unsigned> removed_positions;

    for (unsigned i = 1; i < m_prio_heap.size(); ++i) {
        MsgPtr message  = m_prio_heap[i];
        if (message->isReadRequest() && message->getLineAddr() == addr &&
                message->getLastEnqueueTime() <= current_time) {
            MachineID machine_id = message->getRequestor();
            assert(getSRequestorsMap[addr].isElement(machine_id));

            getSRequestorsMap[addr].remove(machine_id);

            DPRINTF(RubyCoalescing, "Coalescing: request from %s is coalesced"
                    " by %s, addr: %#x\n", machine_id, mid, addr);

            removed_positions.push_back(i);

            message->updateDelayedTicks(current_time);
        }
    }

    int num_removals = removed_positions.size();

    if (num_removals > 0) {
        for (auto i = 0; i < num_removals; ++i) {
            m_prio_heap.erase(m_prio_heap.begin() + removed_positions[i] - i);
        }
        make_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());

        assert(num_removals < getSMsgPtrVecMap[addr].size());
        assert(getSMsgPtrVecMap[addr].front()->getRequestor() == mid);

#ifdef VERIFY_COALESCING_ORDER // remove the define macro to verify
        for (auto i = 1; i < num_removals + 1; ++i) {
            assert(getSMsgPtrVecMap[addr][i]->getLastEnqueueTime() <=
                    current_time);
        }

        for (auto i = num_removals + 1; i < getSMsgPtrVecMap.size(); ++i) {
            assert(getSMsgPtrVecMap[addr][i]->getLastEnqueueTime() >
                    current_time);
        }
#endif

        getSMsgPtrVecMap[addr].erase(getSMsgPtrVecMap[addr].begin() + 1,
                getSMsgPtrVecMap[addr].begin() + num_removals + 1);
    }
}

void
MessageBuffer::registerPrepush(Addr addr, NetDest &net_dest, MachineID mid)
{
    // register in filter
    if (prepushFilter.find(addr) == prepushFilter.end()) {
        prepushFilter[addr] = net_dest;

        DPRINTF(PrepushFilter, "PrepushFilter: register prepush for addr %#x "
                " with dest %s by %s\n", addr, net_dest, mid);
    } else {
        // prune additional resposne
        if (net_dest.isEqual(prepushFilter[addr])) {
            DPRINTF(PrepushFilter, "PrepushFilter: prune and drop redundant "
                    "prepush  addr %#x (with dest %s) initiated by %s, "
                    "existing entry dest %s\n", addr,
                    net_dest.smallestElement(), mid, prepushFilter[addr]);
            net_dest.clear();
        } else {
            NetDest pruned_net_dest = prepushFilter[addr].AND(net_dest);
            net_dest.removeNetDest(pruned_net_dest);
                prepushFilter[addr].addNetDest(net_dest);

            DPRINTF(PrepushFilter, "PrepushFilter: register prepush addr %#x "
                    "with dest %s to existing entry initiated by %s, pruned "
                    "dest %s, new entry dest: %s\n", addr, net_dest, mid,
                    pruned_net_dest, prepushFilter[addr]);
        }
    }
}

void
MessageBuffer::filterGetSRequestors(Addr addr,
                                    NetDest net_dest,
                                    NetDest &demand_dests,
                                    MachineID mid,
                                    Tick current_time,
                                    bool except_first)
{
    // For prepush coherence: a new prepush message initiated by another
    // sharer (who may dropped the previous prepushed data) can overlap with
    // the existing one in the queue at core side.
    if (net_dest.isEmpty())
        return;

    // filter outstanding GetS requests replied by this prepush
    vector<unsigned> filtered_positions;

    unsigned first = except_first ? 1 : 0;

    for (unsigned i = first; i < m_prio_heap.size(); ++i) {
        MsgPtr message  = m_prio_heap[i];
        MachineID machine_id = message->getRequestor();
        if (message->isReadRequest() && message->getLineAddr() == addr &&
                net_dest.isElement(machine_id)) {

            DPRINTF(PrepushFilter, "PrepushFilter: request from %s for addr "
                    " %#x is filtered by prepush initiated by %s\n",
                    machine_id, addr, mid);

            demand_dests.add(machine_id);
            filtered_positions.push_back(i);

            // TODO: profile message delay for stats
            //message->updateDelayedTicks(current_time);

            if (profile) {
                DPRINTF(RubyCoalescing, "Coalescing: filter: removing %s from"
                        "getSRequestorsMap entry for address %#x (PC: %#x): "
                        "%s\n", machine_id, addr, message->getpc(),
                        getSRequestorsMap[addr]);

                assert(getSRequestorsMap[addr].isElement(machine_id));
                getSRequestorsMap[addr].remove(machine_id);
            }
        }
    }

    int filtered_num = filtered_positions.size();

    if (filtered_num > 0) {
        prepushFilterActivity += filtered_num;

        for (auto i = 0; i < filtered_num; ++i) {
            auto iter = m_prio_heap.begin() + filtered_positions[i] - i;
            m_prio_heap.erase(iter);
        }
        make_heap(m_prio_heap.begin(), m_prio_heap.end(), greater<MsgPtr>());

        if (profile) {
            DPRINTF(RubyCoalescing, "Coalescing: filter: before remove for "
                    "addr %#x: [ ", addr);
            for (auto msg_ptr: getSMsgPtrVecMap[addr]) {
                DPRINTF(RubyCoalescing, "%s ", msg_ptr->getRequestor());
            }
            DPRINTF(RubyCoalescing, "] after remove: [ ");

            auto end = std::remove_if(getSMsgPtrVecMap[addr].begin() + first,
                                      getSMsgPtrVecMap[addr].end(),
                                      [net_dest](const MsgPtr &msg_ptr) {
                                          return net_dest.isElement(
                                                  msg_ptr->getRequestor());
                                      });
            getSMsgPtrVecMap[addr].erase(end, getSMsgPtrVecMap[addr].end());

            for (auto msg_ptr: getSMsgPtrVecMap[addr]) {
                DPRINTF(RubyCoalescing, "%s ", msg_ptr->getRequestor());
            }
            DPRINTF(RubyCoalescing, "]\n");

            if (getSRequestorsMap[addr].isEmpty()) {
                assert(getSMsgPtrVecMap[addr].empty());

                getSRequestorsMap.erase(addr);
                getSMsgPtrVecMap.erase(addr);

                DPRINTF(RubyCoalescing, "Coalescing: filter: remove empty "
                        "getSRequestorsMap entry for address %#x\n", addr);
            }
        }
    }
}

bool
MessageBuffer::deregisterPrepush(Addr addr, NetDest net_dest, MachineID mid)
{
    bool remove_entry = false;
    auto it = prepushFilter.find(addr);

    if(it == prepushFilter.end()){
        remove_entry = false;
    } else {
        it->second.removeNetDest(net_dest);

        DPRINTF(PrepushFilter, "PrepushFilter: deregister prepush dest %s for "
                "addr %#x initiated by %s, remaining dest %s\n",
                net_dest, addr, mid,  it->second);

        if (it->second.isEmpty()) {
            DPRINTF(PrepushFilter, "PrepushFilter: removes prepush entry for addr"
                    " %#x initiated by %s\n", addr, mid);

            prepushFilter.erase(it);
            remove_entry = true;
        }
    }

    return remove_entry;
}

void
MessageBuffer::insertPrepushAddr(Addr addr, NetDest &net_dest, MachineID mid)
{
    if (prepushAddrs.find(addr) != prepushAddrs.end()) {
        DPRINTF(PrepushFilter, "PrepushCoherence: prepush addr %#x already in"
                "prepushAddrs set, initiated by %s for dest %s\n",
                addr, mid, net_dest);
    } else {
        prepushAddrs.insert(addr);
        DPRINTF(PrepushFilter, "PrepushCoherence: insert prepush addr %#x in "
                "prepushAddrs set, initiated by %s for dest %s\n",
                addr, mid, net_dest);
    }
}

void
MessageBuffer::erasePrepushAddr(Addr addr, MachineID mid)
{
    prepushAddrs.erase(addr);
    DPRINTF(PrepushFilter, "PrepushCoherence: erase prepush addr %#x from "
            "prepushAddrs set, erasor %s\n", addr, mid);
}

bool
MessageBuffer::isProfile(const Addr pc)
{
    if (!profile)
        return false;

    if (profileAllPCs)
        return true;
    else if (pc > 0 && pc >= profilePCLow && pc <= profilePCHigh)
        return true;

    return false;
}

void
MessageBuffer::regStats()
{
    m_not_avail_count
        .name(name() + ".not_avail_count")
        .desc("Number of times this buffer did not have N slots available")
        .flags(Stats::nozero);

    m_buf_msgs
        .name(name() + ".avg_buf_msgs")
        .desc("Average number of messages in buffer")
        .flags(Stats::nozero);

    m_stall_count
        .name(name() + ".num_msg_stalls")
        .desc("Number of times messages were stalled")
        .flags(Stats::nozero);

    m_occupancy
        .name(name() + ".avg_buf_occ")
        .desc("Average occupancy of buffer capacity")
        .flags(Stats::nozero);

    m_stall_time
        .name(name() + ".avg_stall_time")
        .desc("Average number of cycles messages are stalled in this MB")
        .flags(Stats::nozero);

    if (m_max_size > 0) {
        m_occupancy = m_buf_msgs / m_max_size;
    } else {
        m_occupancy = 0;
    }

    concurrentReqHistogram
        .init(10, 1)
        .name(name() + ".concurrent_request_histogram")
        .desc("Number of concurrent GetS requests distribution histogram")
        .flags(Stats::pdf | Stats::nozero | Stats::oneline)
        ;

    prepushFilterActivity
        .name(name() + ".prepush_filter_activity")
        .flags(Stats::nozero)
        ;
}

uint32_t
MessageBuffer::functionalAccess(Packet *pkt, bool is_read)
{
    DPRINTF(RubyQueue, "functional %s for %#x\n",
            is_read ? "read" : "write", pkt->getAddr());

    uint32_t num_functional_accesses = 0;

    // Check the priority heap and write any messages that may
    // correspond to the address in the packet.
    for (unsigned int i = 0; i < m_prio_heap.size(); ++i) {
        Message *msg = m_prio_heap[i].get();
        if (is_read && msg->functionalRead(pkt))
            return 1;
        else if (!is_read && msg->functionalWrite(pkt))
            num_functional_accesses++;
    }

    // Check the stall queue and write any messages that may
    // correspond to the address in the packet.
    for (StallMsgMapType::iterator map_iter = m_stall_msg_map.begin();
         map_iter != m_stall_msg_map.end();
         ++map_iter) {

        for (std::list<MsgPtr>::iterator it = (map_iter->second).begin();
            it != (map_iter->second).end(); ++it) {

            Message *msg = (*it).get();
            if (is_read && msg->functionalRead(pkt))
                return 1;
            else if (!is_read && msg->functionalWrite(pkt))
                num_functional_accesses++;
        }
    }

    return num_functional_accesses;
}
