/*
 * Copyright (c) 2017,2019,2020 ARM Limited
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
 * Copyright (c) 2009-2014 Mark D. Hill and David A. Wood
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

#ifndef __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCONTROLLER_HH__
#define __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCONTROLLER_HH__

#include <exception>
#include <iostream>
#include <string>
#include <unordered_map>

#include "base/addr_range.hh"
#include "base/addr_range_map.hh"
#include "base/callback.hh"
#include "debug/RubyPrepush.hh"
#include "mem/packet.hh"
#include "mem/qport.hh"
#include "mem/ruby/common/Address.hh"
#include "mem/ruby/common/Consumer.hh"
#include "mem/ruby/common/DataBlock.hh"
#include "mem/ruby/common/Histogram.hh"
#include "mem/ruby/common/MachineID.hh"
#include "mem/ruby/network/MessageBuffer.hh"
#include "mem/ruby/protocol/AccessPermission.hh"
#include "mem/ruby/system/CacheRecorder.hh"
#include "params/RubyController.hh"
#include "sim/clocked_object.hh"
#include "mem/ruby/protocol/RubyAccessMode.hh"
#include "mem/ruby/protocol/PrefetchBit.hh"
#include "mem/ruby/slicc_interface/RubySlicc_ComponentMapping.hh"

class Network;
class GPUCoalescer;
class DMASequencer;
class CacheMemory;
class AbstractCacheEntry;

// used to communicate that an in_port peeked the wrong message type
class RejectException: public std::exception
{
    virtual const char* what() const throw()
    { return "Port rejected message based on type"; }
};

class AbstractController : public ClockedObject, public Consumer
{
  public:
    typedef RubyControllerParams Params;
    AbstractController(const Params &p);
    void init();
    const Params &params() const { return (const Params &)_params; }

    NodeID getVersion() const { return m_machineID.getNum(); }
    MachineType getType() const { return m_machineID.getType(); }

    void initNetworkPtr(Network* net_ptr) { m_net_ptr = net_ptr; }

    // return instance name
    void blockOnQueue(Addr, MessageBuffer*);
    bool isBlocked(Addr) const;
    void unblock(Addr);
    bool isBlocked(Addr);

    virtual MessageBuffer* getMandatoryQueue() const = 0;
    virtual MessageBuffer* getMemReqQueue() const = 0;
    virtual MessageBuffer* getMemRespQueue() const = 0;
    virtual AccessPermission getAccessPermission(const Addr &addr) = 0;

    virtual CacheMemory* getCacheMemory() const = 0;

    virtual void print(std::ostream & out) const = 0;
    virtual void wakeup() = 0;
    virtual void resetStats() = 0;
    virtual void regStats();

    virtual void recordCacheTrace(int cntrl, CacheRecorder* tr) = 0;
    virtual Sequencer* getCPUSequencer() const = 0;
    virtual DMASequencer* getDMASequencer() const = 0;
    virtual GPUCoalescer* getGPUCoalescer() const = 0;

    // This latency is used by the sequencer when enqueueing requests.
    // Different latencies may be used depending on the request type.
    // This is the hit latency unless the top-level cache controller
    // introduces additional cycles in the response path.
    virtual Cycles mandatoryQueueLatency(const RubyRequestType& param_type)
    { return m_mandatory_queue_latency; }

    //! These functions are used by ruby system to read/write the data blocks
    //! that exist with in the controller.
    virtual bool functionalReadBuffers(PacketPtr&) = 0;
    virtual void functionalRead(const Addr &addr, PacketPtr) = 0;
    void functionalMemoryRead(PacketPtr);
    //! The return value indicates the number of messages written with the
    //! data from the packet.
    virtual int functionalWriteBuffers(PacketPtr&) = 0;
    virtual int functionalWrite(const Addr &addr, PacketPtr) = 0;
    int functionalMemoryWrite(PacketPtr);

    //! Function for enqueuing a prefetch request
    virtual void enqueuePrefetch(const Addr &, const RubyRequestType&)
    { fatal("Prefetches not implemented!");}

    //! Function for collating statistics from all the controllers of this
    //! particular type. This function should only be called from the
    //! version 0 of this controller type.
    virtual void collateStats()
    {fatal("collateStats() should be overridden!");}

    //! Initialize the message buffers.
    virtual void initNetQueues() = 0;

    /** A function used to return the port associated with this bus object. */
    Port &getPort(const std::string &if_name,
                  PortID idx=InvalidPortID);

    void recvTimingResp(PacketPtr pkt);
    Tick recvAtomic(PacketPtr pkt);

    const AddrRangeList &getAddrRanges() const { return addrRanges; }

    // Profiling
    static Addr profilePCLow;
    static Addr profilePCHigh;
    static Addr profileVaddrLow;
    static Addr profileVaddrHigh;
    static bool profileAllPCs;
    static bool profileAllVaddrs;
    static bool profileAll;

    static void setProfilingRange(Addr pc_low, Addr pc_high,
                                  Addr vaddr_low, Addr vaddr_high);
    static bool isProfile(const Addr pc, const Addr vaddr);

    bool profileLLCSharers;
    virtual Stats::Histogram &getSharerHistogram() { return sharerHistogram; }

    /** Enable/disable shared data pre-push */
    static bool prepush;
    static void enablePrepush() { prepush = true; }
    static void disablePrepush() { prepush = false; }
    static bool profilingEnabled;
    static void enableProfiling() { profilingEnabled = true; }
    static void disableProfiling() { profilingEnabled = false; }

    static bool isPrepushEnabled() { return prepush; }
    static bool isProfilingEnabled() { return profilingEnabled; }

    static bool profilePrepush;
    static void setProfilePrepush() { profilePrepush = true; }

    typedef std::unordered_map<Addr, uint64_t> PcPrepushMap;
    virtual PcPrepushMap &getPcPrepushCountMap() { return pcPrepushCountMap; }
    virtual PcPrepushMap &
    getPcPrepushSharerMap()
    {
        return pcPrepushSharersMap;
    }
    virtual PcPrepushMap & getPcUnicastCountMap() { return pcUnicastCountMap; }

    virtual NetDest &getPrepushDisabledDest() {
        return prepushDisabledDest;
    }

    virtual bool isPrepushDisabled(MachineID mid) {
        return prepushDisabledDest.isElement(mid);
    }

    virtual void disablePrepushForCore(MachineID mid) {
        if (!prepushDisabledDest.isElement(mid)) {
            prepushDisabledDest.add(mid);
        }
    }

    virtual void enablePrepushForCore(MachineID mid) {
        if (prepushDisabledDest.isElement(mid)) {
            prepushDisabledDest.remove(mid);
        }
    }

    virtual bool isemptyPrepushForCore() {
        return prepushDisabledDest.isEmpty();
    }

    virtual int countPrepushForCore() {
        return prepushDisabledDest.count();
    }

    // coalescing
    static bool coalescing;
    static void enableCoalescing() { coalescing = true; }
    static void disableCoalescing() { coalescing = false; }

    bool isCoalescingEnabled() { return coalescing; }

    inline virtual void
    updateCoalescingHistogram(int num)
    {
        coalescingHistogram.sample(num);
    }

    virtual Stats::Histogram &
    getCoalescingHistogram()
    {
        return coalescingHistogram;
    }

    /** Used to get pc from packet. */
    bool hasPC(PacketPtr pkt) const {
      return pkt->req->hasPC();
    }
    Addr getPC(PacketPtr pkt) const {
      return pkt->req->getPC();
    }

  public:
    MachineID getMachineID() const { return m_machineID; }
    RequestorID getRequestorId() const { return m_id; }

    Stats::Histogram& getDelayHist() { return m_delayHistogram; }
    Stats::Histogram& getDelayVCHist(uint32_t index)
    { return *(m_delayVCHistogram[index]); }

    bool respondsTo(Addr addr)
    {
        for (auto &range: addrRanges)
            if (range.contains(addr)) return true;
        return false;
    }

    /**
     * Map an address to the correct MachineID
     *
     * This function querries the network for the NodeID of the
     * destination for a given request using its address and the type
     * of the destination. For example for a request with a given
     * address to a directory it will return the MachineID of the
     * authorative directory.
     *
     * @param the destination address
     * @param the type of the destination
     * @return the MachineID of the destination
     */
    MachineID mapAddressToMachine(Addr addr, MachineType mtype) const;

    /**
     * Maps an address to the correct dowstream MachineID (i.e. the component
     * in the next level of the cache hierarchy towards memory)
     *
     * This function uses the local list of possible destinations instead of
     * querying the network.
     *
     * @param the destination address
     * @param the type of the destination (optional)
     * @return the MachineID of the destination
     */
    MachineID mapAddressToDownstreamMachine(Addr addr,
                                    MachineType mtype = MachineType_NUM) const;

    const NetDest& allDownstreamDest() const { return downstreamDestinations; }

  protected:
    //! Profiles original cache requests including PUTs
    void profileRequest(const std::string &request);
    //! Profiles the delay associated with messages.
    void profileMsgDelay(uint32_t virtualNetwork, Cycles delay);

    // Tracks outstanding transactions for latency profiling
    struct TransMapPair { unsigned transaction; unsigned state; Tick time; };
    std::unordered_map<Addr, TransMapPair> m_inTrans;
    std::unordered_map<Addr, TransMapPair> m_outTrans;

    // Initialized by the SLICC compiler for all combinations of event and
    // states. Only histograms with samples will appear in the stats
    std::vector<std::vector<std::vector<Stats::Histogram*>>> m_inTransLatHist;

    // Initialized by the SLICC compiler for all events.
    // Only histograms with samples will appear in the stats.
    std::vector<Stats::Histogram*> m_outTransLatHist;

    /**
     * Profiles an event that initiates a protocol transactions for a specific
     * line (e.g. events triggered by incoming request messages).
     * A histogram with the latency of the transactions is generated for
     * all combinations of trigger event, initial state, and final state.
     *
     * @param addr address of the line
     * @param type event that started the transaction
     * @param initialState state of the line before the transaction
     */
    template<typename EventType, typename StateType>
    void incomingTransactionStart(Addr addr,
        EventType type, StateType initialState)
    {
        assert(m_inTrans.find(addr) == m_inTrans.end());
        m_inTrans[addr] = {type, initialState, curTick()};
    }

    /**
     * Profiles an event that ends a transaction.
     *
     * @param addr address of the line with a outstanding transaction
     * @param finalState state of the line after the transaction
     */
    template<typename StateType>
    void incomingTransactionEnd(Addr addr, StateType finalState)
    {
        auto iter = m_inTrans.find(addr);
        assert(iter != m_inTrans.end());
        m_inTransLatHist[iter->second.transaction]
                        [iter->second.state]
                        [(unsigned)finalState]->sample(
                          ticksToCycles(curTick() - iter->second.time));
       m_inTrans.erase(iter);
    }

    /**
     * Profiles an event that initiates a transaction in a peer controller
     * (e.g. an event that sends a request message)
     *
     * @param addr address of the line
     * @param type event that started the transaction
     */
    template<typename EventType>
    void outgoingTransactionStart(Addr addr, EventType type)
    {
        assert(m_outTrans.find(addr) == m_outTrans.end());
        m_outTrans[addr] = {type, 0, curTick()};
    }

    /**
     * Profiles the end of an outgoing transaction.
     * (e.g. receiving the response for a requests)
     *
     * @param addr address of the line with an outstanding transaction
     */
    void outgoingTransactionEnd(Addr addr)
    {
        auto iter = m_outTrans.find(addr);
        assert(iter != m_outTrans.end());
        m_outTransLatHist[iter->second.transaction]->sample(
            ticksToCycles(curTick() - iter->second.time));
        m_outTrans.erase(iter);
    }

    void stallBuffer(MessageBuffer* buf, Addr addr);
    void wakeUpBuffers(Addr addr);
    void wakeUpAllBuffers(Addr addr);
    void wakeUpAllBuffers();
    bool serviceMemoryQueue();

  protected:
    const NodeID m_version;
    MachineID m_machineID;
    const NodeID m_clusterID;

    // RequestorID used by some components of gem5.
    const RequestorID m_id;

    Network *m_net_ptr;
    bool m_is_blocking;
    std::map<Addr, MessageBuffer*> m_block_map;

    typedef std::vector<MessageBuffer*> MsgVecType;
    typedef std::set<MessageBuffer*> MsgBufType;
    typedef std::map<Addr, MsgVecType* > WaitingBufType;
    WaitingBufType m_waiting_buffers;

    unsigned int m_in_ports;
    unsigned int m_cur_in_port;
    const int m_number_of_TBEs;
    const int m_transitions_per_cycle;
    const unsigned int m_buffer_size;
    Cycles m_recycle_latency;
    const Cycles m_mandatory_queue_latency;

    //! Counter for the number of cycles when the transitions carried out
    //! were equal to the maximum allowed
    Stats::Scalar m_fully_busy_cycles;
    Stats::Histogram transitionsPerBusyCycle;

    //! Histogram for profiling delay for the messages this controller
    //! cares for
    Stats::Histogram m_delayHistogram;
    std::vector<Stats::Histogram *> m_delayVCHistogram;

    // For profiling sharers
    typedef std::unordered_map<Addr, Cycles> AddrCycleMapType;
    typedef std::unordered_map<Addr, int> AddrSharersMapType;
    AddrCycleMapType   addrCycleMap;
    AddrSharersMapType addrSharersMap;
    int windowCycles;
    Cycles minSharerUpdateCycle;
    // Histogram for number of sharers during a time window
    Stats::Histogram sharerHistogram;

    void profileSharerHistogram(const Addr addr);

    bool alwaysPrepush;
    std::set<Addr> prepushedAddrSet;
    bool hasBeenPrepushed(const Addr addr);

    // Coalescing
    Stats::Histogram coalescingHistogram;

    // Prepush PCs and distribution
    PcPrepushMap pcPrepushCountMap;
    PcPrepushMap pcPrepushSharersMap;
    PcPrepushMap pcUnicastCountMap;
    void profilePrepushPC(const Addr pc, const NetDest sharers);
    void profileUnicastPC(const Addr pc);

    /**
     * Sanity check for prepush coherence. When a write permission is granted
     * to a private L1 cache, all its L1 peers should not have the data (can
     * be in transition state from I). There should not be any in-flight
     * prepush message for the same cacheline as well.
     *
     * @param addr address of the line
     * @param machine ID that asks for the check
     */
    void prepushCoherenceSanityCheck(Addr addr, MachineID mid);

    virtual bool isCoherent(AbstractCacheEntry *cache_entry)
    { panic("isCoherent() called on wrong cache entry!"); }

    /**
     * Port that forwards requests and receives responses from the
     * memory controller.
     */
    class MemoryPort : public RequestPort
    {
      private:
        // Controller that operates this port.
        AbstractController *controller;

      public:
        MemoryPort(const std::string &_name, AbstractController *_controller,
                   PortID id = InvalidPortID);

      protected:
        // Function for receiving a timing response from the peer port.
        // Currently the pkt is handed to the coherence controller
        // associated with this port.
        bool recvTimingResp(PacketPtr pkt);

        void recvReqRetry();
    };

    /* Request port to the memory controller. */
    MemoryPort memoryPort;

    // State that is stored in packets sent to the memory controller.
    struct SenderState : public Packet::SenderState
    {
        // Id of the machine from which the request originated.
        MachineID id;

        SenderState(MachineID _id) : id(_id)
        {}
    };

  private:
    /** The address range to which the controller responds on the CPU side. */
    const AddrRangeList addrRanges;

    typedef std::unordered_map<MachineType, MachineID> AddrMapEntry;

    AddrRangeMap<AddrMapEntry, 3> downstreamAddrMap;

    NetDest downstreamDestinations;

    NetDest prepushDisabledDest;

    RubySystem *rubySystem;

    //Start adding for Software Prepush (Private Cache)
  public:
  virtual void SetDoneConfig() {
    DoneConfig = true;
  }

  virtual void UnSetDoneConfig() {
    DoneConfig = false;
  }

  virtual bool isDoneConfig() {
    return DoneConfig;
  }

  virtual void SetWaitConfigAck() {
    WaitConfigAck = true;
  }

  virtual void UnSetWaitConfigAck() {
    WaitConfigAck = false;
  }

  virtual bool isWaitConfigAck() {
    return WaitConfigAck;
  }

  virtual NetDest &getHostGuestFullBitMap() {
      return HostGuestFullBitMap;
  }

  virtual bool isCoreHost(MachineID mid) {
      return !HostGuestFullBitMap.isElement(mid);
  }

  virtual void SetAsHost(MachineID mid) {
      if (HostGuestFullBitMap.isElement(mid)) {
          HostGuestFullBitMap.remove(mid);
      }
  }

  virtual void SetAsGuest(MachineID mid) {
      if (!HostGuestFullBitMap.isElement(mid)) {
          HostGuestFullBitMap.add(mid);
      }
  }

  virtual bool isAllHost() {
      return HostGuestFullBitMap.isEmpty();
  }

  virtual int countNumOfGuest() {
      return HostGuestFullBitMap.count();
  }

  virtual void ClearAll() {
      HostGuestFullBitMap.clear(); //set all to host
      
  }

  virtual void first_arrival (Addr addr, int distance) {
    warn("%lld: %s: First arrival!!: addr = 0x%x , distance = %d\n", curTick(), name(), addr, distance); //calculate distance
  }

  virtual void reset_received_ack() {
    received_ack = 0;
  }

  virtual void add_received_ack() {
    received_ack += 1;
  }

  virtual int get_received_ack() {
    return received_ack;
  }

  virtual void set_num_of_waiting_ack(int num_of_cpus) {
    num_of_waiting_ack = num_of_cpus;
  }

  virtual int get_num_of_waiting_ack() {
    return num_of_waiting_ack;
  }

  virtual void print_private_configdone() {
    warn("%lld: %s: Finish private cache configuration! \n", curTick(), name());
  }

  virtual void waitlist_register(Addr addr, Addr vaddr, RubyAccessMode AccessMode, PrefetchBit Prefetch, Addr pc, Cycles register_cycle, Cycles timeout_threshold) {
    bool have_entry = false;
    if (num_of_listid > 0) {
      for (int i = 0; i < num_of_listid; i++) {
        if ((waitlist_addr[i] == addr) && waitlist_valid[i]) {
          have_entry = true;
        }
      }
      if (!have_entry) {
        waitlist_addr[num_of_listid] = addr;
        waitlist_vaddr[num_of_listid] = vaddr;
        waitlist_AccessMode[num_of_listid] = AccessMode;
        waitlist_Prefetch[num_of_listid] = Prefetch;
        waitlist_pc[num_of_listid] = pc;
        waitlist_register_cycle[num_of_listid] = register_cycle;
        waitlist_valid[num_of_listid] = true;
        waitlist_valid[num_of_listid + 1] = false;
        switch_host_valid[num_of_listid] = false;
        switch_host_valid[num_of_listid + 1] = false;
        num_of_listid += 1;
        scheduleEvent(Cycles(timeout_threshold + 2));
      }
    } else if (num_of_listid == 0) {
      waitlist_addr[0] = addr;
      waitlist_vaddr[0] = vaddr;
      waitlist_AccessMode[0] = AccessMode;
      waitlist_Prefetch[0] = Prefetch;
      waitlist_pc[0] = pc;
      waitlist_register_cycle[0] = register_cycle;
      waitlist_valid[0] = true;
      waitlist_valid[1] = false;
      switch_host_valid[0] = false;
      switch_host_valid[1] = false;
      num_of_listid += 1;
      scheduleEvent(Cycles(timeout_threshold + 2));
    }
  }

  virtual void waitlist_deregister(Addr addr) {
    if (num_of_listid > 0) {
      bool have_entry = false;
      int find_waitlist_id = 0;
      for (int i = 0; i < num_of_listid; i++) {
        if ((waitlist_addr[i] == addr) && (waitlist_valid[i])) {
          have_entry = true;
          find_waitlist_id = i;
        }
      }
      if (have_entry) {
        assert(waitlist_addr[find_waitlist_id] == addr);
        for(int i = find_waitlist_id; i < num_of_listid - 1; i++) {
          waitlist_addr[i] = waitlist_addr[i+1];
          waitlist_vaddr[i] = waitlist_vaddr[i+1];
          waitlist_AccessMode[i] = waitlist_AccessMode[i+1];
          waitlist_Prefetch[i] = waitlist_Prefetch[i+1];
          waitlist_pc[i] = waitlist_pc[i+1];
          waitlist_register_cycle[i] = waitlist_register_cycle[i+1];
          waitlist_valid[i] = waitlist_valid[i+1];
          switch_host_valid[i] = switch_host_valid[i+1];
        }
        waitlist_valid[num_of_listid - 1] = false;
        switch_host_valid[num_of_listid - 1] = false;
        num_of_listid -= 1;
      }
    }
  }

  virtual bool is_in_waitlist (Addr addr) {
    bool have_entry = false;
    for (int i = 0; i < num_of_listid; i++) {
      if ((waitlist_addr[i] == addr) && (waitlist_valid[i])) {
        have_entry = true;
      }
    }
    return have_entry;
  }

  virtual bool check_timeout(Cycles curtick, Cycles timeout_threshold, int division, int id) {
    bool timeout = false;
    if (division > 0) {
      timeout = ((((waitlist_register_cycle[0] + (timeout_threshold / division)) < curtick) && waitlist_valid[0]) && (curtick > last_check_tick) && (num_of_listid > 0));
    } else {
      timeout = ((((waitlist_register_cycle[0] + (timeout_threshold * division)) < curtick) && waitlist_valid[0]) && (curtick > last_check_tick) && (num_of_listid > 0));
    }
    if (timeout) {
      last_check_tick = curtick;
    }
    return timeout;
  }

  virtual Addr &gettimeout_waitlist_addr() {
    return waitlist_addr[0];
  }

  virtual Addr &gettimeout_waitlist_vaddr() {
    return waitlist_vaddr[0];
  }

  virtual RubyAccessMode &gettimeout_waitlist_AccessMode() {
    return waitlist_AccessMode[0];
  }

  virtual PrefetchBit &gettimeout_waitlist_Prefetch() {
    return waitlist_Prefetch[0];
  }

  virtual Addr &gettimeout_waitlist_pc() {
    return waitlist_pc[0];
  }

  virtual void update_waitlist_hostswitch(MachineID m_id, MachineType machinetype, int l2_select_low_bit, int l2_select_num_bits, NodeID clusterID) {
    MachineID mapped_dest;
    for (int i = 0; i < num_of_listid; i++) {
      mapped_dest = mapAddressToRange(waitlist_addr[i], machinetype,
                        l2_select_low_bit, l2_select_num_bits, clusterID);
      // warn("%lld: %s: Check waitlist match!!: mapped_dest = %s; m_id = %s!!\n", curTick(), name(), mapped_dest, m_id);
      if ((mapped_dest == m_id) && (waitlist_valid[i])) {
        switch_host_valid[i] = true;
        // warn("%lld: %s: Set waitlist True!!: addr = %s; pc = %s; register time = %s!!\n", curTick(), name(), waitlist_addr[i], waitlist_pc[i], waitlist_register_cycle[i]);
        scheduleEvent(Cycles(1));
        scheduleEvent(Cycles(2));
      }
    }
  }

  virtual bool check_host_switch_demand_req() {
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        return true;
      }
    }
    return false;
  }

  virtual Addr &switchhost_waitlist_addr() {
    int find_waitlist_id = 0;
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        find_waitlist_id = i;
      }
    }
    return waitlist_addr[find_waitlist_id];
  }

  virtual Addr &switchhost_waitlist_vaddr() {
    int find_waitlist_id = 0;
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        find_waitlist_id = i;
      }
    }
    return waitlist_vaddr[find_waitlist_id];
  }

  virtual RubyAccessMode &switchhost_waitlist_AccessMode() {
    int find_waitlist_id = 0;
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        find_waitlist_id = i;
      }
    }
    return waitlist_AccessMode[find_waitlist_id];
  }

  virtual PrefetchBit &switchhost_waitlist_Prefetch() {
    int find_waitlist_id = 0;
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        find_waitlist_id = i;
      }
    }
    return waitlist_Prefetch[find_waitlist_id];
  }

  virtual Addr &switchhost_waitlist_pc() {
    int find_waitlist_id = 0;
    for (int i = 0; i < num_of_listid; i++) {
      if ((switch_host_valid[i]) && (waitlist_valid[i])) {
        find_waitlist_id = i;
      }
    }
    return waitlist_pc[find_waitlist_id];
  }

  virtual void deallocate_hostswitch_waitlist() {
    if (num_of_listid > 0) {
      bool have_entry = false;
      int find_waitlist_id = 0;
      for (int i = 0; i < num_of_listid; i++) {
        if ((switch_host_valid[i]) && (waitlist_valid[i])) {
          have_entry = true;
          find_waitlist_id = i;
        }
      }
      if (have_entry) {
        assert(switch_host_valid[find_waitlist_id]);
        for(int i = find_waitlist_id; i < num_of_listid - 1; i++) {
          waitlist_addr[i] = waitlist_addr[i+1];
          waitlist_vaddr[i] = waitlist_vaddr[i+1];
          waitlist_AccessMode[i] = waitlist_AccessMode[i+1];
          waitlist_Prefetch[i] = waitlist_Prefetch[i+1];
          waitlist_pc[i] = waitlist_pc[i+1];
          waitlist_register_cycle[i] = waitlist_register_cycle[i+1];
          waitlist_valid[i] = waitlist_valid[i+1];
          switch_host_valid[i] = switch_host_valid[i+1];
        }
        waitlist_valid[num_of_listid - 1] = false;
        switch_host_valid[num_of_listid - 1] = false;
        num_of_listid -= 1;
        // warn("%lld: %s: addr = %s, Deregister wait list at %s!, num_of_listid = %s, bottomaddr = %s, bottomvalid = %s, topvalid = %s!\n", curTick(), name(), addr, find_waitlist_id, num_of_listid, waitlist_addr[0], waitlist_valid[0], waitlist_valid[num_of_listid]);
      }
    }
  }

  virtual void pop_waitlist(Addr addr) {
    if (num_of_listid > 0) {
      assert((waitlist_addr[0] == addr) && waitlist_valid[0]);
      // warn("%lld: %s: addr = %s, Deregister wait list at 0!\n", curTick(), name(), waitlist_addr[0]);
      for(int i = 0; i < num_of_listid - 1; i++) {
        waitlist_addr[i] = waitlist_addr[i+1];
        waitlist_vaddr[i] = waitlist_vaddr[i+1];
        waitlist_AccessMode[i] = waitlist_AccessMode[i+1];
        waitlist_Prefetch[i] = waitlist_Prefetch[i+1];
        waitlist_pc[i] = waitlist_pc[i+1];
        waitlist_register_cycle[i] = waitlist_register_cycle[i+1];
        waitlist_valid[i] = waitlist_valid[i+1];
        switch_host_valid[i] = switch_host_valid[i+1];
      }
      waitlist_valid[num_of_listid - 1] = false;
      switch_host_valid[num_of_listid - 1] = false;
      num_of_listid -= 1;
      // warn("%lld: %s: addr = %s, valid = %s Peek head after deregister wait list, num_of_listid = %s, bottomaddr = %s, bottomvalid = %s, topvalid = %s!\n", curTick(), name(), waitlist_addr[0], waitlist_valid[0], num_of_listid, waitlist_addr[0], waitlist_valid[0], waitlist_valid[num_of_listid]);
    }
  }

  virtual void update_adaptive_timeout_threshold(int ticks_used, int upper_bound) {
    if (adaptive_timeout_threshold == 0) {
      adaptive_timeout_threshold = ticks_used / 500;
    } else {
      adaptive_timeout_threshold = (adaptive_timeout_threshold + (ticks_used / 500)) / 2;
    }
    if (adaptive_timeout_threshold > upper_bound) {
      adaptive_timeout_threshold = upper_bound;
    }
  }

  virtual int get_adaptive_timeout_threshold() {
    return adaptive_timeout_threshold;
  }

  virtual int return_num_group(MachineID m_id, int numofcores, int numofgroups) {
    return (m_id.getNum() / (numofcores / numofgroups)); 
  }


  virtual void l1_print_GetS(MachineID m_id, Addr addr, Addr pc) {
    if ((addr == 0x1b8d00) && (pc == 0x403569)) {
      warn("%lld: %s: Cycles: %lld ; L1_GetS!!: addr = 0x%x , pc = 0x%x !!\n", curTick(), name(), curTick()/500, addr, pc);
    }
  }

