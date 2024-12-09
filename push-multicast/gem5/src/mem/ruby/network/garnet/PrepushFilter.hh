#ifndef __MEM_RUBY_NETWORK_GARNET_0_PREPUSHFILTER_HH__
#define __MEM_RUBY_NETWORK_GARNET_0_PREPUSHFILTER_HH__

#include <deque>
#include <iostream>
#include <unordered_map>

#include "mem/ruby/common/MachineID.hh"
#include "mem/ruby/common/NetDest.hh"
#include "mem/ruby/network/garnet/Router.hh"

class PrepushFilter
{
  public:
    PrepushFilter(int id, Router *router);
    ~PrepushFilter() = default;

    void print(std::ostream& out) const {};

    void clearPrepushes(Tick cur_time);

    inline void
    clearPrepushAtTime(Addr addr, Tick time, NetDest net_dest)
    {
        pendingClearPrepushBuffer.push_back(
                PendingClearPrepush(addr, time, net_dest));
    }

    std::pair<int, int> getInportAndInvc(Addr addr);

    bool queryToDropRequest(Addr addr, MachineID mach_id);
    void registerPrepush(Addr addr, NetDest net_dest, int inport, int invc);

    inline bool
    addrHasRegistry(Addr addr) {
        return filter.find(addr) != filter.end();
    }

    inline double getPrepushFilterQueries() { return queries; }
    inline double getPrepushFilterRegistries() { return registries; }

    void resetStats();

    class PrepushFilterEntry
    {
      public:
        PrepushFilterEntry() {};
        virtual ~PrepushFilterEntry() {};

        NetDest netDest; // for prepush response
        std::unordered_map<NetDest, int> netDestCount;

        int inport;
        int invc;
    };

    class PendingClearPrepush
    {
      public:
        PendingClearPrepush(Addr address, Tick time, NetDest net_dest)
          : addr(address), clearTime(time), netDest(net_dest) {}
        virtual ~PendingClearPrepush() {};

        Addr addr;
        Tick clearTime;
        NetDest netDest;
    };

  private:
    int id;
    Router *router;
    std::unordered_map<Addr, PrepushFilterEntry> filter;
    std::deque<PendingClearPrepush> pendingClearPrepushBuffer;

    double queries;
    double registries;
};

#endif
