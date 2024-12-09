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

#include "mem/ruby/structures/CacheMemory.hh"

#include "base/intmath.hh"
#include "base/logging.hh"
#include "debug/HtmMem.hh"
#include "debug/RubyCache.hh"
#include "debug/RubyCacheProfile.hh"
#include "debug/RubyCacheTrace.hh"
#include "debug/RubyResourceStalls.hh"
#include "debug/RubyStats.hh"
#include "mem/cache/replacement_policies/tree_plru_rp.hh"
#include "mem/cache/replacement_policies/weighted_lru_rp.hh"
#include "mem/ruby/protocol/AccessPermission.hh"
#include "mem/ruby/system/RubySystem.hh"

using namespace std;

int CacheMemory::numLLCs = 0;
int CacheMemory::numCollatedLLCs = 0;

bool CacheMemory::staticRegistered = false;
Stats::Scalar CacheMemory::m_total_prepushes_sent;

Stats::Scalar CacheMemory::m_total_prepushes_received;
Stats::Scalar CacheMemory::m_total_redundant_prepushes_received;
Stats::Scalar CacheMemory::m_total_early_prepushes_received;
Stats::Scalar CacheMemory::m_total_demand_responses;
Stats::Scalar CacheMemory::m_total_prepushes_dropped;
Stats::Scalar CacheMemory::m_total_prepushes_dropped_for_deadlock;
Stats::Scalar CacheMemory::m_total_prepushes_dropped_for_prepush_buffer_full;
Stats::Scalar CacheMemory::m_total_prepushes_dropped_for_coherence;
Stats::Scalar CacheMemory::m_total_prepushes_dropped_for_redundancy;
Stats::Scalar CacheMemory::m_total_prepushes_dropped_for_redundancy_in_cache;
Stats::Scalar
    CacheMemory::m_total_prepushes_dropped_for_redundancy_in_prepush_buffer;
Stats::Scalar CacheMemory::m_total_prepushes_for_demand_received;
Stats::Scalar CacheMemory::m_total_prepush_buffer_replacement;

Stats::Scalar CacheMemory::totalPrepushedEntries;
Stats::Scalar CacheMemory::totalEarlyPrepushedDemandEntries;
Stats::Scalar CacheMemory::totalTouchedPrepushedEntries;

Stats::Vector CacheMemory::prepushDeadlockDropCacheStateDistr;

ostream&
operator<<(ostream& out, const CacheMemory& obj)
{
    obj.print(out);
    out << flush;
    return out;
}

CacheMemory::CacheMemory(const Params &p)
    : SimObject(p),
    dataArray(p.dataArrayBanks, p.dataAccessLatency,
              p.start_index_bit, p.ruby_system),
    tagArray(p.tagArrayBanks, p.tagAccessLatency,
             p.start_index_bit, p.ruby_system)
{
    m_cache_size = p.size;
    m_cache_assoc = p.assoc;
    m_replacementPolicy_ptr = p.replacement_policy;
    m_start_index_bit = p.start_index_bit;
    m_is_instruction_only_cache = p.is_icache;
    m_resource_stalls = p.resourceStalls;
    m_block_size = p.block_size;  // may be 0 at this point. Updated in init()
    m_use_occupancy = dynamic_cast<ReplacementPolicy::WeightedLRU*>(
                                    m_replacementPolicy_ptr) ? true : false;

    rubySystem = p.ruby_system;
    profileLLCSharers = p.profileLLCSharers;
    if (profileLLCSharers)
        numLLCs++;

    printCacheEvictionDist = p.printCacheEvictionDist;

    // Register a callback function for combining the statistics
    Stats::registerDumpCallback([this]() { collateStats(); });
    Stats::registerResetCallback([this]() { resetStats(); });
}

void
CacheMemory::init()
{
    if (m_block_size == 0) {
        m_block_size = RubySystem::getBlockSizeBytes();
    }
    m_cache_num_sets = (m_cache_size / m_cache_assoc) / m_block_size;

    if (m_cache_num_sets > 1) {
        m_cache_num_set_bits = floorLog2(m_cache_num_sets);
        assert(m_cache_num_set_bits > 0);
    }

    m_cache.resize(m_cache_num_sets,
                    std::vector<AbstractCacheEntry*>(m_cache_assoc, nullptr));
    replacement_data.resize(m_cache_num_sets,
                               std::vector<ReplData>(m_cache_assoc, nullptr));
    // instantiate all the replacement_data here
    for (int i = 0; i < m_cache_num_sets; i++) {
        for ( int j = 0; j < m_cache_assoc; j++) {
            replacement_data[i][j] =
                                m_replacementPolicy_ptr->instantiateEntry();
        }
    }

    cacheEvictionDist.resize(m_cache_num_sets,
            std::vector<uint64_t>(m_cache_assoc, 0));
}

CacheMemory::~CacheMemory()
{
    if (m_replacementPolicy_ptr)
        delete m_replacementPolicy_ptr;
    for (int i = 0; i < m_cache_num_sets; i++) {
        for (int j = 0; j < m_cache_assoc; j++) {
            delete m_cache[i][j];
        }
    }
}

// convert a Address to its location in the cache
int64_t
CacheMemory::addressToCacheSet(Addr address) const
{
    assert(address == makeLineAddress(address));

    // fully associative
    if (m_cache_num_sets == 1)
        return 0;

    return bitSelect(address, m_start_index_bit,
                     m_start_index_bit + m_cache_num_set_bits - 1);
}