private:
  bool is_after_reset; // Used for printing after reset (The ROI we want to profile)
  bool DoneConfig;                                              //Whether the Configuration is finished
  bool WaitConfigAck;                                           //Whether the Configuration is in progress
  NetDest HostGuestFullBitMap;                                  //added to indicate the state of the current private cache 
  int num_of_waiting_ack;                                       //the number of cpus
  int received_ack;                                             //The number of ack received
  std::unordered_map<int, bool> waitlist_valid;                 //wait list valid 
  std::unordered_map<int, Addr> waitlist_addr;                  //wait list addr
  std::unordered_map<int, Addr> waitlist_vaddr;                 //wait list vaddr
  std::unordered_map<int, RubyAccessMode> waitlist_AccessMode;  //wait list accessmode
  std::unordered_map<int, PrefetchBit> waitlist_Prefetch;       //the host to the corresponding share group id
  std::unordered_map<int, Addr> waitlist_pc;                    //the guest list to the corresponding share group id
  std::unordered_map<int, Cycles> waitlist_register_cycle;         //the request need for the configuration
  std::unordered_map<int, bool> switch_host_valid;              //deregister entry and send prepush request since host switch
  int num_of_listid;                                            //number of the waiting request
  Cycles last_check_tick;                                          //set to avoid checking again in the same tick.
  int adaptive_timeout_threshold;                               //Timeout threshold for current network
