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

/*
 * Common base class for a machine node.
 */

#ifndef __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCACHEENTRY_HH__
#define __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCACHEENTRY_HH__

#include <iostream>
#include <vector>

#include "base/logging.hh"
#include "mem/cache/replacement_policies/replaceable_entry.hh"
#include "mem/ruby/common/Address.hh"
#include "mem/ruby/common/MachineID.hh"
#include "mem/ruby/protocol/AccessPermission.hh"
#include "mem/ruby/protocol/L1Cache_State.hh"

class DataBlock;

class AbstractCacheEntry : public ReplaceableEntry
{
  private:
    // The last access tick for the cache entry.
    Tick m_last_touch_tick;

    // Prepush flags
    bool prepushed;
    bool earlyPrepushed;
    bool touched;
    bool prepush_entry_llc;
    bool select_victim_sent;
    bool data_prepushed;

    // Add for enabling prefetcht1
    bool is_prefetcht1;

  public:
    AbstractCacheEntry();
    virtual ~AbstractCacheEntry() = 0;

    // Get/Set permission of the entry
    AccessPermission getPermission() const;
    void changePermission(AccessPermission new_perm);

    using ReplaceableEntry::print;
    virtual void print(std::ostream& out) const = 0;

    // The methods below are those called by ruby runtime, add when it
    // is absolutely necessary and should all be virtual function.
    virtual DataBlock& getDataBlk()
    { panic("getDataBlk() not implemented!"); }

    virtual bool isCoherent()
    { panic("isCoherent() not implemented!"); }

    virtual std::string getCacheStateString()
    { panic("getCacheStateString() not implemented!"); }

    virtual L1Cache_State getL1CacheState()
    { panic("getCacheState() not implemented!"); }

    int validBlocks;
    virtual int& getNumValidBlocks()
    {
        return validBlocks;
    }

    virtual bool isEvictableForPrepush()
    { panic("isEvictableForPrepush() not implemented!"); }

    virtual bool isEvictableForPrepush_L0()
    { panic("isEvictableForPrepush_L0() not implemented!"); }

    // Functions for locking and unlocking the cache entry.  These are required
    // for supporting atomic memory accesses.
    void setLocked(int context);
    void clearLocked();
    bool isLocked(int context) const;

    // Address of this block, required by CacheMemory
    Addr m_Address;
    Addr m_vAddress;
    // Holds info whether the address is locked.
    // Required for implementing LL/SC operations.
    int m_locked;

    AccessPermission m_Permission; // Access permission for this
                                   // block, required by CacheMemory

    // Get the last access Tick.
    Tick getLastAccess() { return m_last_touch_tick; }

    // Set the last access Tick.
    void setLastAccess(Tick tick) { m_last_touch_tick = tick; }

    void setWhetherMulticasted() { data_prepushed = true; }
    void unsetWhetherMulticasted() { data_prepushed = false; }
    bool isWhetherMulticasted() { return data_prepushed; }
    void setPrepushed() { prepushed = true; }
    void unsetPrepushed() { prepushed = false; }
    void setEarlyPrepushed() { earlyPrepushed = true; }
    void setTouched() { touched = true; }
    void unsetTouched() { touched = false; }
    bool isPrepushed() { return prepushed; }
    bool isEarlyPrepushed() { return earlyPrepushed; }
    bool isTouched() { return touched; }
    void SetVNewVictimInvalidated() { select_victim_sent = true; }
    void UnsetVNewVictimInvalidated() { select_victim_sent = false; }
    bool IsNewVictimInvalidated() { return select_victim_sent; }
    void setPrepushEntryLLC() { prepush_entry_llc = true; }
    void unsetPrepushEntryLLC() { prepush_entry_llc = false; }
    bool isPrepushEntryLLC() { return prepush_entry_llc; }

    // Add for enabling prefetcht1
    void SetPrefetcht1() { is_prefetcht1 = true; }
    void UnsetPrefetcht1() { is_prefetcht1 = false; }
    bool IsPrefetcht1() { return is_prefetcht1; }
    
    void resetPrepushFlags()
    {
      data_prepushed = false;
      prepushed = false;
      earlyPrepushed = false;
      touched = false;
      prepush_entry_llc = false;
    }

    // hardware transactional memory
    void setInHtmReadSet(bool val);
    void setInHtmWriteSet(bool val);
    bool getInHtmReadSet() const;
    bool getInHtmWriteSet() const;
    virtual void invalidateEntry() {}

    // sharers access time (cycle)
    std::vector<Cycles> sharerRequestTime;
    std::vector<Cycles> sharerAccessTime;
    std::vector<NodeID> sharerNodeID;
    // profiling methods
    void profileCacheEntry(Cycles request_cycle, Cycles access_cycle, Addr pc,
            MachineID mid, int num_llcs = 0);

  private:
    // hardware transactional memory
    bool m_htmInReadSet;
    bool m_htmInWriteSet;
};

inline std::ostream&
operator<<(std::ostream& out, const AbstractCacheEntry& obj)
{
    obj.print(out);
    out << std::flush;
    return out;
}

#endif // __MEM_RUBY_SLICC_INTERFACE_ABSTRACTCACHEENTRY_HH__