// Given a cache index: returns the index of the tag in a set.
// returns -1 if the tag is not found.
int
CacheMemory::findTagInSet(int64_t cacheSet, Addr tag) const
{
    assert(tag == makeLineAddress(tag));
    // search the set for the tags
    auto it = m_tag_index.find(tag);
    if (it != m_tag_index.end())
        if (m_cache[cacheSet][it->second]->m_Permission !=
            AccessPermission_NotPresent)
            return it->second;
    return -1; // Not found
}

// Given a cache index: returns the index of the tag in a set.
// returns -1 if the tag is not found.
int
CacheMemory::findTagInSetIgnorePermissions(int64_t cacheSet,
                                           Addr tag) const
{
    assert(tag == makeLineAddress(tag));
    // search the set for the tags
    auto it = m_tag_index.find(tag);
    if (it != m_tag_index.end())
        return it->second;
    return -1; // Not found
}

// Given an unique cache block identifier (idx): return the valid address
// stored by the cache block.  If the block is invalid/notpresent, the
// function returns the 0 address
Addr
CacheMemory::getAddressAtIdx(int idx) const
{
    Addr tmp(0);

    int set = idx / m_cache_assoc;
    assert(set < m_cache_num_sets);

    int way = idx - set * m_cache_assoc;
    assert (way < m_cache_assoc);

    AbstractCacheEntry* entry = m_cache[set][way];
    if (entry == NULL ||
        entry->m_Permission == AccessPermission_Invalid ||
        entry->m_Permission == AccessPermission_NotPresent) {
        return tmp;
    }
    return entry->m_Address;
}

bool
CacheMemory::tryCacheAccess(Addr address, RubyRequestType type,
                            DataBlock*& data_ptr)
{
    DPRINTF(RubyCache, "address: %#x\n", address);
    AbstractCacheEntry* entry = lookup(address);
    if (entry != nullptr) {
        // Do we even have a tag match?
        m_replacementPolicy_ptr->touch(entry->replacementData);
        entry->setLastAccess(curTick());
        data_ptr = &(entry->getDataBlk());

        if (entry->m_Permission == AccessPermission_Read_Write) {
            return true;
        }
        if ((entry->m_Permission == AccessPermission_Read_Only) &&
            (type == RubyRequestType_LD || type == RubyRequestType_IFETCH)) {
            return true;
        }
        // The line must not be accessible
    }
    data_ptr = NULL;
    return false;
}

bool
CacheMemory::testCacheAccess(Addr address, RubyRequestType type,
                             DataBlock*& data_ptr)
{
    DPRINTF(RubyCache, "address: %#x\n", address);
    AbstractCacheEntry* entry = lookup(address);
    if (entry != nullptr) {
        // Do we even have a tag match?
        m_replacementPolicy_ptr->touch(entry->replacementData);
        entry->setLastAccess(curTick());
        data_ptr = &(entry->getDataBlk());

        return entry->m_Permission != AccessPermission_NotPresent;
    }

    data_ptr = NULL;
    return false;
}

// tests to see if an address is present in the cache
bool
CacheMemory::isTagPresent(Addr address) const
{
    const AbstractCacheEntry* const entry = lookup(address);
    if (entry == nullptr) {
        // We didn't find the tag
        DPRINTF(RubyCache, "No tag match for address: %#x\n", address);
        return false;
    }
    DPRINTF(RubyCache, "address: %#x found\n", address);
    return true;
}

// Returns true if there is:
//   a) a tag match on this address or there is
//   b) an unused line in the same cache "way"
bool
CacheMemory::cacheAvail(Addr address) const
{
    assert(address == makeLineAddress(address));

    int64_t cacheSet = addressToCacheSet(address);

    for (int i = 0; i < m_cache_assoc; i++) {
        AbstractCacheEntry* entry = m_cache[cacheSet][i];
        if (entry != NULL) {
            if (entry->m_Address == address ||
                entry->m_Permission == AccessPermission_NotPresent) {
                // Already in the cache or we found an empty entry
                return true;
            }
        } else {
            return true;
        }
    }
    return false;
}

AbstractCacheEntry*
CacheMemory::allocate(Addr address, AbstractCacheEntry *entry, Addr vaddr)
{
    assert(address == makeLineAddress(address));
    assert(!isTagPresent(address));
    assert(cacheAvail(address));
    DPRINTF(RubyCache, "address: %#x\n", address);

    // Find the first open slot
    int64_t cacheSet = addressToCacheSet(address);
    std::vector<AbstractCacheEntry*> &set = m_cache[cacheSet];
    for (int i = 0; i < m_cache_assoc; i++) {
        if (!set[i] || set[i]->m_Permission == AccessPermission_NotPresent) {
            if (set[i] && (set[i] != entry)) {
                warn_once("This protocol contains a cache entry handling bug: "
                    "Entries in the cache should never be NotPresent! If\n"
                    "this entry (%#x) is not tracked elsewhere, it will memory "
                    "leak here. Fix your protocol to eliminate these!",
                    address);
            }
            set[i] = entry;  // Init entry
            set[i]->m_Address = address;
            set[i]->m_vAddress = vaddr;
            set[i]->m_Permission = AccessPermission_Invalid;
            DPRINTF(RubyCache, "Allocate clearing lock for addr: %#x\n",
                    address);
            set[i]->m_locked = -1;
            m_tag_index[address] = i;
            set[i]->setPosition(cacheSet, i);
            set[i]->replacementData = replacement_data[cacheSet][i];
            set[i]->setLastAccess(curTick());

            // Call reset function here to set initial value for different
            // replacement policies.
            m_replacementPolicy_ptr->reset(entry->replacementData);

            return entry;
        }
    }
    panic("Allocate didn't find an available entry");
}