//End adding for Software Prepush (Private Cache)

//Start adding for Software Prepush (LLCs)
public:
  virtual void print_receive(MachineID mid) {
    warn("%lld: %s: Receive configuration for: %s\n", curTick(), name(), mid);
  }

  virtual bool entry_exist(int s_id) {
    bool have_entry = false;
    // int find_shareid = 0;
    for (int i = 0; i < num_of_shareid; i++) {
      if (share_id[i] == s_id) {
        // find_shareid = i;
        have_entry = true;
      }
    }
    return have_entry;
  }

  virtual void config_register(int s_id, MachineID m_id, int num_req, int distance, int centerlevel, Cycles current_cycle, int en_center_level) {
    bool have_entry = false;
    int find_shareid = 0;
    for (int i = 0; i < num_of_shareid; i++) {
      if (share_id[i] == s_id) {
        find_shareid = i;
        have_entry = true;
      }
    }
    if (!have_entry) {
      share_id[num_of_shareid] = s_id;
      hostlist[num_of_shareid] = m_id;
      guestlist[num_of_shareid].clear();
      incoming_req[num_of_shareid] = num_req;
      incoming_req[num_of_shareid] -= 1;
      min_distance[num_of_shareid] = distance;
      max_center_level[num_of_shareid] = centerlevel;
      num_of_timeout[num_of_shareid] = 0;
      last_host_set_cycle[num_of_shareid] = current_cycle;
      num_of_shareid += 1;
      warn("%lld: %s: Set as host for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id, distance, centerlevel);
    } else {
      if (en_center_level == 1) {
        if (centerlevel > max_center_level[find_shareid]) {
          min_distance[find_shareid] = distance;
          max_center_level[find_shareid] = centerlevel;
          guestlist[find_shareid].add(hostlist[find_shareid]);
          hostlist[find_shareid] = m_id;
          warn("%lld: %s: Set as host for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id, distance, centerlevel);
        } else if (centerlevel == max_center_level[find_shareid]) {
          if (distance < min_distance[find_shareid]) {
            min_distance[find_shareid] = distance;
            max_center_level[find_shareid] = centerlevel;
            guestlist[find_shareid].add(hostlist[find_shareid]);
            hostlist[find_shareid] = m_id;
            warn("%lld: %s: Set as host for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id, distance, centerlevel);
          } else {
            guestlist[find_shareid].add(m_id);
            warn("%lld: %s: Set as guest for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id, distance, centerlevel);
          }
        } else {
          guestlist[find_shareid].add(m_id);
          warn("%lld: %s: Set as guest for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id, distance, centerlevel);
        }
      } else {
        if (distance < min_distance[find_shareid]) {
          min_distance[find_shareid] = distance;
          guestlist[find_shareid].add(hostlist[find_shareid]);
          hostlist[find_shareid] = m_id;
          warn("%lld: %s: Set as host for: %s in group %s !\n", curTick(), name(), m_id, s_id);
        } else {
          guestlist[find_shareid].add(m_id);
          warn("%lld: %s: Set as guest for: %s in group %s !\n", curTick(), name(), m_id, s_id);
        }
      }
      incoming_req[find_shareid] -= 1;
    }
  }

  virtual MachineID &config_ack_host_dest(int s_id) {
      int find_shareid = 0;
      for (int i = 0; i < num_of_shareid; i++) {
          if (share_id[i] == s_id) {
              find_shareid = i;
          }
      }
      return hostlist[find_shareid];
  }

  virtual NetDest &config_ack_guest_dest(int s_id) {
      int find_shareid = 0;
      for (int i = 0; i < num_of_shareid; i++) {
          if (share_id[i] == s_id) {
              find_shareid = i;
          }
      }
      return guestlist[find_shareid];
  }

  virtual Cycles last_sethost_cycle(int s_id) {
      int find_shareid = 0;
      for (int i = 0; i < num_of_shareid; i++) {
          if (share_id[i] == s_id) {
              find_shareid = i;
          }
      }
      return last_host_set_cycle[find_shareid];
  }

  virtual bool host_switchable (int s_id, int centerlevel) {
    bool can_switch = false;
    int find_shareid = 0;
    for (int i = 0; i < num_of_shareid; i++) {
        if (share_id[i] == s_id) {
            find_shareid = i;
        }
    }
    if (centerlevel >= max_center_level[find_shareid]) {
      can_switch = true;
    } else {
      can_switch = false;
    }
    return can_switch;
}
  
  virtual void switch_host (MachineID m_id, int s_id, Cycles current_cycle) {
      int find_shareid = 0;
      for (int i = 0; i < num_of_shareid; i++) {
          if (share_id[i] == s_id) {
              find_shareid = i;
          }
      }
      guestlist[find_shareid].remove(m_id);
      guestlist[find_shareid].add(hostlist[find_shareid]);
      hostlist[find_shareid] = m_id;
      last_host_set_cycle[find_shareid] = current_cycle;
      // warn("%lld: %s: Switch host for: %s in group %s, distance = %d, centerlevel = %d !\n", curTick(), name(), m_id, s_id);
  }

  virtual bool config_allreceived(int s_id) {
    bool all_received = false;
    bool have_entry = false;
    int find_shareid = 0;
    for (int i = 0; i < num_of_shareid; i++) {
      if (share_id[i] == s_id) {
        find_shareid = i;
        have_entry = true;
      }
    }
    if (have_entry) {
      all_received = incoming_req[find_shareid] == 0;
    }
    return all_received;
  }

  virtual void print_LLC_configdone(int groupnum) {
    warn("%lld: %s: Finish LLC configuration! Group num = %d \n", curTick(), name(), groupnum);
  }

  virtual void print_dest_count(NetDest netdest) {
    warn("%lld: %s: Configuration ack destination count =  %s!\n", curTick(), name(), netdest.count());
  }


  virtual int return_cores_per_group(int numofcpus, int numofgroups) {
    return (numofcpus / numofgroups); 
  }

  virtual int cal_distance(MachineID requestor, MachineID homeid, int numofcores) {
    int length_y = 0;
    length_y = sqrt(numofcores);

    int request_xid = 0;
    int request_yid = 0;
    int home_xid = 0;
    int home_yid = 0;
    request_xid = requestor.getNum() / length_y;
    request_yid = requestor.getNum() % length_y;
    home_xid = homeid.getNum() / length_y;
    home_yid = homeid.getNum() % length_y;

    int distance = abs(request_xid - home_xid) + abs(request_yid - home_yid);
    return distance;
  }

  virtual int center_distance(MachineID requestor, int numofcores) {
    // int length_x = 0;
    int length_y = 0;
    // length_x = sqrt(numofcores);
    length_y = sqrt(numofcores);

    int request_xid = 0;
    int request_yid = 0;
    request_xid = requestor.getNum() / length_y;
    request_yid = requestor.getNum() % length_y;

    int center_x = 0;
    int center_y = 0;

    if (request_xid >= (length_y/2)) {
      center_x = abs(request_xid - length_y + 1);
    } else {
      center_x = request_xid;
    }

    if (request_yid >= (length_y/2)) {
      center_y = abs(request_yid - length_y + 1);
    } else {
      center_y = request_yid;
    }

    int center_level = center_x + center_y;
    return center_level;
  }


  virtual void SetSyncNeed() {
    need_sync = true;
  }

  virtual void UnSetSyncNeed() {
    need_sync = false;
  }

  virtual bool is_SyncNeed() {
    return need_sync;
  }

  virtual void ClearShareMapAll() {
    for (int i = 0; i < num_of_shareid; i++) {
      share_id[i] = 0;
      guestlist[i].resize();
      incoming_req[i] = 0;
      num_of_timeout[i] = 0;
      min_distance[i] = 0;
      max_center_level[i] = 0;
      last_host_set_cycle[i] = Cycles(0);
    }
    num_of_shareid = 0;
  }

private:
  std::unordered_map<int, int> share_id;        //share group id
  std::unordered_map<int, MachineID> hostlist;  //the host to the corresponding share group id
  std::unordered_map<int, NetDest> guestlist;   //the guest list to the corresponding share group id
  std::unordered_map<int, int> incoming_req;    //the request need for the configuration
  std::unordered_map<int, int> num_of_timeout;  //the total number of the timeout request for this share group
  std::unordered_map<int, int> min_distance;    //Minimum distance to the LLC
  std::unordered_map<int, int> max_center_level;//Level of closer to the center of the topology
  std::unordered_map<int, Cycles> last_host_set_cycle;   //the last cycle to reset the host/guest
  int num_of_shareid;                           //the total number of the sharer groups in the LLCs
  bool need_sync;                               // Whether it need synchronization

//End adding for Software Prepush (LLCs)
};

#endif // __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCONTROLLER_HH__
