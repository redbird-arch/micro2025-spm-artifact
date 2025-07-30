/*
 * Copyright (c) 2020 ARM Limited
 * All rights reserved
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
 * Copyright (c) 1999-2012 Mark D. Hill and David A. Wood
 * Copyright (c) 2013 Advanced Micro Devices, Inc.
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

 #ifndef __MEM_RUBY_STRUCTURES_CACHEMEMORY_HH__
 #define __MEM_RUBY_STRUCTURES_CACHEMEMORY_HH__
 
 #include <string>
 #include <unordered_map>
 #include <vector>
 
 #include "base/statistics.hh"
 #include "mem/cache/replacement_policies/base.hh"
 #include "mem/cache/replacement_policies/replaceable_entry.hh"
 #include "mem/ruby/common/DataBlock.hh"
 #include "mem/ruby/common/IntVec.hh"
 #include "mem/ruby/protocol/CacheRequestType.hh"
 #include "mem/ruby/protocol/CacheResourceType.hh"
 #include "mem/ruby/protocol/L1Cache_State.hh"
 #include "mem/ruby/protocol/RubyRequest.hh"
 #include "mem/ruby/slicc_interface/AbstractCacheEntry.hh"
 #include "mem/ruby/slicc_interface/RubySlicc_ComponentMapping.hh"
 #include "mem/ruby/structures/BankedArray.hh"
 #include "mem/ruby/system/CacheRecorder.hh"
 #include "params/RubyCache.hh"
 #include "sim/sim_object.hh"
 
 class CacheMemory : public SimObject
 {
   public:
     typedef RubyCacheParams Params;
     typedef std::shared_ptr<ReplacementPolicy::ReplacementData> ReplData;
     CacheMemory(const Params &p);
     ~CacheMemory();
 
     void init();
 
     // Public Methods
     // perform a cache access and see if we hit or not.  Return true on a hit.
     bool tryCacheAccess(Addr address, RubyRequestType type,
                         DataBlock*& data_ptr);
 
     // similar to above, but doesn't require full access check
     bool testCacheAccess(Addr address, RubyRequestType type,
                          DataBlock*& data_ptr);
 
     // tests to see if an address is present in the cache
     bool isTagPresent(Addr address) const;
 
     // Returns true if there is:
     //   a) a tag match on this address or there is
     //   b) an unused line in the same cache "way"
     bool cacheAvail(Addr address) const;
 
     // Returns a NULL entry that acts as a placeholder for invalid lines
     AbstractCacheEntry*
     getNullEntry() const
     {
         return nullptr;
     }
 
     // find an unused entry and sets the tag appropriate for the address
     AbstractCacheEntry* allocate(Addr address, AbstractCacheEntry* new_entry,
                                  Addr vaddr = 0);
     void allocateVoid(Addr address, AbstractCacheEntry* new_entry)
     {
         allocate(address, new_entry);
     }
 
     // Explicitly free up this address
     void deallocate(Addr address);
     void deallocateWithoutDeletion(Addr address);
 
     // Returns with the physical address of the conflicting cache line
     Addr cacheProbe(Addr address);
     Addr cacheProbe(Addr address) const;
     Addr cacheProbe_print(Addr address);
     Addr cacheProbe_print(Addr address) const;
     Addr cacheProbeForPrepush(Addr address) const;
     bool check_New_Victim(Addr address) const;
     bool check_New_Victim(Addr address);
     Addr cacheProbeLRUElement(Addr address) const;
     Addr cacheProbeLRUElement(Addr address);
 
     // looks an address up in the cache
     AbstractCacheEntry* lookup(Addr address);
     const AbstractCacheEntry* lookup(Addr address) const;
 
     Cycles getTagLatency() const { return tagArray.getLatency(); }
     Cycles getDataLatency() const { return dataArray.getLatency(); }
 
     bool isBlockInvalid(int64_t cache_set, int64_t loc);
     bool isBlockNotBusy(int64_t cache_set, int64_t loc);
 
     // Hook for checkpointing the contents of the cache
     void recordCacheContents(int cntrl, CacheRecorder* tr) const;
 
     // Set this address to most recently used
     void setMRU(Addr address);
     void setMRU(Addr addr, int occupancy);
     void setMRU(AbstractCacheEntry* entry);
     int getReplacementWeight(int64_t set, int64_t loc);
 
     // Functions for locking and unlocking cache lines corresponding to the
     // provided address.  These are required for supporting atomic memory
     // accesses.  These are to be used when only the address of the cache entry
     // is available.  In case the entry itself is available. use the functions
     // provided by the AbstractCacheEntry class.
     void setLocked (Addr addr, int context);
     void clearLocked (Addr addr);
     void clearLockedAll (int context);
     bool isLocked (Addr addr, int context);
 
     // Print cache contents
     void print(std::ostream& out) const;
     void printData(std::ostream& out) const;
 
     void regStats();
     void resetStats();
     void collateStats();
     bool checkResourceAvailable(CacheResourceType res, Addr addr);
     void recordRequestType(CacheRequestType requestType, Addr addr);
 
     // hardware transactional memory
     void htmAbortTransaction();
     void htmCommitTransaction();
 
     // profile sharers
     static int numLLCs;
     static int numCollatedLLCs;
     int getNumLLCs() { return numLLCs; }
     void profileCacheEntry(AbstractCacheEntry* entry);
 
   public:
     Stats::Scalar m_demand_hits;
     Stats::Scalar m_demand_misses;
     Stats::Formula m_demand_accesses;
 
     /** prepush effectiveness stats
      * The following equations can be used for verification
      *
      * prepushes_received == prepushes_for_demand_received +
      *      (early_prepushes_received - prepushes_dropped_for_coherence) +
      *      prepushes_dropped
      * Note: early_prepushes_received may be dropped due to coherence
      *
      * prepushes_dropped == prepushes_dropped_for_deadlock +
      *                      prepushes_dropped_for_coherence +
      *                      prepushes_dropped_for_redundancy
      *                      prepushes_dropped_for_prepush_buffer_full
      * Note: prepushes_dropped_for_coherence are from early_prepushes_received
      *
      * prepushes_dropped_for_redundancy = \
      *          prepushes_dropped_for_redundancy_in_cache + \
      *          prepushes_dropped_for_redundancy_in_prepush_buffer
      *
      * redundant_prepushes_received = prepushes_dropped_for_redundancy
      *
      * prepushedEntries == early_prepushes_received -
      *                     prepushes_dropped_for_coherence
      *
      * earlyPrepushedDemandEntries = prepushes_for_demand_received
      */
 
     // LLC stats
     Stats::Scalar m_prepushes_sent;
     static Stats::Scalar m_total_prepushes_sent;
 
     // private cache stats
     Stats::Scalar m_prepushes_received;
     Stats::Scalar m_redundant_prepushes_received;
     Stats::Scalar m_demandresponse_received;
     Stats::Scalar m_redundant_demandresponse_received;
     Stats::Scalar m_early_prepushes_received;
     Stats::Scalar m_demand_responses;
     Stats::Scalar m_prepushes_dropped;
     Stats::Scalar m_demandresponse_dropped;
     Stats::Scalar m_prepushes_dropped_for_deadlock;
     Stats::Scalar m_prepushes_dropped_for_coherence;
     Stats::Scalar m_prepushes_dropped_for_redundancy;
     Stats::Scalar m_demandresponse_dropped_for_redundancy;
     Stats::Scalar m_prepushes_dropped_for_redundancy_in_cache;
     Stats::Scalar m_prepushes_dropped_for_redundancy_in_prepush_buffer;
     Stats::Scalar m_prepushes_dropped_for_prepush_buffer_full;
     Stats::Scalar m_prepushes_for_demand_received;
     Stats::Scalar m_prepush_buffer_replacement;
     Stats::Scalar m_unusedDemandResponse;
 
     static Stats::Scalar m_total_prepushes_received;
     static Stats::Scalar m_total_redundant_prepushes_received;
     static Stats::Scalar m_total_demandresponse_received;
     static Stats::Scalar m_total_redundant_demandresponse_received;
     static Stats::Scalar m_total_isprepush_redundant_prepushes_received;
     static Stats::Scalar m_total_early_prepushes_received;
     static Stats::Scalar m_total_demand_responses;
     static Stats::Scalar m_total_prepushes_dropped;
     static Stats::Scalar m_total_demandresponse_dropped;
     static Stats::Scalar m_total_prepushes_dropped_for_deadlock;
     static Stats::Scalar m_total_prepushes_dropped_for_prepush_buffer_full;
     static Stats::Scalar m_total_prepushes_dropped_for_coherence;
     static Stats::Scalar m_total_prepushes_dropped_for_redundancy;
     static Stats::Scalar m_total_demandresponse_dropped_for_redundancy;
     static Stats::Scalar m_totalUnusedDemandResponse;
     static Stats::Scalar m_totalInstalledDemandResponse;
 
     static Stats::Scalar m_total_writeinvalidation_times;
     static Tick m_total_writeinvalidation_ticks;
     static Stats::Scalar m_total_writeinvalidation_ticks_out;
     static Stats::Formula m_avg_writeinvalidation_ticks;
 
     static Stats::Scalar m_total_load_times;
     static Tick m_total_load_ticks;
     static Stats::Scalar m_total_load_ticks_out;
     static Stats::Formula m_avg_load_ticks;
 
     static Stats::Scalar m_total_register_waitlist;
     static Stats::Scalar m_total_host_prepush;
     static Stats::Scalar m_total_guest_timeout;
     static Stats::Scalar m_total_demand_send;
     static Stats::Scalar m_total_guest_to_host_request;
     
     static Stats::Scalar m_total_prepushes_dropped_for_redundancy_in_cache;
     static Stats::Scalar m_total_prepushes_dropped_for_redundancy_in_prepush_buffer;;
     static Stats::Scalar m_total_prepushes_for_demand_received;
     static Stats::Scalar m_total_prepush_buffer_replacement;
 
     Stats::Scalar prepushedEntries;
     Stats::Scalar earlyPrepushedDemandEntries;
     Stats::Scalar touchedPrepushedEntries;
 
     static bool staticRegistered;
     static Stats::Scalar totalPrepushedEntries;
     static Stats::Scalar totalEarlyPrepushedDemandEntries;
     static Stats::Scalar totalTouchedPrepushedEntries;
 
     static Stats::Vector prepushDeadlockDropCacheStateDistr;
 
     static void
     incrementPrepushDeadlockDropForCacheEntry(AbstractCacheEntry *entry)
     {
         ++prepushDeadlockDropCacheStateDistr[entry->getL1CacheState()];
     }
 
     Stats::Scalar m_sw_prefetches;
     Stats::Scalar m_hw_prefetches;
     Stats::Formula m_prefetches;
 
     Stats::Vector m_accessModeType;
 
     Stats::Scalar numDataArrayReads;
     Stats::Scalar numDataArrayWrites;
     Stats::Scalar numTagArrayReads;
     Stats::Scalar numTagArrayWrites;
 
     Stats::Scalar numTagArrayStalls;
     Stats::Scalar numDataArrayStalls;
 
     // hardware transactional memory
     Stats::Histogram htmTransCommitReadSet;
     Stats::Histogram htmTransCommitWriteSet;
     Stats::Histogram htmTransAbortReadSet;
     Stats::Histogram htmTransAbortWriteSet;
 
     // LLC sharer access time gap distribution
     bool profileLLCSharers;
     inline bool getProfileLLCSharers() { return profileLLCSharers; }
     Stats::Scalar  numSingleSharerEntries;
     Stats::Histogram sharerAvgAccessIntervalHistogram;
     Stats::Histogram sharerMinAccessIntervalHistogram;
     Stats::Histogram sharerMaxAccessIntervalHistogram;
     Stats::Histogram sharerEndAccessIntervalHistogram;
     std::vector<IntVec> sharerAccessInterval;
     std::vector<IntVec> sharerRequestInterval;
 
     bool printCacheEvictionDist;
 
     int getCacheSize() const { return m_cache_size; }
     int getCacheAssoc() const { return m_cache_assoc; }
     int getNumBlocks() const { return m_cache_num_sets * m_cache_assoc; }
     Addr getAddressAtIdx(int idx) const;
 
   private:
     // convert a Address to its location in the cache
     int64_t addressToCacheSet(Addr address) const;
 
     // Given a cache tag: returns the index of the tag in a set.
     // returns -1 if the tag is not found.
     int findTagInSet(int64_t line, Addr tag) const;
     int findTagInSetIgnorePermissions(int64_t cacheSet, Addr tag) const;
 
     // Private copy constructor and assignment operator
     CacheMemory(const CacheMemory& obj);
     CacheMemory& operator=(const CacheMemory& obj);
 
   private:
     // Data Members (m_prefix)
     bool m_is_instruction_only_cache;
 
     // The first index is the # of cache lines.
     // The second index is the the amount associativity.
     std::unordered_map<Addr, int> m_tag_index;
     std::vector<std::vector<AbstractCacheEntry*> > m_cache;
 
     std::vector<std::vector<uint64_t> > cacheEvictionDist;
 
     /** We use the replacement policies from the Classic memory system. */
     ReplacementPolicy::Base *m_replacementPolicy_ptr;
 
     BankedArray dataArray;
     BankedArray tagArray;
 
     int m_cache_size;
     int m_cache_num_sets;
     int m_cache_num_set_bits;
     int m_cache_assoc;
     int m_start_index_bit;
     int m_enable_DoNotReplacePushed;
     int m_is_software_pushmulticast;
     bool m_resource_stalls;
     int m_block_size;
 
     /**
      * We store all the ReplacementData in a 2-dimensional array. By doing
      * this, we can use all replacement policies from Classic system. Ruby
      * cache will deallocate cache entry every time we evict the cache block
      * so we cannot store the ReplacementData inside the cache entry.
      * Instantiate ReplacementData for multiple times will break replacement
      * policy like TreePLRU.
      */
     std::vector<std::vector<ReplData> > replacement_data;
 
     /**
      * Set to true when using WeightedLRU replacement policy, otherwise, set to
      * false.
      */
     bool m_use_occupancy;
 
     RubySystem *rubySystem;
 };
 
 std::ostream& operator<<(std::ostream& out, const CacheMemory& obj);
 
 #endif // __MEM_RUBY_STRUCTURES_CACHEMEMORY_HH__
 