void
CacheMemory::deallocate(Addr address)
{
    DPRINTF(RubyCache, "address: %#x\n", address);
    AbstractCacheEntry* entry = lookup(address);
    assert(entry != nullptr);

    // prepush effectiveness stats
    if (entry->isPrepushed()) {
        prepushedEntries++;
        totalPrepushedEntries++;

        if (entry->isTouched()) {
            touchedPrepushedEntries++;
            totalTouchedPrepushedEntries++;
        }
    } else if (entry->isEarlyPrepushed()) {
        earlyPrepushedDemandEntries++;
        totalEarlyPrepushedDemandEntries++;
    }

    m_replacementPolicy_ptr->invalidate(entry->replacementData);
    uint32_t cache_set = entry->getSet();
    uint32_t way = entry->getWay();
    delete entry;
    m_cache[cache_set][way] = NULL;
    m_tag_index.erase(address);
}

void
CacheMemory::deallocateWithoutDeletion(Addr address)
{
    DPRINTF(RubyCache, "address: %#x\n", address);
    AbstractCacheEntry* entry = lookup(address);
    assert(entry != nullptr);

    uint32_t cache_set = entry->getSet();
    uint32_t way = entry->getWay();

    m_cache[cache_set][way] = nullptr;
    m_tag_index.erase(address);
}

// Returns with the physical address of the conflicting cache line
Addr
CacheMemory::cacheProbe(Addr address) const
{
    assert(address == makeLineAddress(address));
    assert(!cacheAvail(address));

    int64_t cacheSet = addressToCacheSet(address);
    std::vector<ReplaceableEntry*> candidates;
    for (int i = 0; i < m_cache_assoc; i++) {
        candidates.push_back(static_cast<ReplaceableEntry*>(
                                                       m_cache[cacheSet][i]));
    }
    return m_cache[cacheSet][m_replacementPolicy_ptr->
                        getVictim(candidates)->getWay()]->m_Address;
}

Addr
CacheMemory::cacheProbe(Addr address)
{
    assert(address == makeLineAddress(address));
    assert(!cacheAvail(address));

    int64_t cacheSet = addressToCacheSet(address);
    std::vector<ReplaceableEntry*> candidates;
    for (int i = 0; i < m_cache_assoc; i++) {
        candidates.push_back(static_cast<ReplaceableEntry*>(
                                                       m_cache[cacheSet][i]));
    }
    int cache_way = m_replacementPolicy_ptr->getVictim(candidates)->getWay();
    cacheEvictionDist[cacheSet][cache_way] += 1;
    return m_cache[cacheSet][cache_way]->m_Address;
}

// Returns with the physical address of the conflicting cache line
Addr
CacheMemory::cacheProbeForPrepush(Addr address) const
{
    // The private cache that receives prepush cannot use TreePLRU, as the
    // candiddates found by cacheProbeForPrepush() may not align with Tree
    // PLRU's assumption and TreePLRU::getVictim can return a garbage victim.
    // Other cache hierarchy should be fine.
    panic_if(dynamic_cast<ReplacementPolicy::TreePLRU*>
             (m_replacementPolicy_ptr) != nullptr, "%s is using TreePLRU with"
             " Prepush. Make sure it is not the private cache that receives"
             " prepush and never uses cacheProbeForPrepush().", name());

    assert(address == makeLineAddress(address));
    assert(!cacheAvail(address));

    int64_t cacheSet = addressToCacheSet(address);
    std::vector<ReplaceableEntry*> candidates;
    for (int i = 0; i < m_cache_assoc; i++) {
        if (m_cache[cacheSet][i]->isEvictableForPrepush())
            candidates.push_back(static_cast<ReplaceableEntry*>(
                        m_cache[cacheSet][i]));
    }

    if (candidates.empty()) {
        return cacheProbe(address);
    } else {
        return m_cache[cacheSet][m_replacementPolicy_ptr->
            getVictim(candidates)->getWay()]->m_Address;
    }
}

// looks an address up in the cache
AbstractCacheEntry*
CacheMemory::lookup(Addr address)
{
    assert(address == makeLineAddress(address));
    int64_t cacheSet = addressToCacheSet(address);
    int loc = findTagInSet(cacheSet, address);
    if (loc == -1) return NULL;
    return m_cache[cacheSet][loc];
}

// looks an address up in the cache
const AbstractCacheEntry*
CacheMemory::lookup(Addr address) const
{
    assert(address == makeLineAddress(address));
    int64_t cacheSet = addressToCacheSet(address);
    int loc = findTagInSet(cacheSet, address);
    if (loc == -1) return NULL;
    return m_cache[cacheSet][loc];
}

// Sets the most recently used bit for a cache block
void
CacheMemory::setMRU(Addr address)
{
    AbstractCacheEntry* entry = lookup(makeLineAddress(address));
    if (entry != nullptr) {
        m_replacementPolicy_ptr->touch(entry->replacementData);
        entry->setLastAccess(curTick());
    }
}

void
CacheMemory::setMRU(AbstractCacheEntry *entry)
{
    assert(entry != nullptr);
    m_replacementPolicy_ptr->touch(entry->replacementData);
    entry->setLastAccess(curTick());
}

