# Copyright (c) 2006-2007 The Regents of The University of Michigan
# Copyright (c) 2009,2015 Advanced Micro Devices, Inc.
# Copyright (c) 2013 Mark D. Hill and David A. Wood
# Copyright (c) 2020 ARM Limited
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

import math
import m5
from m5.objects import *
from m5.defines import buildEnv
from .Ruby import create_topology, create_directories
from .Ruby import send_evicts
from common import FileSystemConfig

#
# Declare caches used by the protocol
#
class L0Cache(RubyCache): pass
class L1Cache(RubyCache): pass
class L2Cache(RubyCache): pass

def define_options(parser):
    parser.add_option("--num-clusters", type = "int", default = 1,
            help = "number of clusters in a design in which there are shared\
            caches private to clusters")
    parser.add_option("--l0i_size", type="string", default="4096B")
    parser.add_option("--l0d_size", type="string", default="4096B")
    parser.add_option("--l0i_assoc", type="int", default=1)
    parser.add_option("--l0d_assoc", type="int", default=1)
    parser.add_option("--l0_transitions_per_cycle", type="int", default=32) #32
    parser.add_option("--l1_transitions_per_cycle", type="int", default=32) #32
    parser.add_option("--l2_transitions_per_cycle", type="int", default=4) #4
    parser.add_option("--enable-prefetch", action="store_true", default=False,\
                        help="Enable Ruby hardware prefetcher")
    parser.add_option("--num_of_groups", type="int", default=1,\
                        help="Number of share groups")
    parser.add_option("--en_timeout_multicast",  type="int", default=1,\
                        help="enable timeout multicast")
    parser.add_option("--en_softprepush",  type="int", default=1,\
                        help="enable software prepush")
    parser.add_option("--en_hostswitch",  type="int", default=1,\
                        help="enable host switch")

        # 800 originaly for timeout threshold
    # 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536
    parser.add_option("--timeout_threshold",  type="int", default=512, help="Timeout Threshold")
    parser.add_option("--en_adaptive_timeout_threshold", type="int", default=0, help="Enable adaptive timeout")
    parser.add_option("--en_adaptive_timeout_division", type="int", default=1, help="adaptive timeout division")
    parser.add_option("--timeout_threshold_upper_bound", type="int", default=256, help="adaptive timeout upper bound")

    # 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536
    parser.add_option("--timeout_switch_threshold",  type="int", default=16384, help="Timeout Switch host Threshold")

    parser.add_option("--en_dir_prepush",  type="int", default=0,\
                        help="Enable prepush from mem controller")
    parser.add_option("--en_prepushfilter",  type="int", default=1,\
                        help="Enable Prepush Filter")
    parser.add_option("--en_Filter_Drop",  action="store_true", default=False,\
                        help="Enable Prepush Filter Drop")
    parser.add_option("--pass_config",  type="int", default=0,\
                        help="Pass Software Prepush Configuration for one-core prepush")
    parser.add_option("--determine_host",  type="int", default=1,\
                        help="Only one host if = 1, All core can be the host if = 0")
    parser.add_option("--en_sync",  type="int", default=0,\
                        help="Synchronization multicast if = 1")
    parser.add_option("--enable_prefetchL2",  type="int", default=1,\
                        help="Only prefetch to L2 private cache")
    parser.add_option("--enable_DoNotReplacePushed",  type="int", default=0,\
                        help="Do not replace the pushed data without touching")
    parser.add_option("--enable_select_newvictim",  type="int", default=0,\
                        help="Enable new victim selection")
    parser.add_option("--recongnize_PushEntry",  type="int", default=0,\
                        help="Recongnize Pushed Entry in LLC for multicasting non-target PCs")
    parser.add_option("--donot_observe_prefetch",  type="int", default=1,\
                        help="Do not disturb hardware prefetcher")
    parser.add_option("--enable_L1bingo_L2Stride",  action="store_true", default=False,\
                        help="Enable L1Bingo-L2Stride")

    parser.add_option("--load_to_timeout",  type="int", default=0,\
                        help="Enable directly send request for demand request")

    parser.add_option("--en_center_level",  type="int", default=0,\
                        help="Enable Center Level")

    parser.add_option("--en_dont_response",  type="int", default=0,\
                        help="Whether reply from LLC")
    parser.add_option("--dont_response_threshold",  type="int", default=250,\
                        help="Dont reply threshold")

    parser.add_option("--benchmark_num",  type="int", default=1,\
                        help="0: Nothing; 1: cachebw; 2: multilevel; 3: mv; 4: conv3d; \
                        5: mlp; 6: backprop; 7: particlefilter")
    return

