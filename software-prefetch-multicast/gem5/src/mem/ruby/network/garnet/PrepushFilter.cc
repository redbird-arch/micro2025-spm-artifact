#include "mem/ruby/network/garnet/PrepushFilter.hh"

#include "debug/PrepushFilter.hh"
#include "mem/ruby/network/garnet/CommonTypes.hh"
#include "mem/ruby/network/garnet/Router.hh"

PrepushFilter::PrepushFilter(int inport, Router *r)
    : id(inport), router(r), queries(0), registries(0)
{
}

void
PrepushFilter::clearPrepushes(Tick cur_time)
{
    while (!pendingClearPrepushBuffer.empty()) {
        Tick clear_time = pendingClearPrepushBuffer[0].clearTime;

        if (clear_time <= cur_time) {
            Addr addr = pendingClearPrepushBuffer[0].addr;
            NetDest net_dest = pendingClearPrepushBuffer[0].netDest;

            auto it = filter.find(addr);

            panic_if(it == filter.end(), "Router[%d]: PrepushFilter %d (%s) "
                     "panic at address: %#x\n", router->get_id(), id,
                     router->getInportDirection(id), addr);
            assert(it != filter.end());

            auto pend_it = it->second.netDestCount.find(net_dest);
            assert(pend_it != it->second.netDestCount.end());

            it->second.netDestCount[net_dest]--;

            DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d (%s): "
                    "clears prepush addr %#x, dest %s, remaining count %d\n",
                    router->get_id(), id, router->getInportDirection(id),
                    addr, net_dest, it->second.netDestCount[net_dest]);

            if (it->second.netDestCount[net_dest] == 0) {
                // account for the repetition
                for (auto iter: it->second.netDestCount) {
                    if (iter.first == pendingClearPrepushBuffer[0].netDest) {
                        assert(iter.second == 0);
                        continue;
                    }

                    net_dest.removeNetDest(iter.first);
                }
                it->second.netDest.removeNetDest(net_dest);

                DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d (%s): "
                        "updates prepush entry addr %#x, remaining dest %s\n",
                        router->get_id(), id, router->getInportDirection(id),
                        addr, it->second.netDest);

                it->second.netDestCount.erase(pend_it);
            }

            if (it->second.netDest.isEmpty()) {
                DPRINTF(PrepushFilter, "Router[%d]: PrepushFilter %d (%s): "
                        "removes prepush entry addr %#x\n", router->get_id(),
                        id, router->getInportDirection(id), addr);
                filter.erase(it);
            }

            pendingClearPrepushBuffer.pop_front();
        } else {
            break;
        }
    }
}

std::pair<int, int>
PrepushFilter::getInportAndInvc(Addr addr)
{
    auto it = filter.find(addr);

    if (it != filter.end()) {
        return std::make_pair(-1, -1);
    } else {
        return std::make_pair(filter[addr].inport, filter[addr].invc);
    }
}

bool
PrepushFilter::queryToDropRequest(Addr addr, MachineID mach_id)
{
    queries++;

    auto it = filter.find(addr);

    if (it != filter.end()) {
        return it->second.netDest.isElement(mach_id);
    }

    return false;
}

void
PrepushFilter::registerPrepush(Addr addr, NetDest net_dest, int inport,
        int invc)
{
    if (filter.find(addr) == filter.end()) {
        PrepushFilterEntry entry;
        entry.netDest = net_dest;
        entry.netDestCount[net_dest] = 1;
        entry.inport = inport;
        entry.invc = invc;

        filter[addr] = entry;
    } else {
        filter[addr].netDest.addNetDest(net_dest);

        if (filter[addr].netDestCount.find(net_dest) !=
                filter[addr].netDestCount.end())
            filter[addr].netDestCount[net_dest]++;
        else
            filter[addr].netDestCount[net_dest] = 1;
    }

    registries++;
}

void
PrepushFilter::resetStats()
{
    queries = 0;
    registries = 0;
}