void
CacheMemory::setMRU(Addr address, int occupancy)
{
    AbstractCacheEntry* entry = lookup(makeLineAddress(address));
    if (entry != nullptr) {
        // m_use_occupancy can decide whether we are using WeightedLRU
        // replacement policy. Depending on different replacement policies,
        // use different touch() function.
        if (m_use_occupancy) {
            static_cast<ReplacementPolicy::WeightedLRU*>(
                m_replacementPolicy_ptr)->touch(
                entry->replacementData, occupancy);
        } else {
            m_replacementPolicy_ptr->touch(entry->replacementData);
        }
        entry->setLastAccess(curTick());
    }
}

int
CacheMemory::getReplacementWeight(int64_t set, int64_t loc)
{
    assert(set < m_cache_num_sets);
    assert(loc < m_cache_assoc);
    int ret = 0;
    if (m_cache[set][loc] != NULL) {
        ret = m_cache[set][loc]->getNumValidBlocks();
        assert(ret >= 0);
    }

    return ret;
}

void
CacheMemory::recordCacheContents(int cntrl, CacheRecorder* tr) const
{
    uint64_t warmedUpBlocks = 0;
    M5_VAR_USED uint64_t totalBlocks = (uint64_t)m_cache_num_sets *
                                       (uint64_t)m_cache_assoc;

    for (int i = 0; i < m_cache_num_sets; i++) {
        for (int j = 0; j < m_cache_assoc; j++) {
            if (m_cache[i][j] != NULL) {
                AccessPermission perm = m_cache[i][j]->m_Permission;
                RubyRequestType request_type = RubyRequestType_NULL;
                if (perm == AccessPermission_Read_Only) {
                    if (m_is_instruction_only_cache) {
                        request_type = RubyRequestType_IFETCH;
                    } else {
                        request_type = RubyRequestType_LD;
                    }
                } else if (perm == AccessPermission_Read_Write) {
                    request_type = RubyRequestType_ST;
                }

                if (request_type != RubyRequestType_NULL) {
                    Tick lastAccessTick;
                    lastAccessTick = m_cache[i][j]->getLastAccess();
                    tr->addRecord(cntrl, m_cache[i][j]->m_Address,
                                  0, request_type, lastAccessTick,
                                  m_cache[i][j]->getDataBlk());
                    warmedUpBlocks++;
                }
            }
        }
    }

    DPRINTF(RubyCacheTrace, "%s: %lli blocks of %lli total blocks"
            "recorded %.2f%% \n", name().c_str(), warmedUpBlocks,
            totalBlocks, (float(warmedUpBlocks) / float(totalBlocks)) * 100.0);
}

void
CacheMemory::print(ostream& out) const
{
    out << "Cache dump: " << name() << endl;
    for (int i = 0; i < m_cache_num_sets; i++) {
        for (int j = 0; j < m_cache_assoc; j++) {
            if (m_cache[i][j] != NULL) {
                out << "  Index: " << i
                    << " way: " << j
                    << " entry: " << *m_cache[i][j] << endl;
            } else {
                out << "  Index: " << i
                    << " way: " << j
                    << " entry: NULL" << endl;
            }
        }
    }
}

void
CacheMemory::printData(ostream& out) const
{
    out << "printData() not supported" << endl;
}

void
CacheMemory::setLocked(Addr address, int context)
{
    DPRINTF(RubyCache, "Setting Lock for addr: %#x to %d\n", address, context);
    AbstractCacheEntry* entry = lookup(address);
    assert(entry != nullptr);
    entry->setLocked(context);
}

void
CacheMemory::clearLocked(Addr address)
{
    DPRINTF(RubyCache, "Clear Lock for addr: %#x\n", address);
    AbstractCacheEntry* entry = lookup(address);
    assert(entry != nullptr);
    entry->clearLocked();
}

void
CacheMemory::clearLockedAll(int context)
{
    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i) {
        std::vector<AbstractCacheEntry*> set = *i;
        for (auto j = set.begin(); j != set.end(); ++j) {
            AbstractCacheEntry *line = *j;
            if (line && line->isLocked(context)) {
                DPRINTF(RubyCache, "Clear Lock for addr: %#x\n",
                    line->m_Address);
                line->clearLocked();
            }
        }
    }
}

bool
CacheMemory::isLocked(Addr address, int context)
{
    AbstractCacheEntry* entry = lookup(address);
    assert(entry != nullptr);
    DPRINTF(RubyCache, "Testing Lock for addr: %#llx cur %d con %d\n",
            address, entry->m_locked, context);
    return entry->isLocked(context);
}