def create_system(options, full_system, system, dma_ports, bootmem,
                  ruby_system):

    if buildEnv['PROTOCOL'] != 'MESI_Three_Level_SoftPrepush':
        fatal("This script requires the MESI_Three_Level_SoftPrepush"
              " protocol to be built.")

    cpu_sequencers = []

    #
    # The ruby network creation expects the list of nodes in the system to be
    # consistent with the NetDest list.  Therefore the l1 controller nodes
    # must be listed before the directory nodes and directory nodes before
    # dma nodes, etc.
    #
    l0_cntrl_nodes = []
    l1_cntrl_nodes = []
    l2_cntrl_nodes = []
    dma_cntrl_nodes = []

    assert (options.num_cpus % options.num_clusters == 0)
    num_cpus_per_cluster = options.num_cpus // options.num_clusters

    assert (options.num_l2caches % options.num_clusters == 0)
    num_l2caches_per_cluster = options.num_l2caches // options.num_clusters

    l2_bits = int(math.log(num_l2caches_per_cluster, 2))
    block_size_bits = int(math.log(options.cacheline_size, 2))
    l2_index_start = block_size_bits + l2_bits

    buffer_size = options.message_buffer_size

    if options.print_all_cache_evict_dist:
        options.print_l0_cache_evict_dist = True
        options.print_l1_cache_evict_dist = True
        options.print_l2_cache_evict_dist = True


    in_PC1  = 1 
    in_PC2  = 1 
    in_PC3  = 1 
    in_PC4  = 1 
    in_PC5  = 1
    in_PC6  = 1 
    in_PC7  = 1 
    in_PC8  = 1 
    in_PC9  = 1 
    in_PC10 = 1
    in_PC11 = 1
    in_PC12 = 1
    in_PC13 = 1
    in_PC14 = 1
    in_PC15 = 1
    in_PC16 = 1
    in_PC17 = 1
    in_PC18 = 1
    in_PC19 = 1
    in_PC20 = 1
    in_PC21 = 1
    in_PC22 = 1
    in_PC23 = 1
    in_PC24 = 1
    in_PC25 = 1
    in_PC26 = 1
    in_PC27 = 1
    in_PC28 = 1
    in_PC29 = 1
    in_PC30 = 1
    in_PC31 = 1
    in_PC32 = 1
    in_StartPC = 1
    in_EndPC = 1
    num_of_groups = 1
    if options.benchmark_num == 1: # cachebw
        in_StartPC = 0x4072c0
        in_EndPC = 0x4072f1
    elif options.benchmark_num == 2: # multilevel
        in_StartPC = 0x404b5d
        in_EndPC = 0x404b8e
        num_of_groups = 4
    elif options.benchmark_num == 3: # mv
        in_PC1  = 0x4021f0
        if options.num_cpus == 64:
            num_of_groups = 4
    elif options.benchmark_num == 4: # conv3d
        in_PC1 = 0x40231b
    elif options.benchmark_num == 5: # mlp
        in_PC1  = 0x403f54 # Share Input, Input only
        in_PC2  = 0x403f62
        in_PC3  = 0x403f6f
        in_PC4  = 0x403f7c
        in_PC5  = 0x403f89
        in_PC6  = 0x403f96
        in_PC7  = 0x403fa0
        in_PC8  = 0x403faa
        in_PC9  = 0x403fb4
        in_PC10 = 0x403fbe
        in_PC11 = 0x403fc8
        in_PC12 = 0x403fd2
        in_PC13 = 0x403fdc
        in_PC14 = 0x403fe6
        in_PC15 = 0x403ff0
        in_PC16 = 0x403ff5
    elif options.benchmark_num == 6: # backprop
        if options.num_cpus == 16:
            in_PC1  = 0x402ec0
            in_PC2  = 0x402ede
            in_PC3  = 0x402f22
            in_PC4  = 0x4033a0
        if options.num_cpus == 64:
            in_PC1  = 0x402ec0
            in_PC2  = 0x402ede
            in_PC3  = 0x402f22
            in_PC4  = 0x4033a0
            num_of_groups = 4
    elif options.benchmark_num == 7: # particlefilter
        in_PC1  = 0x403530
        in_PC2  = 0x403c60
        in_PC3  = 0x403c65
        in_PC4  = 0x404d60

    #
    # Must create the individual controllers before the network to ensure the
    # controller constructors are called before the network constructor
    #
    for i in range(options.num_clusters):
        for j in range(num_cpus_per_cluster):
            #
            # First create the Ruby objects associated with this cpu
            #
            l0i_cache = L0Cache(size = options.l0i_size,
                assoc = options.l0i_assoc,
                is_icache = True,
                start_index_bit = block_size_bits,
                replacement_policy = LRURP()
                )

            l0d_cache = L0Cache(size = options.l0d_size,
                assoc = options.l0d_assoc,
                is_icache = False,
                start_index_bit = block_size_bits,
                replacement_policy = LRURP(),
                printCacheEvictionDist = options.print_l0_cache_evict_dist
                )

            # the ruby random tester reuses num_cpus to specify the
            # number of cpu ports connected to the tester object, which
            # is stored in system.cpu. because there is only ever one
            # tester object, num_cpus is not necessarily equal to the
            # size of system.cpu; therefore if len(system.cpu) == 1
            # we use system.cpu[0] to set the clk_domain, thereby ensuring
            # we don't index off the end of the cpu list.
            if len(system.cpu) == 1:
                clk_domain = system.cpu[0].clk_domain
            else:
                clk_domain = system.cpu[i].clk_domain

            # Ruby prefetcher
            prefetcher = RubyPrefetcher(
                num_streams=16,
                unit_filter = 256,
                nonunit_filter = 256,
                train_misses = 5,
                num_startup_pfs = 4,
                cross_page = True
            )

            bingo_prefetcher = RubyBingoPrefetcher(
                enabled= options.enable_L1bingo_L2Stride, #additional prefetcher
            )

            l0_cntrl = L0Cache_Controller(
                   version = i * num_cpus_per_cluster + j, number_of_TBEs = 256,
                   Icache = l0i_cache, Dcache = l0d_cache,
                   transitions_per_cycle = options.l0_transitions_per_cycle,
                   prefetcher = prefetcher,
                   bingoPrefetcher=bingo_prefetcher, #add bingo_prefetcher
                   enable_prefetch = False,
                   send_evictions = send_evicts(options),
                   clk_domain = clk_domain,
                   ruby_system = ruby_system,
                   request_latency = 4,
                   response_latency = 4,

                   PC1 = in_PC1, PC2 = in_PC2, PC3 = in_PC3, PC4 = in_PC4, PC5 = in_PC5,
                   PC6 = in_PC6, PC7 = in_PC7, PC8 = in_PC8, PC9 = in_PC9, PC10 = in_PC10,
                   PC11 = in_PC11, PC12 = in_PC12, PC13 = in_PC13, PC14 = in_PC14, PC15 = in_PC15, 
                   PC16 = in_PC16, PC17 = in_PC17, PC18 = in_PC18, PC19 = in_PC19, PC20 = in_PC20,
                   PC21 = in_PC21, PC22 = in_PC22, PC23 = in_PC23, PC24 = in_PC24, PC25 = in_PC25,
                   PC26 = in_PC26, PC27 = in_PC27, PC28 = in_PC28, PC29 = in_PC29, PC30 = in_PC30,
                   PC31 = in_PC31, PC32 = in_PC32,

                   StartPC = in_StartPC, EndPC = in_EndPC,

                   prefetch_L2only = options.enable_prefetchL2, 
                   donot_observe_prefetch = options.donot_observe_prefetch
                   )

            cpu_seq = RubySequencer(version = i * num_cpus_per_cluster + j, max_outstanding_requests = 16,
                                    clk_domain = clk_domain,
                                    dcache = l0d_cache,
                                    ruby_system = ruby_system)

            l0_cntrl.sequencer = cpu_seq

            l1_cache = L1Cache(size = options.l1d_size,
                               assoc = options.l1d_assoc,
                               start_index_bit = block_size_bits,
                               is_icache = False,
                               replacement_policy = LRURP(),
                               printCacheEvictionDist = \
                                       options.print_l1_cache_evict_dist,
                                enable_DoNotReplacePushed = options.enable_DoNotReplacePushed,
                                is_software_pushmulticast = 1)
            l1_prefetcher = RubyPrefetcher(
                num_streams=16,
                unit_filter = 256,
                nonunit_filter = 256,
                train_misses = 5,
                num_startup_pfs = 4,
                cross_page = True
            )

            l1_cntrl = L1Cache_Controller(
                    version = i * num_cpus_per_cluster + j, number_of_TBEs = 256,
                    cache = l1_cache, l2_select_num_bits = l2_bits,
                    prefetcher=l1_prefetcher,
                    enable_prefetch = options.enable_L1bingo_L2Stride,
                    cluster_id = i,
                    transitions_per_cycle = options.l1_transitions_per_cycle, 
                    l1_request_latency=7,
                    l1_response_latency=7,
                    en_prepushfilter = options.en_prepushfilter,

                    PC1 = in_PC1, PC2 = in_PC2, PC3 = in_PC3, PC4 = in_PC4, PC5 = in_PC5,
                    PC6 = in_PC6, PC7 = in_PC7, PC8 = in_PC8, PC9 = in_PC9, PC10 = in_PC10,
                    PC11 = in_PC11, PC12 = in_PC12, PC13 = in_PC13, PC14 = in_PC14, PC15 = in_PC15, 
                    PC16 = in_PC16, PC17 = in_PC17, PC18 = in_PC18, PC19 = in_PC19, PC20 = in_PC20,
                    PC21 = in_PC21, PC22 = in_PC22, PC23 = in_PC23, PC24 = in_PC24, PC25 = in_PC25,
                    PC26 = in_PC26, PC27 = in_PC27, PC28 = in_PC28, PC29 = in_PC29, PC30 = in_PC30,
                    PC31 = in_PC31, PC32 = in_PC32,

                    StartPC = in_StartPC, EndPC = in_EndPC,

                    TimeoutThreshold = options.timeout_threshold,
                    load_to_timeout = options.load_to_timeout,
                    numofcores = options.num_cpus,
                    numofgroups = num_of_groups,
                    Last_config_ticks = 0,
                    en_softprepush = options.en_softprepush,
                    pass_config = options.pass_config,
                    determine_host = options.determine_host,
                    enable_select_newvictim = options.enable_select_newvictim,
                    ruby_system = ruby_system, donot_observe_prefetch = options.donot_observe_prefetch, en_adaptive_timeout_threshold = options.en_adaptive_timeout_threshold,
                    en_adaptive_timeout_division = options.en_adaptive_timeout_division, timeout_threshold_upper_bound = options.timeout_threshold_upper_bound)

            exec("ruby_system.l0_cntrl%d = l0_cntrl"
                 % ( i * num_cpus_per_cluster + j))
            exec("ruby_system.l1_cntrl%d = l1_cntrl"
                 % ( i * num_cpus_per_cluster + j))

            #
            # Add controllers and sequencers to the appropriate lists
            #
            cpu_sequencers.append(cpu_seq)
            l0_cntrl_nodes.append(l0_cntrl)
            l1_cntrl_nodes.append(l1_cntrl)

            # Connect the L0 and L1 controllers
            l0_cntrl.prefetchQueue = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l0_cntrl.mandatoryQueue = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l0_cntrl.bufferToL1 = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,ordered = True, buffer_size = buffer_size)
            l1_cntrl.bufferFromL0 = l0_cntrl.bufferToL1
            l0_cntrl.bufferFromL1 = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,ordered = True, buffer_size = buffer_size)
            l1_cntrl.bufferToL0 = l0_cntrl.bufferFromL1

            # Connect the L1 controllers and the network
            l1_cntrl.requestToL2 = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l1_cntrl.requestToL2.master = ruby_system.network.slave
            l1_cntrl.responseToL2 = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l1_cntrl.responseToL2.master = ruby_system.network.slave
            l1_cntrl.unblockToL2 = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l1_cntrl.unblockToL2.master = ruby_system.network.slave

            l1_cntrl.requestFromL2 = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l1_cntrl.requestFromL2.slave = ruby_system.network.master
            l1_cntrl.responseFromL2 = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l1_cntrl.responseFromL2.slave = ruby_system.network.master
            l1_cntrl.prefetchQueue = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)


        for j in range(num_l2caches_per_cluster):
            l2_cache = L2Cache(size = options.l2_size,
                               assoc = options.l2_assoc,
                               start_index_bit = l2_index_start,
                               profileLLCSharers = options.profile_llc_sharers,
                               printCacheEvictionDist = \
                                       options.print_l2_cache_evict_dist,
                                dataAccessLatency = 20,
                                tagAccessLatency = 20)

            l2_cntrl = L2Cache_Controller(
                        version = i * num_l2caches_per_cluster + j, number_of_TBEs = 256,
                        L2cache = l2_cache, cluster_id = i,
                        transitions_per_cycle =\
                        options.l2_transitions_per_cycle,
                        ruby_system = ruby_system,

                        l2_request_latency = 20,
                        l2_response_latency = 20,
                        to_l1_latency = 20,

                        en_dont_response = options.en_dont_response,
                        dont_response_threshold = options.dont_response_threshold,

                        windowCycles = options.window_cycles,
                        profileLLCSharers = options.profile_llc_sharers,
                        numofcores = options.num_cpus,
                        numofgroups = num_of_groups,
                        timeout_switch_threshold = options.timeout_switch_threshold,
                        en_softprepush = options.en_softprepush,
                        en_timeout_multicast = options.en_timeout_multicast,
                        en_dir_prepush = options.en_dir_prepush,
                        en_prepushfilter = options.en_prepushfilter,
                        en_hostswitch = options.en_hostswitch,
                        pass_config = options.pass_config,
                        alwaysPrepush = options.always_prepush,
                        en_sync = options.en_sync, recongnize_PushEntry = options.recongnize_PushEntry, en_center_level = options.en_center_level)

            exec("ruby_system.l2_cntrl%d = l2_cntrl"
                 % (i * num_l2caches_per_cluster + j))
            l2_cntrl_nodes.append(l2_cntrl)

            # Connect the L2 controllers and the network
            l2_cntrl.DirRequestFromL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l2_cntrl.DirRequestFromL2Cache.master = ruby_system.network.slave
            l2_cntrl.L1RequestFromL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l2_cntrl.L1RequestFromL2Cache.master = ruby_system.network.slave
            l2_cntrl.responseFromL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,ordered = True, buffer_size = buffer_size)
            l2_cntrl.responseFromL2Cache.master = ruby_system.network.slave

            l2_cntrl.unblockToL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l2_cntrl.unblockToL2Cache.slave = ruby_system.network.master
            l2_cntrl.L1RequestToL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size,
                                  coalescing = options.coalescing,
                                  profile = options.profile_llc_sharers,
                                  profilePCLow = options.profile_pc_low,
                                  profilePCHigh = options.profile_pc_high)
            l2_cntrl.L1RequestToL2Cache.slave = ruby_system.network.master
            l2_cntrl.responseToL2Cache = \
                    MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
            l2_cntrl.responseToL2Cache.slave = ruby_system.network.master

    # Run each of the ruby memory controllers at a ratio of the frequency of
    # the ruby system
    # clk_divider value is a fix to pass regression.
    ruby_system.memctrl_clk_domain = DerivedClockDomain(
            clk_domain = ruby_system.clk_domain, clk_divider = 3)

    mem_dir_cntrl_nodes, rom_dir_cntrl_node = create_directories(
        options, bootmem, ruby_system, system)
    dir_cntrl_nodes = mem_dir_cntrl_nodes[:]
    if rom_dir_cntrl_node is not None:
        dir_cntrl_nodes.append(rom_dir_cntrl_node)
    for dir_cntrl in dir_cntrl_nodes:
        # Connect the directory controllers and the network
        dir_cntrl.requestToDir = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dir_cntrl.requestToDir.slave = ruby_system.network.master
        dir_cntrl.responseToDir = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dir_cntrl.responseToDir.slave = ruby_system.network.master
        dir_cntrl.responseFromDir = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dir_cntrl.responseFromDir.master = ruby_system.network.slave
        dir_cntrl.requestToMemory = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dir_cntrl.responseFromMemory = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)

    for i, dma_port in enumerate(dma_ports):
        #
        # Create the Ruby objects associated with the dma controller
        #
        dma_seq = DMASequencer(version = i, ruby_system = ruby_system)

        dma_cntrl = DMA_Controller(version = i,
                                   dma_sequencer = dma_seq,
                                   transitions_per_cycle = options.ports,
                                   ruby_system = ruby_system)

        exec("ruby_system.dma_cntrl%d = dma_cntrl" % i)
        exec("ruby_system.dma_cntrl%d.dma_sequencer.slave = dma_port" % i)
        dma_cntrl_nodes.append(dma_cntrl)

        # Connect the dma controller to the network
        dma_cntrl.mandatoryQueue = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dma_cntrl.responseFromDir = \
                MessageBuffer(enable_filter_drop = options.en_Filter_Drop,ordered = True, buffer_size = buffer_size)
        dma_cntrl.responseFromDir.slave = ruby_system.network.master
        dma_cntrl.requestToDir = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        dma_cntrl.requestToDir.master = ruby_system.network.slave

    all_cntrls = l0_cntrl_nodes + \
                 l1_cntrl_nodes + \
                 l2_cntrl_nodes + \
                 dir_cntrl_nodes + \
                 dma_cntrl_nodes

    # Create the io controller and the sequencer
    if full_system:
        io_seq = DMASequencer(version=len(dma_ports), ruby_system=ruby_system)
        ruby_system._io_port = io_seq
        io_controller = DMA_Controller(version = len(dma_ports),
                                       dma_sequencer = io_seq,
                                       ruby_system = ruby_system)
        ruby_system.io_controller = io_controller

        # Connect the dma controller to the network
        io_controller.mandatoryQueue = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        io_controller.responseFromDir = \
                MessageBuffer(enable_filter_drop = options.en_Filter_Drop,ordered = True, buffer_size = buffer_size)
        io_controller.responseFromDir.slave = ruby_system.network.master
        io_controller.requestToDir = MessageBuffer(enable_filter_drop = options.en_Filter_Drop,buffer_size = buffer_size)
        io_controller.requestToDir.master = ruby_system.network.slave

        all_cntrls = all_cntrls + [io_controller]
    # Register configuration with filesystem
    else:
        for i in range(options.num_clusters):
            for j in range(num_cpus_per_cluster):
                FileSystemConfig.register_cpu(
                        physical_package_id = 0,
                        core_siblings = range(options.num_cpus),
                        core_id = i*num_cpus_per_cluster+j,
                        thread_siblings = [])

                FileSystemConfig.register_cache(
                        level = 0,
                        idu_type = 'Instruction',
                        size = options.l0i_size,
                        line_size = options.cacheline_size,
                        assoc = 1,
                        cpus = [i*num_cpus_per_cluster+j])
                FileSystemConfig.register_cache(
                        level = 0,
                        idu_type = 'Data',
                        size = options.l0d_size,
                        line_size = options.cacheline_size,
                        assoc = 1,
                        cpus = [i*num_cpus_per_cluster+j])

                FileSystemConfig.register_cache(
                        level = 1,
                        idu_type = 'Unified',
                        size = options.l1d_size,
                        line_size = options.cacheline_size,
                        assoc = options.l1d_assoc,
                        cpus = [i*num_cpus_per_cluster+j])

            FileSystemConfig.register_cache(
                    level = 2,
                    idu_type = 'Unified',
                    size = str(MemorySize(options.l2_size) * \
                            num_l2caches_per_cluster)+'B',
                    line_size = options.cacheline_size,
                    assoc = options.l2_assoc,
                    cpus = [n for n in range(i*num_cpus_per_cluster, \
                            (i+1)*num_cpus_per_cluster)])

    ruby_system.network.number_of_virtual_networks = 3
    assert not options.prepush or \
            options.noc_coherence_constraint != "unordered"
    ruby_system.network.coherenceConstraint = options.noc_coherence_constraint
    topology = create_topology(all_cntrls, options)
    return (cpu_sequencers, mem_dir_cntrl_nodes, topology)
