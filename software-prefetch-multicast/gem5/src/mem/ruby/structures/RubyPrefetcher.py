# Copyright (c) 2020 ARM Limited
# All rights reserved.
#
# The license below extends only to copyright in the software and shall
# not be construed as granting a license to any other intellectual
# property including but not limited to intellectual property relating
# to a hardware implementation of the functionality of the software
# licensed hereunder.  You may use the software subject to the license
# terms below provided that you ensure that this notice is replicated
# unmodified and in its entirety in all distributions of the software,
# modified or unmodified, in source code or in binary form.
#
# Copyright (c) 2012 Mark D. Hill and David A. Wood
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met: redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer;
# redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution;
# neither the name of the copyright holders nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

from m5.SimObject import SimObject
from m5.params import *
from m5.proxy import *

from m5.objects.System import System

class RubyPrefetcher(SimObject):
    type = 'RubyPrefetcher'
    cxx_class = 'RubyPrefetcher'
    cxx_header = "mem/ruby/structures/RubyPrefetcher.hh"

    num_streams = Param.UInt32(4,
        "Number of prefetch streams to be allocated")
    unit_filter  = Param.UInt32(8,
        "Number of entries in the unit filter array")
    nonunit_filter = Param.UInt32(8,
        "Number of entries in the non-unit filter array")
    prefetch_inst = Param.Bool(False, "Whether prefetch instruction.")
    observe_hit = Param.Bool(False, "Whether train prefetcher on hit.")
    filter_dup = Param.Bool(False, "Whether filter out duplicate stream.")
    train_misses = Param.UInt32(4, "")
    num_startup_pfs = Param.UInt32(1, "")
    cross_page = Param.Bool(False, """True if prefetched address can be on a
            page different from the observed address""")
    page_shift = Param.UInt32(
        12, "Number of bits to mask to get a page number"
    )
    bulk_prefetch_size = Param.UInt32(1,
        "Set to >= 2 to enable buld prefetch")
    sys = Param.System(Parent.any, "System this prefetcher belongs to")

class Prefetcher(RubyPrefetcher):
    """DEPRECATED"""
    pass

class RubyBingoPrefetcher(SimObject):
    type = 'RubyBingoPrefetcher'
    cxx_class = 'RubyBingoPrefetcher'
    cxx_header = 'mem/ruby/structures/RubyBingoPrefetcher.hh'

    sys = Param.System(Parent.any, "System this prefetcher belongs to")

    page_shift = Param.UInt32(
        12, "Number of bits to mask to get a page number"
    )
    enabled = Param.Bool(False, 'Enable this prefetcher')
    region_size = Param.UInt32(2 * 1024, 'Size of spatial region, default 2kB')
    pc_width = Param.UInt32(16, '# of PC bits used in PHT')
    min_addr_width = Param.UInt32(5, '# of Address bits used for PC+Offset matching')
    max_addr_width = Param.UInt32(16, '# of Address bits used for PC+Address matching')
    ft_size = Param.UInt32(64, 'size of filter table')
    at_size = Param.UInt32(128, 'size of accumulation table')
    pht_size = Param.UInt32(16 * 1024, 'size of pattern history table (PHT)')
    pht_ways = Param.UInt32(16, 'associativity of PHT')
    pf_streamer_size = Param.UInt32(128, 'size of prefetch streamer')
    pf_queue_size = Param.UInt32(8, 'size of prefetch queue')