void
CacheMemory::regStats()
{
    SimObject::regStats();

    m_demand_hits
        .name(name() + ".demand_hits")
        .desc("Number of cache demand hits")
        ;

    m_demand_misses
        .name(name() + ".demand_misses")
        .desc("Number of cache demand misses")
        ;

    m_demand_accesses
        .name(name() + ".demand_accesses")
        .desc("Number of cache demand accesses")
        ;

    m_demand_accesses = m_demand_hits + m_demand_misses;

    m_prepushes_sent
        .name(name() + ".prepushes_sent")
        .desc("Number of cache prepushes sent")
        .flags(Stats::nozero)
        ;

    m_prepushes_received
        .name(name() + ".prepushes_received")
        .desc("Number of cache prepushes received")
        .flags(Stats::nozero)
        ;

    m_early_prepushes_received
        .name(name() + ".early_prepushes_received")
        .desc("Number of early cache prepushes received")
        .flags(Stats::nozero)
        ;

    m_redundant_prepushes_received
        .name(name() + ".redundant_prepushes_received")
        .desc("Number of redundant cache prepushes received")
        .flags(Stats::nozero)
        ;

    m_demand_responses
        .name(name() + ".demand_responses")
        .desc("Number of demand cache responses received")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped
        .name(name() + ".prepushes_dropped")
        .desc("Number of cache prepushes dropped")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_deadlock
        .name(name() + ".prepushes_dropped_for_deadlock")
        .desc("Number of cache prepushes dropped to avoid protocol deadlock")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_coherence
        .name(name() + ".prepushes_dropped_for_coherence")
        .desc("Number of cache prepushes dropped for coherence")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_redundancy
        .name(name() + ".prepushes_dropped_for_redundancy")
        .desc("Number of cache prepushes dropped due to redundant copies")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_redundancy_in_cache
        .name(name() + ".prepushes_dropped_for_redundancy_in_cache")
        .desc("Number of prepushes dropped due to redundant copies in cache")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_redundancy_in_prepush_buffer
        .name(name() + ".prepushes_dropped_for_redundancy_in_prepush_buffer")
        .desc("Number of prepushes dropped due to redundant copies in buffer")
        .flags(Stats::nozero)
        ;

    m_prepushes_dropped_for_prepush_buffer_full
        .name(name() + ".prepushes_dropped_for_prepush_buffer_full")
        .desc("Number of cache prepushes dropped due to prepush buffer full")
        .flags(Stats::nozero)
        ;

    m_prepushes_for_demand_received
        .name(name() + ".prepushes_for_demand_received")
        .desc("Number of cache prepushes recieved early for demand requests")
        .flags(Stats::nozero)
        ;

    m_prepush_buffer_replacement
        .name(name() + ".prepush_buffer_replacement")
        .desc("Number of replacement in prepush buffer")
        .flags(Stats::nozero)
        ;

    prepushedEntries
        .name(name() + ".prepushed_cache_entries")
        .desc("Number of prepushed cache entries (not early response)")
        .flags(Stats::nozero)
        ;

    earlyPrepushedDemandEntries
        .name(name() + ".early_prepushed_demand_cache_entries")
        .desc("Number of early received demand cache entries due to prepush")
        .flags(Stats::nozero)
        ;

    touchedPrepushedEntries
        .name(name() + ".touched_prepushed_cache_entries")
        .desc("Number of prepushed cache entries get accessed (useful)")
        .flags(Stats::nozero)
        ;

    if (!staticRegistered) {
        staticRegistered = true;

        std::string ruby_name = rubySystem->name();

        m_total_prepushes_sent
            .name(ruby_name + ".LLC.total_prepushes_sent")
            .desc("Total number of cache prepushes sent")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_received
            .name(ruby_name + ".L1Cache.total_prepushes_received")
            .desc("Total number of cache prepushes received")
            .flags(Stats::nozero)
            ;

        m_total_early_prepushes_received
            .name(ruby_name + ".L1Cache.total_early_prepushes_received")
            .desc("Total number of early cache prepushes received")
            .flags(Stats::nozero)
            ;

        m_total_redundant_prepushes_received
            .name(ruby_name + ".L1Cache.total_redundant_prepushes_received")
            .desc("Total number of redundant cache prepushes received")
            .flags(Stats::nozero)
            ;

        m_total_demand_responses
            .name(ruby_name + ".L1Cache.total_demand_responses")
            .desc("Total number of demand cache responses received")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped
            .name(ruby_name + ".L1Cache.total_prepushes_dropped")
            .desc("Total number of cache prepushes dropped")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_deadlock
            .name(ruby_name + ".L1Cache.total_prepushes_dropped_for_deadlock")
            .desc("Total num of prepushes dropped to avoid protocol deadlock")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_coherence
            .name(ruby_name + ".L1Cache.total_prepushes_dropped_for_coherence")
            .desc("Total number of cache prepushes dropped for coherence")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_redundancy
            .name(ruby_name +
                    ".L1Cache.total_prepushes_dropped_for_redundancy")
            .desc("Total number of prepushes dropped due to redundant copies")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_redundancy_in_cache
            .name(ruby_name +
                    ".L1Cache.total_prepushes_dropped_for_redundancy_in_cache")
            .desc("Total number of prepushes dropped due to redundant copies "
                  "in cache")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_redundancy_in_prepush_buffer
            .name(ruby_name + ".L1Cache." +
                    "total_prepushes_dropped_for_redundancy_in_prepush_buffer")
            .desc("Total number of prepushes dropped due to redundant copies "
                  "in prepush buffer")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_dropped_for_prepush_buffer_full
            .name(ruby_name +
                    ".L1Cache.total_prepushes_dropped_for_prepush_buffer_full")
            .desc("Total num of prepushes dropped due to prepush buffer full")
            .flags(Stats::nozero)
            ;

        m_total_prepushes_for_demand_received
            .name(ruby_name + ".L1Cache.total_prepushes_for_demand_received")
            .desc("Total num of prepushes recieved early for demand requests")
            .flags(Stats::nozero)
            ;

        m_total_prepush_buffer_replacement
            .name(name() + ".total_prepush_buffer_replacement")
            .desc("Total number of replacement in prepush buffer")
            .flags(Stats::nozero)
            ;

        totalPrepushedEntries
            .name(ruby_name + ".L1Cache.total_prepushed_cache_entries")
            .desc("Total num of prepushed cache entries (not early response)")
            .flags(Stats::nozero)
            ;

        totalEarlyPrepushedDemandEntries
            .name(ruby_name +
                    ".L1Cache.total_early_prepushed_demand_cache_entries")
            .desc("Total num of early received prepushed demand response")
            .flags(Stats::nozero)
            ;

        totalTouchedPrepushedEntries
            .name(ruby_name + ".L1Cache.total_touched_prepushed_cache_entries")
            .desc("Total num of prepushed cache entries get accessed")
            .flags(Stats::nozero)
            ;

        // profile cache state distributions for deadlock prepush drop
        std::vector<std::string> l1cache_states;
        std::string description = "cache state distributions of "
            "deadlock-avoidance prepush drop [ ";
        for (int i = 0; i < L1Cache_State_NUM; i++) {
            std::string state = L1Cache_State_to_string((L1Cache_State) i);
            l1cache_states.push_back(state);
            description += state + " ";
        }
        description += "]";

        prepushDeadlockDropCacheStateDistr
            .init(l1cache_states.size())
            .name(ruby_name +
                    ".L1Cache.prepush_deadlock_drop_cache_state_distribution")
            .desc(description.c_str())
            .flags(Stats::pdf | Stats::total | Stats::nozero)
            ;

        for (int i = 0; i < L1Cache_State_NUM; i++) {
            prepushDeadlockDropCacheStateDistr.subname(i,
                    csprintf(l1cache_states[i]));
            prepushDeadlockDropCacheStateDistr.subdesc(i,
                    csprintf(l1cache_states[i]));
        }
    }

    m_sw_prefetches
        .name(name() + ".total_sw_prefetches")
        .desc("Number of software prefetches")
        .flags(Stats::nozero)
        ;

    m_hw_prefetches
        .name(name() + ".total_hw_prefetches")
        .desc("Number of hardware prefetches")
        .flags(Stats::nozero)
        ;

    m_prefetches
        .name(name() + ".total_prefetches")
        .desc("Number of prefetches")
        .flags(Stats::nozero)
        ;

    m_prefetches = m_sw_prefetches + m_hw_prefetches;

    m_accessModeType
        .init(RubyRequestType_NUM)
        .name(name() + ".access_mode")
        .flags(Stats::pdf | Stats::total)
        ;
    for (int i = 0; i < RubyAccessMode_NUM; i++) {
        m_accessModeType
            .subname(i, RubyAccessMode_to_string(RubyAccessMode(i)))
            .flags(Stats::nozero)
            ;
    }

    numDataArrayReads
        .name(name() + ".num_data_array_reads")
        .desc("number of data array reads")
        .flags(Stats::nozero)
        ;

    numDataArrayWrites
        .name(name() + ".num_data_array_writes")
        .desc("number of data array writes")
        .flags(Stats::nozero)
        ;

    numTagArrayReads
        .name(name() + ".num_tag_array_reads")
        .desc("number of tag array reads")
        .flags(Stats::nozero)
        ;

    numTagArrayWrites
        .name(name() + ".num_tag_array_writes")
        .desc("number of tag array writes")
        .flags(Stats::nozero)
        ;

    numTagArrayStalls
        .name(name() + ".num_tag_array_stalls")
        .desc("number of stalls caused by tag array")
        .flags(Stats::nozero)
        ;

    numDataArrayStalls
        .name(name() + ".num_data_array_stalls")
        .desc("number of stalls caused by data array")
        .flags(Stats::nozero)
        ;

    htmTransCommitReadSet
        .init(8)
        .name(name() + ".htm_transaction_committed_read_set")
        .desc("read set size of a committed transaction")
        .flags(Stats::pdf | Stats::dist | Stats::nozero | Stats::nonan)
        ;

    htmTransCommitWriteSet
        .init(8)
        .name(name() + ".htm_transaction_committed_write_set")
        .desc("write set size of a committed transaction")
        .flags(Stats::pdf | Stats::dist | Stats::nozero | Stats::nonan)
        ;

    htmTransAbortReadSet
        .init(8)
        .name(name() + ".htm_transaction_aborted_read_set")
        .desc("read set size of a aborted transaction")
        .flags(Stats::pdf | Stats::dist | Stats::nozero | Stats::nonan)
        ;

    htmTransAbortWriteSet
        .init(8)
        .name(name() + ".htm_transaction_aborted_write_set")
        .desc("write set size of a aborted transaction")
        .flags(Stats::pdf | Stats::dist | Stats::nozero | Stats::nonan)
        ;

    // LLC sharer access time gap distribution
    numSingleSharerEntries
        .name(name() + ".num_single_sharer_entries")
        .desc("number of cache lines with single sharer")
        .flags(Stats::nozero)
        ;

    sharerAvgAccessIntervalHistogram
        .init(10, 100)
        .name(name() + ".sharer_avg_access_interval")
        .desc("average cache sharer access intervel distributioin")
        .flags(Stats::nozero | Stats::pdf | Stats::dist | Stats::oneline);
    ;

    sharerMinAccessIntervalHistogram
        .init(10, 100)
        .name(name() + ".sharer_min_access_interval")
        .desc("minimum cache sharer access intervel distribution")
        .flags(Stats::nozero | Stats::pdf | Stats::dist | Stats::oneline);
    ;

    sharerMaxAccessIntervalHistogram
        .init(10, 100)
        .name(name() + ".sharer_max_access_interval")
        .desc("maximum cache sharer access intervel distribution")
        .flags(Stats::nozero | Stats::pdf | Stats::dist | Stats::oneline);
    ;

    sharerEndAccessIntervalHistogram
        .init(10, 100)
        .name(name() + ".sharer_end_access_interval")
        .desc("first and last cache sharer access intervel distribution")
        .flags(Stats::nozero | Stats::pdf | Stats::dist | Stats::oneline);
    ;
}

void
CacheMemory::resetStats()
{
    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i) {
        std::vector<AbstractCacheEntry*> set = *i;
        for (auto j = set.begin(); j != set.end(); ++j) {
            AbstractCacheEntry *line = *j;
            if (line) {
                line->resetPrepushFlags();
            }
        }
    }

    for (int i = 0; i < m_cache_num_sets; i++)
        for (int j = 0; j < m_cache_assoc; j++)
            cacheEvictionDist[i][j] = 0;

    if (!profileLLCSharers)
        return;

    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i) {
        std::vector<AbstractCacheEntry*> set = *i;
        for (auto j = set.begin(); j != set.end(); ++j) {
            AbstractCacheEntry *line = *j;
            if (line) {
                line->sharerRequestTime.clear();
                line->sharerAccessTime.clear();
                line->sharerNodeID.clear();
            }
        }
    }

    for (auto i =  0; i < sharerRequestInterval.size(); i++)
        sharerRequestInterval[i].clear();
    sharerRequestInterval.clear();

    for (auto i =  0; i < sharerAccessInterval.size(); i++)
        sharerAccessInterval[i].clear();
    sharerAccessInterval.clear();
}

void
CacheMemory::collateStats()
{
    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i) {
        std::vector<AbstractCacheEntry*> set = *i;
        for (auto j = set.begin(); j != set.end(); ++j) {
            AbstractCacheEntry *line = *j;
            if (line) {
                // prepush effectiveness stats
                if (line->isPrepushed()) {
                    prepushedEntries++;
                    totalPrepushedEntries++;

                    if (line->isTouched()) {
                        touchedPrepushedEntries++;
                        totalTouchedPrepushedEntries++;
                    }
                } else if (line->isEarlyPrepushed()) {
                    earlyPrepushedDemandEntries++;
                    totalEarlyPrepushedDemandEntries++;
                }
            }
        }
    }

    if (printCacheEvictionDist) {
        cout << rubySystem->name() << "." << name() <<
            ".cache_eviction_distribution:" << endl;
        for (int i = 0; i < m_cache_num_sets; i++) {
            cout << "       set " << setw(4) << right << i << " : ";
            for (int j = 0; j < m_cache_assoc; j++) {
                cout << " " << cacheEvictionDist[i][j];
            }
            cout << endl;
        }
    }

    if (!profileLLCSharers)
        return;

    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i) {
        std::vector<AbstractCacheEntry*> set = *i;
        for (auto j = set.begin(); j != set.end(); ++j) {
            AbstractCacheEntry *line = *j;
            if (line)
                profileCacheEntry(line);
        }
    }

    // add the cache access interval stats to profiler
    rubySystem->m_profiler->collateSharerAccessIntervalStats(this);

    numCollatedLLCs++;
    if (numCollatedLLCs == numLLCs) {
        rubySystem->m_profiler->printSharerStats();
        numCollatedLLCs = 0;
    }
}

// assumption: SLICC generated files will only call this function
// once **all** resources are granted
void
CacheMemory::recordRequestType(CacheRequestType requestType, Addr addr)
{
    DPRINTF(RubyStats, "Recorded statistic: %s\n",
            CacheRequestType_to_string(requestType));
    switch(requestType) {
    case CacheRequestType_DataArrayRead:
        if (m_resource_stalls)
            dataArray.reserve(addressToCacheSet(addr));
        numDataArrayReads++;
        return;
    case CacheRequestType_DataArrayWrite:
        if (m_resource_stalls)
            dataArray.reserve(addressToCacheSet(addr));
        numDataArrayWrites++;
        return;
    case CacheRequestType_TagArrayRead:
        if (m_resource_stalls)
            tagArray.reserve(addressToCacheSet(addr));
        numTagArrayReads++;
        return;
    case CacheRequestType_TagArrayWrite:
        if (m_resource_stalls)
            tagArray.reserve(addressToCacheSet(addr));
        numTagArrayWrites++;
        return;
    default:
        warn("CacheMemory access_type not found: %s",
             CacheRequestType_to_string(requestType));
    }
}

bool
CacheMemory::checkResourceAvailable(CacheResourceType res, Addr addr)
{
    if (!m_resource_stalls) {
        return true;
    }

    if (res == CacheResourceType_TagArray) {
        if (tagArray.tryAccess(addressToCacheSet(addr))) return true;
        else {
            DPRINTF(RubyResourceStalls,
                    "Tag array stall on addr %#x in set %d\n",
                    addr, addressToCacheSet(addr));
            numTagArrayStalls++;
            return false;
        }
    } else if (res == CacheResourceType_DataArray) {
        if (dataArray.tryAccess(addressToCacheSet(addr))) return true;
        else {
            DPRINTF(RubyResourceStalls,
                    "Data array stall on addr %#x in set %d\n",
                    addr, addressToCacheSet(addr));
            numDataArrayStalls++;
            return false;
        }
    } else {
        panic("Unrecognized cache resource type.");
    }
}

bool
CacheMemory::isBlockInvalid(int64_t cache_set, int64_t loc)
{
  return (m_cache[cache_set][loc]->m_Permission == AccessPermission_Invalid);
}

bool
CacheMemory::isBlockNotBusy(int64_t cache_set, int64_t loc)
{
  return (m_cache[cache_set][loc]->m_Permission != AccessPermission_Busy);
}

/* hardware transactional memory */

void
CacheMemory::htmAbortTransaction()
{
    uint64_t htmReadSetSize = 0;
    uint64_t htmWriteSetSize = 0;

    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i)
    {
        std::vector<AbstractCacheEntry*> set = *i;

        for (auto j = set.begin(); j != set.end(); ++j)
        {
            AbstractCacheEntry *line = *j;

            if (line != nullptr) {
                htmReadSetSize += (line->getInHtmReadSet() ? 1 : 0);
                htmWriteSetSize += (line->getInHtmWriteSet() ? 1 : 0);
                if (line->getInHtmWriteSet()) {
                    line->invalidateEntry();
                }
                line->setInHtmWriteSet(false);
                line->setInHtmReadSet(false);
                line->clearLocked();
            }
        }
    }

    htmTransAbortReadSet.sample(htmReadSetSize);
    htmTransAbortWriteSet.sample(htmWriteSetSize);
    DPRINTF(HtmMem, "htmAbortTransaction: read set=%u write set=%u\n",
        htmReadSetSize, htmWriteSetSize);
}

void
CacheMemory::htmCommitTransaction()
{
    uint64_t htmReadSetSize = 0;
    uint64_t htmWriteSetSize = 0;

    // iterate through every set and way to get a cache line
    for (auto i = m_cache.begin(); i != m_cache.end(); ++i)
    {
        std::vector<AbstractCacheEntry*> set = *i;

        for (auto j = set.begin(); j != set.end(); ++j)
        {
            AbstractCacheEntry *line = *j;
            if (line != nullptr) {
                htmReadSetSize += (line->getInHtmReadSet() ? 1 : 0);
                htmWriteSetSize += (line->getInHtmWriteSet() ? 1 : 0);
                line->setInHtmWriteSet(false);
                line->setInHtmReadSet(false);
                line->clearLocked();
             }
        }
    }

    htmTransCommitReadSet.sample(htmReadSetSize);
    htmTransCommitWriteSet.sample(htmWriteSetSize);
    DPRINTF(HtmMem, "htmCommitTransaction: read set=%u write set=%u\n",
        htmReadSetSize, htmWriteSetSize);
}

void
CacheMemory::profileCacheEntry(AbstractCacheEntry* entry)
{
    if (!profileLLCSharers)
        return;

    assert(entry);

    std::vector<Cycles> &sharer_request_time = entry->sharerRequestTime;
    std::sort(sharer_request_time.begin(), sharer_request_time.end());
    std::vector<Cycles> &sharer_access_time = entry->sharerAccessTime;
    assert(sharer_request_time.size() == sharer_access_time.size());
    std::vector<NodeID> &sharer_node_id = entry->sharerNodeID;
    assert(sharer_request_time.size() == sharer_node_id.size());

    if (sharer_access_time.size() == 1) {
        numSingleSharerEntries++;
        sharer_request_time.clear();
        sharer_access_time.clear();
        sharer_node_id.clear();
    } else if (sharer_access_time.size() > 1) {
        uint32_t min_interval = numeric_limits<uint32_t>::max();
        uint32_t max_interval = 0;
        uint32_t avg_interval = 0;
        uint32_t end_interval = 0;
        uint32_t req_end_interval = 0;

        uint32_t accesses = sharer_access_time.size();
        uint32_t size = sharerAccessInterval.size();
        assert(sharerRequestInterval.size() == sharerAccessInterval.size());

        if (accesses > size) {
            sharerRequestInterval.resize(accesses);
            sharerAccessInterval.resize(accesses);
        }

        std::ostringstream oss;

        oss << "[ 0 " << sharer_node_id[0];

        for (auto i = 1; i < sharer_access_time.size(); i++) {
            uint32_t interval = sharer_access_time[i] -
                sharer_access_time[i-1];

            if (min_interval > interval)
                min_interval = interval;
            if (max_interval < interval)
                max_interval = interval;
            end_interval += interval;

            sharerAccessInterval[i].push_back(interval);

            // sharer request intervals
            uint32_t req_interval = sharer_request_time[i] -
                sharer_request_time[i-1];
            req_end_interval += req_interval;
            sharerRequestInterval[i].push_back(req_interval);

            oss << " | " << interval << " " << sharer_node_id[i];
        }
        oss << " ]";

        sharerAccessInterval[0].push_back(end_interval);
        sharerRequestInterval[0].push_back(req_end_interval);

        avg_interval = end_interval / (sharer_access_time.size() - 1);

        sharerAvgAccessIntervalHistogram.sample(avg_interval);
        sharerMinAccessIntervalHistogram.sample(min_interval);
        sharerMaxAccessIntervalHistogram.sample(max_interval);
        sharerEndAccessIntervalHistogram.sample(end_interval);

        sharer_request_time.clear();
        sharer_access_time.clear();
        sharer_node_id.clear();

        DPRINTF(RubyCacheProfile, "Profile for addr %#llx vaddr %#llx "
                "(access-time node-id): %s\n", entry->m_Address,
                entry->m_vAddress, oss.str());
    }
}
