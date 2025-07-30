import os
import sys
import argparse
import numpy as np
import math
from scipy import stats
from copy import deepcopy
import matplotlib.pyplot as plt
# import pandas as pd
import seaborn as sns
from easypyplot import pdf, barchart
from easypyplot import format as fmt


# plot minus sign (for negative numbers) properly
plt.rcParams['axes.unicode_minus'] = False

def main():

    parser = argparse.ArgumentParser("A script for processing gem5 sharer results")

    parser.add_argument("--num-cpus", type=int, nargs="*", default=[16],
                        help="Number of cpus for sweep [Default: [16]]")
    parser.add_argument("--ncpu", type=int, default=16,
                        help="Number of cpus [Default: 16]")
    parser.add_argument("--window-cycles", type=int, nargs="*", default=[200],
                        help="Window cycles [Default: [200]]")
    parser.add_argument("--benchmark", default="mv", type=str,
                        choices=["cachebw", "mv", "particlefilter-2fr"],
                        help="Benchmark to run [Default: cachebw]")
    parser.add_argument("--benchmark-name", default="cachebw", type=str,
                        help="Benchmark name [Default: cachebw]")
    parser.add_argument("--benchmark-list", type=str, nargs="*",
                        default=["backprop", "cachebw", "mlp", "mv",
                                 "particlefilter-2fr"],
                        #default=["backprop", "bfs", "btree", "cachebw",
                        #         "cfd-2iter", "conv3d", "lud", "mlp", "mv",
                        #         "nn", "particlefilter-2fr", "pathfinder", "srad"],
                        help="Benchmarks to be processed, full list: "
                             "[backprop, bfs, btree, cachebw, cfd-2iter, "
                             "conv3d, hotspot, hotspot3D, kmeans, lud, mlp, "
                             "mv, nn, particlefilter-2fr, pathfinder, srad], "
                             "[ Default: [backprop, bfs, btree, cachebw, "
                             "cfd-2iter, conv3d, lud, mlp, mv, nn, "
                             "particlefilter-2fr, pathfinder, srad] ]")
    parser.add_argument("--benchmark-names", type=str, nargs="*",
                        default=["backprop", "cachebw", "mlp", "mv",
                                 "particlefilter"],
                        #default=["backprop", "bfs", "btree", "cachebw",
                        #         "cfd", "conv3d", "lud", "mlp", "mv",
                        #         "nn", "particlefilter", "pathfinder", "srad"],
                        help="Benchmarks to be processed, full list: "
                             "[backprop, bfs, btree, cachebw, cfd, conv3d, "
                             "hotspot, hotspot3D, kmeans, lud, mlp, mv, nn, "
                             "particlefilter, pathfinder, srad], [Default: "
                             "[backprop, bfs, btree, cachebw, cfd, conv3d, lud,"
                             " mlp, mv, nn, particlefilter, pathfinder, srad]]")
    parser.add_argument("--action", default=None, type=str,
                        choices=["sharer-histogram", "access-interval-hist",
                                 "interval-dist", "concurrent-req-hist",
                                 "runtime", "traffic", "filter-dist",
                                 "prepush", "waits", "misses", "all", "motivation", "sensitivity",
                                 "link-load", "runtime-link-widths", "runtime-cache-size"],
                        help="Sharer stat process actions")
    parser.add_argument("--link-widths", type=int, nargs="*",
                        default=[64, 128, 256, 512],
                        help="Link width configurations for runtime process, "
                             "default: [64, 128, 256, 512]")
    parser.add_argument("--cache-sizes", type=int, nargs="*",
                        default=[256, 512, 1024],
                        help="Private L2 cache size in KByte, "
                             "default: [256, 512, 1024]")
    parser.add_argument("--prepush-scheme", type=str,
                        default="prepush-multicast",
                        choices=["prepush-ack", "prepush-ack-multicast",
                                 "prepush", "prepush-multicast",
                                 "prepush-stream", "softprepush"])
    parser.add_argument("--software-prepush-scheme", type=str,
                        default="softprepush",
                        choices=["prepush-ack", "prepush-ack-multicast",
                                 "prepush", "prepush-multicast",
                                 "prepush-stream"])
    parser.add_argument("--prepush-name", type=str,
                        default="OrderedPrepush",
                        choices=["PrepushAck", "OrderedPrepush"])
    parser.add_argument("--scheme-list", type=str, nargs="*",
                        default=["baseline", "multicast",
                                 "coalescing-multicast",
                                 "prepush-ack-multicast",
                                 "prepush-multicast",
                                 "prepush-stream"],
                        help="Schemes to be processed, full list: [baseline, "
                             "coalescing, multicast, coalescing-multicast, "
                             "prepush-ack, prepush-ack-multicast, prepush, "
                             "prepush-multicast, prepush-stream], [Default: "
                             "[baseline, multicast, coalescing-multicast, "
                             "prepush-ack-multicast, prepush-multicast, "
                             "prepush-stream] ]")
    parser.add_argument("--scheme-names", type=str, nargs="*",
                        default=["Baseline", "Multicast", "Coalesce",
                                 "PrepushAck", "Prepush", "PrepushStream"],
                        help="Scheme names, full list: [Baseline, Coalesce, "
                             "Multicast, CoalesceMcast, PrepushAck, Prepush, "
                             "PrepushAckMcast, PrepushMcast],  [Default: "
                             "[Baseline, Multicast, Coalesce, PrepushAck, "
                             "Prepush, PrepushStream] ]")
    parser.add_argument("--m5out-dir", default=None, type=str,
                        help="Gem5 m5out experiment directory [Default: None]")
    parser.add_argument("--plot", default=False, action="store_true",
                        help="Plot the figures")
    parser.add_argument("--show", default=False, action="store_true",
                        help="Show the figures")
    parser.add_argument("--disable-pdf", default=False, action="store_true",
                        help="Disable pdf generation")
    parser.add_argument("--new", default=False, action="store_true",
                        help="Process new stats without reusing the stored npy")
    parser.add_argument("--use-99percent", default=False, action="store_true",
                        help="Use 99%% data for access-interval-hist")
    parser.add_argument("--fig-dir", default="figures", type=str,
                        help="Direcotry for the PDF figures [Default: figures]")
    parser.add_argument("--logfile", default=None, type=str,
                        help="Input file for simulation log [Default: None]")
    parser.add_argument("--verbose", default=False, action="store_true",
                        help="Enable verbose print")
    parser.add_argument("--print-csv", default=False, action="store_true",
                        help="Print in CSV format")
    parser.add_argument("--npy-result-file", default=None, type=str,
                        help="Result file name")

    args = parser.parse_args()

    if args.action == "motivation":
        motivation_results = {}
        access_latency_results = process_access_latency(args)
        motivation_results.update(access_latency_results)

        assert args.plot
        plot_motivation(args, motivation_results)
    elif args.action == "runtime":
        if args.m5out_dir is None or not os.path.exists(args.m5out_dir):
            print(f"Error: m5out directory {args.m5out_dir} not exists!")
            exit(1)
        results = process_runtime(args)
        if len(args.num_cpus) > 1:
            for ncpu in args.num_cpus:
                cpu_runtime_results = process_runtime_for_ncpu(args, ncpu)
                results.update(cpu_runtime_results)
                cpu_misses_results = process_misses_for_ncpu(args, ncpu)
                results.update(cpu_misses_results)
        if len(args.num_cpus) > 1:
            if args.plot:
                # plot_runtime(args, results)
                # plot_runtime_for_all_cpus(args, results)
                plot_runtime_and_miss_for_all_cpus(args, results)
        else:
            if args.plot:
                plot_runtime(args, results)
                # plot_runtime_for_all_cpus(args, results)
                # plot_runtime_and_miss_for_all_cpus(args, results)
    elif args.action == "sensitivity":
        if args.m5out_dir is None or not os.path.exists(args.m5out_dir):
            print(f"Error: m5out directory {args.m5out_dir} not exists!")
            exit(1)
        results = process_sensitivity_runtime(args)
        if args.plot:
            plot_runtime(args, results)
    elif args.action == "traffic":
        if args.m5out_dir is None or not os.path.exists(args.m5out_dir):
            print(f"Error: m5out directory {args.m5out_dir} not exists!")
            exit(1)
        results = process_traffic(args)
        if args.plot:
            plot_traffic(args, results)
    elif args.action == "runtime-link-widths":
        if args.m5out_dir is None or not os.path.exists(args.m5out_dir):
            print(f"Error: m5out directory {args.m5out_dir} not exists!")
            exit(1)
        #results = process_runtime_link_widths(args)
        results = process_paper_runtime_link_widths(args)
        if args.plot:
            plot_runtime_link_widths(args, results)
    elif args.action == "waits":
        # path = f"{args.m5out_dir}/{args.software_prepush_scheme}"
        # if args.m5out_dir is None or not os.path.exists(path):
        #     print(f"Error: m5out directory {path} not exists!")
        #     exit(1)
        all_results = {}
        for scheme in args.scheme_list:
            if "softprepush" in scheme:
                args.software_prepush_scheme = scheme
                # filter_results = process_filter_distribution(args)
                software_prepush_results = process_software_wait(args)
                # all_results.update(filter_results)
                all_results.update(software_prepush_results)
        num_prepush_schemes = 0
        for i, scheme in enumerate(args.scheme_list):
            if "softprepush" in scheme:
                num_prepush_schemes += 1
                args.software_prepush_scheme = scheme
                args.software_prepush_name = args.scheme_names[i]
                # plot_filter_distribution(args, all_results)
                plot_waits(args, all_results)
        plot_all_waits(args, all_results)
    elif args.action == "prepush":
        path = f"{args.m5out_dir}/{args.prepush_scheme}"
        if args.m5out_dir is None or not os.path.exists(path):
            print(f"Error: m5out directory {path} not exists!")
            exit(1)
        all_results = {}
        for scheme in args.scheme_list:
            if "prepush" in scheme:
                args.prepush_scheme = scheme
                # filter_results = process_filter_distribution(args)
                prepush_results = process_prepush(args)
                # all_results.update(filter_results)
                all_results.update(prepush_results)
        num_prepush_schemes = 0
        for i, scheme in enumerate(args.scheme_list):
            if "prepush" in scheme:
                num_prepush_schemes += 1
                args.prepush_scheme = scheme
                args.prepush_name = args.scheme_names[i]
                # plot_filter_distribution(args, all_results)
                plot_prepush(args, all_results)
        if num_prepush_schemes > 1:
            # plot_all_filter_distribution(args, all_results)
            plot_all_prepush(args, all_results)
    elif args.action == "misses":
        if args.m5out_dir is None or not os.path.exists(args.m5out_dir):
            print(f"Error: m5out directory {args.m5out_dir} not exists!")
            exit(1)
        results = process_misses(args)
        if args.plot:
            plot_misses(args, results)
    elif args.action is None:
        print(f"Action option '--action' not provided")
    else:
        print(f"Error: unknown action {args.action}")


def add_line(ax, xpos1, ypos1, xpos2, ypos2):
    line = plt.Line2D(
            [xpos1, xpos2], [ypos1, ypos2],
            transform=ax.transAxes,
            color="black",
            linewidth=1)
    line.set_clip_on(False)
    ax.add_line(line)


def add_label(ax, num_schemes, data):
    _, y_max = ax.get_ylim()
    width = 0.8 / num_schemes
    xpos1 = (1 + width * 1.5) / 2
    ypos1 = data / y_max
    xpos2 = (1 + width * 3.5) / 2
    ypos2 = (ypos1 + 1) / 2
    add_line(ax, xpos1, ypos1, xpos2, ypos2)
    xpos3 = xpos2 + width / 2
    add_line(ax, xpos2, ypos2, xpos3, ypos2)
    ax.text(xpos3 + width / 2, ypos2, round(data, 2), ha="center",
            fontsize=18, transform=ax.transAxes)


def add_baseline_label(ax, num_schemes, data):
    _, y_max = ax.get_ylim()
    width = 0.8 / num_schemes
    xpos_base = (1 - width * (num_schemes - 1) / 2) / 2
    ypos_base = data / y_max + 0.02
    ax.text(xpos_base, ypos_base, round(data, 2), ha="center",
            fontsize=18, transform=ax.transAxes)


def add_xaxis_line(ax, xpos, ypos):
    line = plt.Line2D(
        [xpos, xpos],
        [0, ypos],
        transform=ax.transAxes,
        color='black',
        linewidth=1)
    line.set_clip_on(False)
    ax.add_line(line)

def process_access_latency(args):
    results = {}

    # latency
    num_cores = len(args.num_cpus)
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)
    num_links = len(args.link_widths)

    results["access_latency"] = np.zeros(
            (num_cores, num_links, num_benchmarks), dtype=np.float64)
    
    for n, ncpu in enumerate(args.num_cpus):
        for b, benchmark in enumerate(args.benchmark_list):
            for l, link in enumerate(args.link_widths):
                average_ticks = 0
                directory = f"{args.m5out_dir}/link-{link}bits/baseline/{benchmark}-{ncpu}cpus"
                filename = f"{directory}/stats.txt"
                with open(filename, "r") as statsfile:
                    for line in statsfile:
                        if "average_tick_in_load" in line:
                            line = line.split()
                            average_ticks = float(line[1])
                        elif "End Simulation Statistics" in line:
                            break
                    results["access_latency"][n][l][b] = average_ticks/500
    print(results)
    return results

def process_misses_for_ncpu(args, ncpu):
    results = {}

    # miss rates
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)

    results[f"{ncpu}cpus-demand-accesses"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-demand-hits"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-demand-misses"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-miss-rate"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-miss-rate-change"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-mpki"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-mpki-l0"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)

    for b, benchmark in enumerate(args.benchmark_list):

        baseline_miss_rate = 0
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{ncpu}cpus"
            filename = f"{directory}/stats.txt"

            demand_accesses = 0
            demand_hits = 0
            demand_misses = 0
            demand_misses_l0 = 0
            total_insts = 0

            file_empty = True
            with open(filename, "r") as statsfile:
                for line in statsfile:
                    file_empty = False
                    if "l0_cntrl" in line and "cache.demand_misses" in line:
                        line = line.split()
                        demand_misses_l0 += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_accesses" in line:
                        line = line.split()
                        demand_accesses += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_hits" in line:
                        line = line.split()
                        demand_hits += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_misses" in line:
                        line = line.split()
                        demand_misses += int(line[1])
                    elif "sim_insts" in line:
                        line = line.split()
                        total_insts += int(line[1])
                    elif "End Simulation Statistics" in line:
                        break

                statsfile.close()

            assert demand_accesses == demand_hits + demand_misses

            if file_empty:
                assert demand_accesses == 0
                demand_accesses = 1 # for divided by zero error

            miss_rate = demand_misses * 100 / demand_accesses
            if s == 0:
                baseline_miss_rate = miss_rate

            results[f"{ncpu}cpus-demand-accesses"][s][b] = demand_accesses
            results[f"{ncpu}cpus-demand-hits"][s][b] = demand_hits
            results[f"{ncpu}cpus-demand-misses"][s][b] = demand_misses
            results[f"{ncpu}cpus-miss-rate"][s][b] = miss_rate
            results[f"{ncpu}cpus-miss-rate-change"][s][b] = miss_rate - baseline_miss_rate
            print(scheme)
            print(benchmark)
            if (total_insts != 0):
                results[f"{ncpu}cpus-mpki"][s][b] = demand_misses * 1000 / total_insts
                results[f"{ncpu}cpus-mpki-l0"][s][b] = demand_misses_l0 * 1000 / total_insts
            else:
                results[f"{ncpu}cpus-mpki"][s][b] = 0
                results[f"{ncpu}cpus-mpki-l0"][s][b] = 0

    return results


def process_runtime_for_ncpu(args, ncpu):
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)
    if num_benchmarks == 1:
        enable_gmean = 0
    else:
        enable_gmean = 1

    results = {f"{ncpu}cpus-runtime": {}, f"{ncpu}cpus-traffic": {}}
    results[f"{ncpu}cpus-normalized-runtime"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results[f"{ncpu}cpus-speedup"] = np.zeros(
            (num_schemes, (num_benchmarks+enable_gmean)), dtype=np.float64)
    results[f"{ncpu}cpus-speedup-overBingo"] = np.zeros(
            (num_schemes, (num_benchmarks+enable_gmean)), dtype=np.float64)

    for b, benchmark in enumerate(args.benchmark_list):
        results[f"{ncpu}cpus-runtime"][benchmark] = {}
        results[f"{ncpu}cpus-traffic"][benchmark] = {}

        baseline_runtime = None
        bingo_runtime = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{ncpu}cpus"
            filename = f"{directory}/stats.txt"

            sim_seconds = 0
            int_link_utilization = 0
            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "sim_seconds" in line:
                        line = line.split()
                        sim_seconds = float(line[1])
                    if "int_link_utilization" in line:
                        line = line.split()
                        int_link_utilization = int(line[1])
                        break
                    else:
                        continue

                if s == 0:
                    baseline_runtime = sim_seconds
                    bingo_runtime = sim_seconds
                    if sim_seconds == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        baseline_runtime = 1
                elif s == 1:
                    bingo_runtime = sim_seconds
                    if sim_seconds == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        bingo_runtime = 1

                results[f"{ncpu}cpus-runtime"][benchmark][scheme] = sim_seconds
                results[f"{ncpu}cpus-traffic"][benchmark][scheme] = int_link_utilization
                results[f"{ncpu}cpus-normalized-runtime"][s][b] = \
                        sim_seconds / baseline_runtime
                if sim_seconds == 0:
                    results[f"{ncpu}cpus-speedup"][s][b] = 0
                    results[f"{ncpu}cpus-speedup-overBingo"][s][b] = 0
                else:
                    results[f"{ncpu}cpus-speedup"][s][b] = baseline_runtime / sim_seconds
                    results[f"{ncpu}cpus-speedup-overBingo"][s][b] = bingo_runtime / sim_seconds

                statsfile.close()

    if num_benchmarks > 1:
        for s, scheme in enumerate(args.scheme_list):
            results[f"{ncpu}cpus-speedup"][s][-1] = \
                    stats.mstats.gmean(results[f"{ncpu}cpus-speedup"][s][0:-1])
            results[f"{ncpu}cpus-speedup-overBingo"][s][-1] = \
                    stats.mstats.gmean(results[f"{ncpu}cpus-speedup-overBingo"][s][0:-1])

    if args.print_csv:
        print(f"{ncpu}-cpus runtime:")
        key = f"{ncpu}cpus-runtime"
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results[key][benchmark][scheme]},"

            print(line)

        print(f"{ncpu}-cpus normalized runtime:")
        key = f"{ncpu}cpus-normalized-runtime"
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{1.0 / results[key][s][b]},"

            print(line)

        print(f"{ncpu}-cpus speedup:")
        key = f"{ncpu}cpus-speedup"
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results[key][s][b]},"

            print(line)

        if num_benchmarks > 1:
            line = f"gmean,"
            key = f"{ncpu}cpus-speedup"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results[key][s][-1]},"

            print(line)

        print(f"{ncpu}-cpus traffic:")
        key = f"{ncpu}cpus-traffic"
        baseline_total_traffic = 0
        prepush_total_traffic = 0
        total_norm_traffic = 0
        num_of_scheme = len(args.scheme_list)
        # print(num_of_scheme)
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                traffic = results[key][benchmark][scheme]
                if (scheme == "baseline-software-prefetch"):
                    baseline_total_traffic += traffic
                if (scheme == "softprepush"):
                    prepush_total_traffic += traffic
                line += f"{traffic},"
            total_norm_traffic += results[key][benchmark][args.scheme_list[num_of_scheme-1]] / results[key][benchmark][args.scheme_list[0]]
            line += f"{results[key][benchmark][args.scheme_list[num_of_scheme-1]] / results[key][benchmark][args.scheme_list[0]]},"
            

            print(line)
        
        print("baseline total = " + f"{baseline_total_traffic}")
        print("prepush total = " + f"{prepush_total_traffic}")
        print("Norm traffic gmean = " + f"{total_norm_traffic / len(args.benchmark_list)}")

    return results


def process_runtime(args):
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)
    if num_benchmarks == 1:
        enable_gmean = 0
    else:
        enable_gmean = 1

    results = {"runtime": {}, "traffic": {}}
    results["normalized-runtime"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["speedup"] = np.zeros(
            (num_schemes, (num_benchmarks+enable_gmean)), dtype=np.float64)

    for b, benchmark in enumerate(args.benchmark_list):
        results["runtime"][benchmark] = {}
        results["traffic"][benchmark] = {}

        baseline_runtime = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            sim_seconds = 0
            int_link_utilization = 0
            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "sim_seconds" in line:
                        line = line.split()
                        sim_seconds = float(line[1])
                    if "int_link_utilization" in line:
                        line = line.split()
                        int_link_utilization = int(line[1])
                        break
                    else:
                        continue

                if s == 0:
                    baseline_runtime = sim_seconds
                    if sim_seconds == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        baseline_runtime = 1

                results["runtime"][benchmark][scheme] = sim_seconds
                results["traffic"][benchmark][scheme] = int_link_utilization
                results["normalized-runtime"][s][b] = \
                        sim_seconds / baseline_runtime
                if sim_seconds == 0:
                    results["speedup"][s][b] = 0
                else:
                    results["speedup"][s][b] = baseline_runtime / sim_seconds

                statsfile.close()

    if num_benchmarks > 1:
        for s, scheme in enumerate(args.scheme_list):
            results["speedup"][s][-1] = \
                    stats.mstats.gmean(results["speedup"][s][0:-1])

    if args.print_csv:
        print("runtime:")
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results['runtime'][benchmark][scheme]},"

            print(line)

        print("normalized runtime:")
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{1.0 / results['speedup'][s][b]},"

            print(line)

        print("speedup:")
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results['speedup'][s][b]},"

            print(line)

        if num_benchmarks > 1:
            line = f"gmean,"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results['speedup'][s][-1]},"

            print(line)

        print("traffic:")
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            # num_of_scheme = len(args.scheme_list)
            # print(num_of_scheme)
            for scheme in args.scheme_list:
                line += f"{results['traffic'][benchmark][scheme]},"
            # line += f"{results['traffic'][benchmark][args.scheme_list[num_of_scheme]] / results['traffic'][benchmark][args.scheme_list[0]]},"

            print(line)

    return results

def process_sensitivity_runtime(args):
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)
    if num_benchmarks == 1:
        enable_gmean = 0
    else:
        enable_gmean = 1

    results = {"runtime": {}, "traffic": {}}
    results["normalized-runtime"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["speedup"] = np.zeros(
            (num_schemes, (num_benchmarks+enable_gmean)), dtype=np.float64)

    for b, benchmark in enumerate(args.benchmark_list):
        results["runtime"][benchmark] = {}
        results["traffic"][benchmark] = {}

        baseline_runtime = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            sim_seconds = 0
            int_link_utilization = 0
            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "sim_seconds" in line:
                        line = line.split()
                        sim_seconds = float(line[1])
                    if "int_link_utilization" in line:
                        line = line.split()
                        int_link_utilization = int(line[1])
                        break
                    else:
                        continue

                if s == 0:
                    baseline_runtime = sim_seconds
                    if sim_seconds == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        baseline_runtime = 1

                results["runtime"][benchmark][scheme] = sim_seconds
                results["traffic"][benchmark][scheme] = int_link_utilization
                results["normalized-runtime"][s][b] = \
                        sim_seconds / baseline_runtime
                if sim_seconds == 0:
                    results["speedup"][s][b] = 0
                else:
                    results["speedup"][s][b] = baseline_runtime / sim_seconds

                statsfile.close()

    if num_benchmarks > 1:
        for s, scheme in enumerate(args.scheme_list):
            results["speedup"][s][-1] = \
                    stats.mstats.gmean(results["speedup"][s][0:-1])

    if args.print_csv:
        print("runtime:")
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results['runtime'][benchmark][scheme]},"

            print(line)

        print("normalized runtime:")
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{1.0 / results['speedup'][s][b]},"

            print(line)

        print("speedup:")
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results['speedup'][s][b]},"

            print(line)

        if num_benchmarks > 1:
            line = f"gmean,"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{results['speedup'][s][-1]},"

            print(line)

        print("traffic:")
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results['traffic'][benchmark][scheme]},"

            print(line)

    return results


def process_traffic(args):

    results = {"traffic": {}}

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_list)

    results["traffic-breakdown"] = np.zeros(
            (8, num_benchmarks * num_schemes), dtype=np.int64)
    results["normalized-traffic-breakdown"] = np.zeros(
            (8, num_benchmarks * num_schemes), dtype=np.float64)

    results["concise-traffic-breakdown"] = np.zeros(
            (5, num_benchmarks * num_schemes), dtype=np.int64)
    results["concise-normalized-traffic-breakdown"] = np.zeros(
            (5, num_benchmarks * num_schemes), dtype=np.float64)
    # results["concise-normalized-traffic-breakdown"] = np.zeros(
    #         (6, num_benchmarks * num_schemes), dtype=np.float64)
    results["concise-baseline-traffic-breakdown"] = np.zeros(
            (5, num_benchmarks), dtype=np.int64)
    results["concise-baseline-normalized-traffic-breakdown"] = np.zeros(
            (5, num_benchmarks), dtype=np.float64)

    results["inject-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["inject-ctrl-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["inject-data-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-ctrl-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-data-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["network-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)

    # l2 cache inject: gets, putx, preupsh_ack, others
    results["normalized-l2-inject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    # l2 cache eject: data, exclusive data, others
    results["normalized-l2-eject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    # llc cache inject: data, exclusive data, others
    results["normalized-llc-inject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    # llc cache eject: gets, putx, prepush_ack, others
    results["normalized-llc-eject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    results["neg-normalized-llc-eject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    results["neg-normalized-l2-eject-traffic-breakdown"] = np.zeros(
            (3, num_benchmarks * num_schemes), dtype=np.float64)
    results["integrate-normalized-llc-in-eject-traffic-breakdown"] = np.zeros(
            (5, num_benchmarks * num_schemes), dtype=np.float64)

    results["normalized-inject-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-inject-ctrl-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-inject-data-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-eject-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-eject-ctrl-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-eject-data-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-network-traffic"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)

    results["inject-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["inject-ctrl-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["inject-data-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-ctrl-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["eject-data-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["network-load"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)

    base = 2
    stride = 4

    for b, benchmark in enumerate(args.benchmark_list):
        results["traffic"][benchmark] = {}

        baseline_total_traffic = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            excel_line = f"{benchmark},"

            message_index = {}
            first_item = 0
            response_start = 100

            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "ext_in_link_utilization_breakdown::total" in line:
                        line = line.split()
                        linelength = len(line)
                        for m_i in range(linelength):
                            if line[m_i] == "GETX":
                                first_item = m_i
                                message_index["GETX"] = m_i-first_item
                            elif line[m_i] == "UPGRADE":
                                message_index["UPGRADE"] = m_i-first_item
                            elif line[m_i] == "GETS":
                                message_index["GETS"] = m_i-first_item
                            elif line[m_i] == "Config_Req":
                                hasconfig = 1
                                message_index["Config_Req"] = m_i-first_item
                            elif line[m_i] == "GET_INSTR":
                                message_index["GET_INSTR"] = m_i-first_item
                            elif line[m_i] == "INV":
                                if m_i < response_start:
                                    message_index["Req_INV"] = m_i-first_item
                                else:
                                    message_index["Resp_INV"] = m_i-first_item-3
                            elif line[m_i] == "PUTX":
                                message_index["PUTX"] = m_i-first_item
                            elif line[m_i] == "WB_ACK":
                                if m_i < response_start:
                                    message_index["Req_WB_ACK"] = m_i-first_item
                                else:
                                    message_index["Resp_WB_ACK"] = m_i-first_item-3
                            elif line[m_i] == "Responses":
                                response_start = m_i
                            elif line[m_i] == "MEMORY_ACK":
                                message_index["MEMORY_ACK"] = m_i-first_item-3
                            elif line[m_i] == "DATA":
                                message_index["DATA"] = m_i-first_item-3
                            elif line[m_i] == "DATA_EXCLUSIVE":
                                message_index["DATA_EXCLUSIVE"] = m_i-first_item-3
                            elif line[m_i] == "MEMORY_DATA":
                                message_index["MEMORY_DATA"] = m_i-first_item-3
                            elif line[m_i] == "ACK":
                                message_index["ACK"] = m_i-first_item-3
                            elif line[m_i] == "UNBLOCK":
                                message_index["UNBLOCK"] = m_i-first_item-3
                            elif line[m_i] == "EXCLUSIVE_UNBLOCK":
                                message_index["EXCLUSIVE_UNBLOCK"] = m_i-first_item-3
                            elif line[m_i] == "PREPUSH_ACK":
                                message_index["PREPUSH_ACK"] = m_i-first_item-3
                            elif line[m_i] == "Config_Ack":
                                message_index["Config_Ack"] = m_i-first_item-3    
                            elif line[m_i] == "PREPUSH_NACK":
                                message_index["PREPUSH_NACK"] = m_i-first_item-3
                        break
                statsfile.close()

            with open(filename, "r") as statsfile:
                hasconfig = 0
                sim_ticks = 1
                cpu_ticks_per_cycle = 1

                inject_flits = 0
                inject_ctrl_flits = 0
                inject_data_flits = 0
                eject_flits = 0
                eject_ctrl_flits = 0
                eject_data_flits = 0

                gets = 0
                putx = 0
                data = 0
                data_exclusive = 0
                config = 0
                unblock = 0
                exclusive_unblock = 0
                mem_data = 0
                prepush_ack = 0
                int_link_utilization = 0
                # enable_prepush = 0
                # disable_prepush = 0

                l2_inject_getx = 0
                l2_inject_upgrade = 0
                l2_inject_gets = 0
                l2_inject_get_instr = 0
                l2_inject_putx = 0
                l2_inject_ack = 0
                l2_inject_unblock = 0
                l2_inject_xunblock = 0
                l2_inject_prepush_ack = 0
                l2_inject_prepush_nack = 0
                l2_inject_enableprepush = 0
                l2_inject_disableprepush = 0

                l2_eject_inv = 0
                l2_eject_wb_ack = 0
                l2_eject_data = 0
                l2_eject_xdata = 0

                llc_inject_inv = 0
                llc_inject_data = 0
                llc_inject_xdata = 0
                llc_inject_wb_ack = 0

                llc_eject_getx = 0
                llc_eject_upgrade = 0
                llc_eject_gets = 0
                llc_eject_get_instr = 0
                llc_eject_putx = 0
                llc_eject_ack = 0
                llc_eject_unblock = 0
                llc_eject_xunblock = 0
                llc_eject_prepush_ack = 0
                llc_eject_prepush_nack = 0
                llc_eject_enableprepush = 0
                llc_eject_disableprepush = 0

                file_empty = True
                for line in statsfile:
                    file_empty = False
                    if "sim_ticks" in line:
                        line = line.split()
                        sim_ticks = int(line[1])
                    elif "system.cpu_clk_domain.clock" in line:
                        line = line.split()
                        cpu_ticks_per_cycle = int(line[1])
                    elif "ext_in_link_ctrl_utilization" in line:
                        line = line.split()
                        inject_ctrl_flits = int(line[1])
                    elif "ext_in_link_data_utilization" in line:
                        line = line.split()
                        inject_data_flits = int(line[1])
                    elif "ext_out_link_ctrl_utilization" in line:
                        line = line.split()
                        eject_ctrl_flits = int(line[1])
                    elif "ext_out_link_data_utilization" in line:
                        line = line.split()
                        eject_data_flits = int(line[1])
                    elif "ext_in_link_utilization_breakdown" in line and \
                            "total" not in line:
                        line = line.split()
                        # if((scheme == "bingo") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-stride")):
                        #     l2_inject_getx = int(line[base + 0 * stride])
                        #     l2_inject_upgrade = int(line[base + 1 * stride])
                        #     l2_inject_gets = int(line[base + 2 * stride])
                        #     l2_inject_get_instr = int(line[base + 3 * stride])
                        #     l2_inject_putx = int(line[base + 5 * stride])
                        #     l2_inject_ack = int(line[base + 15 * stride])
                        #     l2_inject_unblock = int(line[base + 17 * stride])
                        #     l2_inject_xunblock = int(line[base + 18 * stride])
                        #     l2_inject_prepush_ack = int(line[base + 20 * stride])
                        #     l2_inject_prepush_nack = int(line[base + 21 * stride])

                        #     llc_inject_inv = int(line[base + 4 * stride])
                        #     llc_inject_data = int(line[base + 12 * stride])
                        #     llc_inject_xdata = int(line[base + 13 * stride])
                        #     llc_inject_wb_ack = int(line[base + 16 * stride])
                        # else:
                        #     l2_inject_getx = int(line[base + 0 * stride])
                        #     l2_inject_upgrade = int(line[base + 1 * stride])
                        #     l2_inject_gets = int(line[base + 2 * stride])
                        #     l2_inject_get_instr = int(line[base + 3 * stride])
                        #     l2_inject_putx = int(line[base + 5 * stride])
                        #     l2_inject_ack = int(line[base + 14 * stride])
                        #     l2_inject_unblock = int(line[base + 16 * stride])
                        #     l2_inject_xunblock = int(line[base + 17 * stride])
                        #     l2_inject_prepush_ack = int(line[base + 19 * stride])
                        #     l2_inject_prepush_nack = int(line[base + 20 * stride])

                        #     llc_inject_inv = int(line[base + 4 * stride])
                        #     llc_inject_data = int(line[base + 11 * stride])
                        #     llc_inject_xdata = int(line[base + 12 * stride])
                        #     llc_inject_wb_ack = int(line[base + 15 * stride])
                        print(scheme)
                        # if((benchmark == "blackscholes-large") | (benchmark == "bodytrack-large") | (benchmark == "fluidanimate-large") | (benchmark == "canneal-large") | (benchmark == "freqmine-large") | (benchmark == "swaptions-large") | (scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride")):
                        #     if((scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")): #plus two
                        #         print(line)
                        #         l2_inject_getx = int(line[base + 0 * stride])
                        #         l2_inject_upgrade = int(line[base + 1 * stride])
                        #         l2_inject_gets = int(line[base + 2 * stride])
                        #         l2_inject_get_instr = int(line[base + 3 * stride])
                        #         l2_inject_putx = int(line[base + 5 * stride])
                        #         l2_inject_ack = int(line[base + 15 * stride])
                        #         l2_inject_unblock = int(line[base + 17 * stride])
                        #         l2_inject_xunblock = int(line[base + 18 * stride])
                        #         l2_inject_prepush_ack = int(line[base + 20 * stride])
                        #         l2_inject_prepush_nack = int(line[base + 21 * stride])

                        #         llc_inject_inv = int(line[base + 4 * stride])
                        #         llc_inject_data = int(line[base + 12 * stride])
                        #         llc_inject_xdata = int(line[base + 13 * stride])
                        #         llc_inject_wb_ack = int(line[base + 16 * stride])
                        #     else: #plus one
                        #         l2_inject_getx = int(line[base + 0 * stride])
                        #         l2_inject_upgrade = int(line[base + 1 * stride])
                        #         l2_inject_gets = int(line[base + 2 * stride])
                        #         l2_inject_get_instr = int(line[base + 3 * stride])
                        #         l2_inject_putx = int(line[base + 5 * stride])
                        #         l2_inject_ack = int(line[base + 14 * stride])
                        #         l2_inject_unblock = int(line[base + 16 * stride])
                        #         l2_inject_xunblock = int(line[base + 17 * stride])
                        #         l2_inject_prepush_ack = int(line[base + 19 * stride])
                        #         l2_inject_prepush_nack = int(line[base + 20 * stride])

                        #         llc_inject_inv = int(line[base + 4 * stride])
                        #         llc_inject_data = int(line[base + 11 * stride])
                        #         llc_inject_xdata = int(line[base + 12 * stride])
                        #         llc_inject_wb_ack = int(line[base + 15 * stride])
                        # elif((scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")):
                        #     l2_inject_getx = int(line[base + 0 * stride])
                        #     l2_inject_upgrade = int(line[base + 1 * stride])
                        #     l2_inject_gets = int(line[base + 2 * stride])
                        #     l2_inject_get_instr = int(line[base + 3 * stride])
                        #     l2_inject_putx = int(line[base + 5 * stride])
                        #     l2_inject_ack = int(line[base + 15 * stride])
                        #     l2_inject_unblock = int(line[base + 17 * stride])
                        #     l2_inject_xunblock = int(line[base + 18 * stride])
                        #     l2_inject_prepush_ack = int(line[base + 20 * stride])
                        #     l2_inject_prepush_nack = int(line[base + 21 * stride])
                        #     # l2_inject_enableprepush = int(line[base + 9 * stride])
                        #     # l2_inject_disableprepush = int(line[base + 10 * stride])

                        #     llc_inject_inv = int(line[base + 4 * stride])
                        #     llc_inject_data = int(line[base + 12 * stride])
                        #     llc_inject_xdata = int(line[base + 13 * stride])
                        #     llc_inject_wb_ack = int(line[base + 16 * stride])
                        # else:
                        #     l2_inject_getx = int(line[base + 0 * stride])
                        #     l2_inject_upgrade = int(line[base + 1 * stride])
                        #     l2_inject_gets = int(line[base + 2 * stride])
                        #     l2_inject_get_instr = int(line[base + 3 * stride])
                        #     l2_inject_putx = int(line[base + 5 * stride])
                        #     l2_inject_ack = int(line[base + 13 * stride])
                        #     l2_inject_unblock = int(line[base + 15 * stride])
                        #     l2_inject_xunblock = int(line[base + 16 * stride])
                        #     l2_inject_prepush_ack = int(line[base + 18 * stride])
                        #     l2_inject_prepush_nack = int(line[base + 19 * stride])

                        #     llc_inject_inv = int(line[base + 4 * stride])
                        #     llc_inject_data = int(line[base + 10 * stride])
                        #     llc_inject_xdata = int(line[base + 11 * stride])
                        #     llc_inject_wb_ack = int(line[base + 14 * stride])
                        l2_inject_getx = int(line[base + message_index["GETX"] * stride])
                        l2_inject_upgrade = int(line[base + message_index["UPGRADE"] * stride])
                        l2_inject_gets = int(line[base + message_index["GETS"] * stride])
                        l2_inject_get_instr = int(line[base + message_index["GET_INSTR"] * stride])
                        l2_inject_putx = int(line[base + message_index["PUTX"] * stride])
                        l2_inject_ack = int(line[base + message_index["ACK"] * stride])
                        l2_inject_unblock = int(line[base + message_index["UNBLOCK"] * stride])
                        l2_inject_xunblock = int(line[base + message_index["EXCLUSIVE_UNBLOCK"] * stride])
                        l2_inject_prepush_ack = int(line[base + message_index["PREPUSH_ACK"] * stride])
                        l2_inject_prepush_nack = int(line[base + message_index["PREPUSH_NACK"] * stride])

                        llc_inject_inv = int(line[base + message_index["Req_INV"] * stride])
                        llc_inject_data = int(line[base + message_index["DATA"] * stride])
                        llc_inject_xdata = int(line[base + message_index["DATA_EXCLUSIVE"] * stride])
                        llc_inject_wb_ack = int(line[base + message_index["Resp_WB_ACK"] * stride])
                    elif "ext_in_link_utilization_breakdown::total" in line:
                        line = line.split()
                        inject_flits = int(line[1])
                    elif "ext_out_link_utilization_breakdown" in line and \
                            "total" not in line:
                        line = line.split()
                        # if((scheme == "bingo") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-stride")):
                        #     l2_eject_inv = int(line[base + 4 * stride])
                        #     l2_eject_data = int(line[base + 12 * stride])
                        #     l2_eject_xdata = int(line[base + 13 * stride])
                        #     l2_eject_wb_ack = int(line[base + 16 * stride])

                        #     llc_eject_getx = int(line[base + 0 * stride])
                        #     llc_eject_upgrade = int(line[base + 1 * stride])
                        #     llc_eject_gets = int(line[base + 2 * stride])
                        #     llc_eject_get_instr = int(line[base + 3 * stride])
                        #     llc_eject_putx = int(line[base + 5 * stride])
                        #     llc_eject_ack = int(line[base + 15 * stride])
                        #     llc_eject_unblock = int(line[base + 17 * stride])
                        #     llc_eject_xunblock = int(line[base + 18 * stride])
                        #     llc_eject_prepush_ack = int(line[base + 20 * stride])
                        #     llc_eject_prepush_nack = int(line[base + 21 * stride])
                        # else:
                        #     l2_eject_inv = int(line[base + 4 * stride])
                        #     l2_eject_data = int(line[base + 11 * stride])
                        #     l2_eject_xdata = int(line[base + 12 * stride])
                        #     l2_eject_wb_ack = int(line[base + 15 * stride])

                        #     llc_eject_getx = int(line[base + 0 * stride])
                        #     llc_eject_upgrade = int(line[base + 1 * stride])
                        #     llc_eject_gets = int(line[base + 2 * stride])
                        #     llc_eject_get_instr = int(line[base + 3 * stride])
                        #     llc_eject_putx = int(line[base + 5 * stride])
                        #     llc_eject_ack = int(line[base + 14 * stride])
                        #     llc_eject_unblock = int(line[base + 16 * stride])
                        #     llc_eject_xunblock = int(line[base + 17 * stride])
                        #     llc_eject_prepush_ack = int(line[base + 19 * stride])
                        #     llc_eject_prepush_nack = int(line[base + 20 * stride])
                        # if((benchmark == "blackscholes-large")  | (benchmark == "bodytrack-large") | (benchmark == "fluidanimate-large") | (benchmark == "canneal-large") | (benchmark == "freqmine-large") | (benchmark == "swaptions-large") | (scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride")):
                        #     if((scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")): #plus two
                        #         l2_eject_inv = int(line[base + 4 * stride])
                        #         l2_eject_data = int(line[base + 12 * stride])
                        #         l2_eject_xdata = int(line[base + 13 * stride])
                        #         l2_eject_wb_ack = int(line[base + 16 * stride])

                        #         llc_eject_getx = int(line[base + 0 * stride])
                        #         llc_eject_upgrade = int(line[base + 1 * stride])
                        #         llc_eject_gets = int(line[base + 2 * stride])
                        #         llc_eject_get_instr = int(line[base + 3 * stride])
                        #         llc_eject_putx = int(line[base + 5 * stride])
                        #         llc_eject_ack = int(line[base + 15 * stride])
                        #         llc_eject_unblock = int(line[base + 17 * stride])
                        #         llc_eject_xunblock = int(line[base + 18 * stride])
                        #         llc_eject_prepush_ack = int(line[base + 20 * stride])
                        #         llc_eject_prepush_nack = int(line[base + 21 * stride])
                        #     else: #plus one
                        #         l2_eject_inv = int(line[base + 4 * stride])
                        #         l2_eject_data = int(line[base + 11 * stride])
                        #         l2_eject_xdata = int(line[base + 12 * stride])
                        #         l2_eject_wb_ack = int(line[base + 15 * stride])

                        #         llc_eject_getx = int(line[base + 0 * stride])
                        #         llc_eject_upgrade = int(line[base + 1 * stride])
                        #         llc_eject_gets = int(line[base + 2 * stride])
                        #         llc_eject_get_instr = int(line[base + 3 * stride])
                        #         llc_eject_putx = int(line[base + 5 * stride])
                        #         llc_eject_ack = int(line[base + 14 * stride])
                        #         llc_eject_unblock = int(line[base + 16 * stride])
                        #         llc_eject_xunblock = int(line[base + 17 * stride])
                        #         llc_eject_prepush_ack = int(line[base + 19 * stride])
                        #         llc_eject_prepush_nack = int(line[base + 20 * stride])
                        # elif((scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")):
                        #     l2_eject_inv = int(line[base + 4 * stride])
                        #     l2_eject_data = int(line[base + 12 * stride])
                        #     l2_eject_xdata = int(line[base + 13 * stride])
                        #     l2_eject_wb_ack = int(line[base + 16 * stride])

                        #     llc_eject_getx = int(line[base + 0 * stride])
                        #     llc_eject_upgrade = int(line[base + 1 * stride])
                        #     llc_eject_gets = int(line[base + 2 * stride])
                        #     llc_eject_get_instr = int(line[base + 3 * stride])
                        #     llc_eject_putx = int(line[base + 5 * stride])
                        #     llc_eject_ack = int(line[base + 15 * stride])
                        #     llc_eject_unblock = int(line[base + 17 * stride])
                        #     llc_eject_xunblock = int(line[base + 18 * stride])
                        #     llc_eject_prepush_ack = int(line[base + 20 * stride])
                        #     llc_eject_prepush_nack = int(line[base + 21 * stride])
                        #     # llc_eject_enableprepush = int(line[base + 9 * stride])
                        #     # llc_eject_disableprepush = int(line[base + 10 * stride])
                        # else:
                        #     l2_eject_inv = int(line[base + 4 * stride])
                        #     l2_eject_data = int(line[base + 10 * stride])
                        #     l2_eject_xdata = int(line[base + 11 * stride])
                        #     l2_eject_wb_ack = int(line[base + 14 * stride])

                        #     llc_eject_getx = int(line[base + 0 * stride])
                        #     llc_eject_upgrade = int(line[base + 1 * stride])
                        #     llc_eject_gets = int(line[base + 2 * stride])
                        #     llc_eject_get_instr = int(line[base + 3 * stride])
                        #     llc_eject_putx = int(line[base + 5 * stride])
                        #     llc_eject_ack = int(line[base + 13 * stride])
                        #     llc_eject_unblock = int(line[base + 15 * stride])
                        #     llc_eject_xunblock = int(line[base + 16 * stride])
                        #     llc_eject_prepush_ack = int(line[base + 18 * stride])
                        #     llc_eject_prepush_nack = int(line[base + 19 * stride])
                        l2_eject_inv = int(line[base + message_index["Req_INV"] * stride])
                        l2_eject_data = int(line[base + message_index["DATA"] * stride])
                        l2_eject_xdata = int(line[base + message_index["DATA_EXCLUSIVE"] * stride])
                        l2_eject_wb_ack = int(line[base + message_index["Resp_WB_ACK"] * stride])

                        llc_eject_getx = int(line[base + message_index["GETX"] * stride])
                        llc_eject_upgrade = int(line[base + message_index["UPGRADE"] * stride])
                        llc_eject_gets = int(line[base + message_index["GETS"] * stride])
                        llc_eject_get_instr = int(line[base + message_index["GET_INSTR"] * stride])
                        llc_eject_putx = int(line[base + message_index["PUTX"] * stride])
                        llc_eject_ack = int(line[base + message_index["ACK"] * stride])
                        llc_eject_unblock = int(line[base + message_index["UNBLOCK"] * stride])
                        llc_eject_xunblock = int(line[base + message_index["EXCLUSIVE_UNBLOCK"] * stride])
                        llc_eject_prepush_ack = int(line[base + message_index["PREPUSH_ACK"] * stride])
                        llc_eject_prepush_nack = int(line[base + message_index["PREPUSH_NACK"] * stride])
                    elif "ext_out_link_utilization_breakdown::total" in line:
                        line = line.split()
                        eject_flits = int(line[1])
                    elif "int_link_utilization_breakdown" in line and \
                            "total" not in line:
                        line = line.split()
                        # if((scheme == "bingo") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-stride")):
                        #     gets = int(line[base + 2 * stride])
                        #     putx = int(line[base + 5 * stride])
                        #     data = int(line[base + 12 * stride])
                        #     data_exclusive = int(line[base + 13 * stride])
                        #     mem_data = int(line[base + 14 * stride])
                        #     unblock = int(line[base + 17 * stride])
                        #     exclusive_unblock = int(line[base + 18 * stride])
                        #     prepush_ack = int(line[base + 20 * stride])
                        # else:
                        #     gets = int(line[base + 2 * stride])
                        #     putx = int(line[base + 5 * stride])
                        #     data = int(line[base + 11 * stride])
                        #     data_exclusive = int(line[base + 12 * stride])
                        #     mem_data = int(line[base + 13 * stride])
                        #     unblock = int(line[base + 16 * stride])
                        #     exclusive_unblock = int(line[base + 17 * stride])
                        #     prepush_ack = int(line[base + 19 * stride])
                        # if((benchmark == "blackscholes-large")  | (benchmark == "bodytrack-large") | (benchmark == "fluidanimate-large") | (benchmark == "canneal-large") | (benchmark == "freqmine-large") | (benchmark == "swaptions-large") | (scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride")):
                        #     if((scheme == "bingo") | (scheme == "bingo-16kBPHT") | (scheme == "bingo-stride") | (scheme == "prepush-ack-multicast-feedback-restart-ratio") | (scheme == "prepush-multicast-feedback-restart-ratio") | (scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")): #plus two
                        #         gets = int(line[base + 2 * stride])
                        #         putx = int(line[base + 5 * stride])
                        #         data = int(line[base + 12 * stride])
                        #         data_exclusive = int(line[base + 13 * stride])
                        #         mem_data = int(line[base + 14 * stride])
                        #         unblock = int(line[base + 17 * stride])
                        #         exclusive_unblock = int(line[base + 18 * stride])
                        #         prepush_ack = int(line[base + 20 * stride])
                        #     else: #plus one
                        #         gets = int(line[base + 2 * stride])
                        #         putx = int(line[base + 5 * stride])
                        #         data = int(line[base + 11 * stride])
                        #         data_exclusive = int(line[base + 12 * stride])
                        #         mem_data = int(line[base + 13 * stride])
                        #         unblock = int(line[base + 16 * stride])
                        #         exclusive_unblock = int(line[base + 17 * stride])
                        #         prepush_ack = int(line[base + 19 * stride])
                        # elif((scheme == "prepush-ack-multicast-feedback-ratio-private") | (scheme == "prepush-multicast-feedback-ratio-private")):
                        #     gets = int(line[base + 2 * stride])
                        #     putx = int(line[base + 5 * stride])
                        #     data = int(line[base + 12 * stride])
                        #     data_exclusive = int(line[base + 13 * stride])
                        #     mem_data = int(line[base + 14 * stride])
                        #     unblock = int(line[base + 17 * stride])
                        #     exclusive_unblock = int(line[base + 18 * stride])
                        #     prepush_ack = int(line[base + 20 * stride])
                        #     # enable_prepush = int(line[base + 9 * stride])
                        #     # disable_prepush = int(line[base + 10 * stride])
                        # else:
                        #     gets = int(line[base + 2 * stride])
                        #     putx = int(line[base + 5 * stride])
                        #     data = int(line[base + 10 * stride])
                        #     data_exclusive = int(line[base + 11 * stride])
                        #     mem_data = int(line[base + 12 * stride])
                        #     unblock = int(line[base + 15 * stride])
                        #     exclusive_unblock = int(line[base + 16 * stride])
                        #     prepush_ack = int(line[base + 18 * stride])
                        gets = int(line[base + message_index["GETS"] * stride])
                        putx = int(line[base + message_index["PUTX"] * stride])
                        data = int(line[base + message_index["DATA"] * stride])
                        data_exclusive = int(line[base + message_index["DATA_EXCLUSIVE"] * stride])
                        if (hasconfig == 1):
                            config = int(line[base + message_index["Config_Req"] * stride]) + int(line[base + message_index["Config_Ack"] * stride])
                        else:
                            config = 0
                        mem_data = int(line[base + message_index["MEMORY_DATA"] * stride])
                        unblock = int(line[base + message_index["UNBLOCK"] * stride])
                        exclusive_unblock = int(line[base + message_index["EXCLUSIVE_UNBLOCK"] * stride])
                        prepush_ack = int(line[base + message_index["PREPUSH_ACK"] * stride])
                    elif "int_link_utilization_breakdown::total" in line:
                        line = line.split()
                        int_link_utilization = int(line[1])
                        # print("int_link_utilization = " + str(int_link_utilization))
                    elif "End Simulation Statistics" in line:
                        break

                if file_empty:
                    print(f"Warn: {filename} is empty.")

                others = int_link_utilization - gets - putx - data \
                        - data_exclusive - unblock - exclusive_unblock \
                        -mem_data - prepush_ack
                        # -mem_data - prepush_ack - enable_prepush - disable_prepush
                results["traffic"][benchmark][scheme] = int_link_utilization

                l2_inject_read_request = l2_inject_gets
                l2_inject_prepushack = l2_inject_prepush_ack + \
                        l2_inject_prepush_nack
                if (l2_inject_prepushack != 0):
                    print( benchmark + "  " + scheme)
                
                l2_inject_wb_data = l2_inject_putx
                l2_inject_others = l2_inject_getx + l2_inject_upgrade + \
                        l2_inject_get_instr + l2_inject_ack + \
                        l2_inject_unblock + l2_inject_xunblock

                l2_eject_shared_data = l2_eject_data
                l2_eject_exclusive_data = l2_eject_xdata
                l2_eject_others = l2_eject_inv + l2_eject_wb_ack

                llc_inject_shared_data = llc_inject_data
                llc_inject_exclusive_data = llc_inject_xdata
                llc_inject_others = llc_inject_inv + llc_inject_wb_ack

                llc_eject_read_request = llc_eject_gets
                llc_eject_prepushack = llc_eject_prepush_ack + \
                        llc_eject_prepush_nack
                llc_eject_wb_data = llc_eject_putx
                llc_eject_others = llc_eject_getx + llc_eject_upgrade + \
                        llc_eject_get_instr + llc_eject_ack + \
                        llc_eject_unblock + llc_eject_xunblock

                if s == 0: # baseline
                    baseline_total_traffic = int_link_utilization

                    baseline_inject_flits = inject_flits
                    baseline_inject_ctrl_flits = inject_ctrl_flits
                    baseline_inject_data_flits = inject_data_flits

                    baseline_eject_flits = eject_flits
                    baseline_eject_ctrl_flits = eject_ctrl_flits
                    baseline_eject_data_flits = eject_data_flits

                    baseline_total_l2_inject_traffic = l2_inject_read_request + \
                            l2_inject_prepushack + l2_inject_wb_data + \
                            l2_inject_others
                    baseline_total_l2_eject_traffic = l2_eject_shared_data + \
                            l2_eject_exclusive_data + l2_eject_others
                    baseline_total_llc_inject_traffic = llc_inject_data + \
                            llc_inject_exclusive_data + llc_inject_others
                    baseline_total_llc_eject_traffic = llc_eject_read_request + \
                            llc_eject_prepushack + llc_eject_wb_data + \
                            llc_eject_others

                    if baseline_total_traffic == 0:
                        baseline_total_traffic = 1
                        baseline_inject_flits = 1
                        baseline_inject_ctrl_flits = 1
                        baseline_inject_data_flits = 1
                        baseline_eject_flits = 1
                        baseline_eject_ctrl_flits = 1
                        baseline_eject_data_flits = 1

                        baseline_total_l2_inject_traffic = 1
                        baseline_total_eject_traffic = 1
                        baseline_total_llc_inject_traffic = 1
                        baseline_total_llc_eject_traffic = 1


                excel_line += f"{scheme},{data},{prepush_ack},{gets},{data_exclusive},{putx},{unblock},{exclusive_unblock},{mem_data},{others}"
                # excel_line += f"{scheme},{data},{prepush_ack},{gets},{data_exclusive},{putx},{unblock},{exclusive_unblock},{mem_data},{enable_prepush},{disable_prepush},{others}"
                if args.print_csv:
                    print(excel_line)

                results["traffic-breakdown"][0][b*num_schemes+s] = data
                results["traffic-breakdown"][1][b*num_schemes+s] = gets
                results["traffic-breakdown"][2][b*num_schemes+s] = data_exclusive
                results["traffic-breakdown"][3][b*num_schemes+s] = putx
                results["traffic-breakdown"][4][b*num_schemes+s] = unblock
                results["traffic-breakdown"][5][b*num_schemes+s] = exclusive_unblock
                results["traffic-breakdown"][6][b*num_schemes+s] = mem_data
                results["traffic-breakdown"][7][b*num_schemes+s] = others

                results["concise-traffic-breakdown"][0][b*num_schemes+s] = data
                results["concise-traffic-breakdown"][1][b*num_schemes+s] = gets
                results["concise-traffic-breakdown"][2][b*num_schemes+s] = data_exclusive
                results["concise-traffic-breakdown"][3][b*num_schemes+s] = putx
                concise_others = unblock + exclusive_unblock + mem_data + others
                results["concise-traffic-breakdown"][4][b*num_schemes+s] = concise_others

                results["concise-normalized-traffic-breakdown"][0][b*num_schemes+s] = \
                        data / baseline_total_traffic
                results["concise-normalized-traffic-breakdown"][1][b*num_schemes+s] = \
                        gets / baseline_total_traffic
                results["concise-normalized-traffic-breakdown"][2][b*num_schemes+s] = \
                        data_exclusive / baseline_total_traffic
                results["concise-normalized-traffic-breakdown"][3][b*num_schemes+s] = \
                        putx / baseline_total_traffic
                # results["concise-normalized-traffic-breakdown"][4][b*num_schemes+s] = \
                #         config / baseline_total_traffic
                results["concise-normalized-traffic-breakdown"][4][b*num_schemes+s] = \
                        concise_others / baseline_total_traffic

                results["normalized-l2-inject-traffic-breakdown"][0][b*num_schemes+s] = \
                        l2_inject_read_request / baseline_total_l2_inject_traffic
                results["normalized-l2-inject-traffic-breakdown"][1][b*num_schemes+s] = \
                        l2_inject_wb_data / baseline_total_l2_inject_traffic
                results["normalized-l2-inject-traffic-breakdown"][2][b*num_schemes+s] = \
                        l2_inject_others / baseline_total_l2_inject_traffic

                results["normalized-l2-eject-traffic-breakdown"][0][b*num_schemes+s] = \
                        l2_eject_shared_data / baseline_total_l2_eject_traffic
                results["normalized-l2-eject-traffic-breakdown"][1][b*num_schemes+s] = \
                        l2_eject_exclusive_data / baseline_total_l2_eject_traffic
                results["normalized-l2-eject-traffic-breakdown"][2][b*num_schemes+s] = \
                        l2_eject_others / baseline_total_l2_eject_traffic

                results["neg-normalized-l2-eject-traffic-breakdown"][0][b*num_schemes+s] = \
                        - (l2_eject_shared_data / baseline_total_l2_eject_traffic)
                results["neg-normalized-l2-eject-traffic-breakdown"][1][b*num_schemes+s] = \
                        - (l2_eject_exclusive_data / baseline_total_l2_eject_traffic)
                results["neg-normalized-l2-eject-traffic-breakdown"][2][b*num_schemes+s] = \
                        - (l2_eject_others / baseline_total_l2_eject_traffic)

                results["normalized-llc-inject-traffic-breakdown"][0][b*num_schemes+s] = \
                        llc_inject_shared_data / baseline_total_llc_inject_traffic
                results["normalized-llc-inject-traffic-breakdown"][1][b*num_schemes+s] = \
                        llc_inject_exclusive_data / baseline_total_llc_inject_traffic
                results["normalized-llc-inject-traffic-breakdown"][2][b*num_schemes+s] = \
                        llc_inject_others / baseline_total_llc_inject_traffic

                results["normalized-llc-eject-traffic-breakdown"][0][b*num_schemes+s] = \
                        llc_eject_read_request / baseline_total_llc_eject_traffic
                results["normalized-llc-eject-traffic-breakdown"][1][b*num_schemes+s] = \
                        llc_eject_wb_data / baseline_total_llc_eject_traffic
                results["normalized-llc-eject-traffic-breakdown"][2][b*num_schemes+s] = \
                        llc_eject_others / baseline_total_llc_eject_traffic

                results["neg-normalized-llc-eject-traffic-breakdown"][0][b*num_schemes+s] = \
                        - (llc_eject_read_request / baseline_total_llc_eject_traffic)
                results["neg-normalized-llc-eject-traffic-breakdown"][1][b*num_schemes+s] = \
                        - (llc_eject_wb_data / baseline_total_llc_eject_traffic)
                results["neg-normalized-llc-eject-traffic-breakdown"][2][b*num_schemes+s] = \
                        - (llc_eject_others / baseline_total_llc_eject_traffic)
                
                results["integrate-normalized-llc-in-eject-traffic-breakdown"][0][b*num_schemes+s] = \
                        llc_inject_shared_data / (baseline_total_llc_eject_traffic + baseline_total_llc_inject_traffic)
                results["integrate-normalized-llc-in-eject-traffic-breakdown"][1][b*num_schemes+s] = \
                        llc_inject_exclusive_data / (baseline_total_llc_eject_traffic + baseline_total_llc_inject_traffic)
                results["integrate-normalized-llc-in-eject-traffic-breakdown"][2][b*num_schemes+s] = \
                        llc_eject_read_request / (baseline_total_llc_eject_traffic + baseline_total_llc_inject_traffic)
                results["integrate-normalized-llc-in-eject-traffic-breakdown"][3][b*num_schemes+s] = \
                        llc_eject_wb_data / (baseline_total_llc_eject_traffic + baseline_total_llc_inject_traffic)
                results["integrate-normalized-llc-in-eject-traffic-breakdown"][4][b*num_schemes+s] = \
                        (llc_inject_others + llc_eject_others) / (baseline_total_llc_eject_traffic + baseline_total_llc_inject_traffic)

                if scheme == "baseline-software-prefetch":
                    results["concise-baseline-traffic-breakdown"][0][b] = data
                    results["concise-baseline-traffic-breakdown"][1][b] = gets
                    results["concise-baseline-traffic-breakdown"][2][b] = data_exclusive
                    results["concise-baseline-traffic-breakdown"][3][b] = putx
                    concise_others = unblock + exclusive_unblock + mem_data + others
                    results["concise-baseline-traffic-breakdown"][4][b] = concise_others

                    results["concise-baseline-normalized-traffic-breakdown"][0][b] = \
                            data / baseline_total_traffic
                    results["concise-baseline-normalized-traffic-breakdown"][1][b] = \
                            gets / baseline_total_traffic
                    results["concise-baseline-normalized-traffic-breakdown"][2][b] = \
                            data_exclusive / baseline_total_traffic
                    results["concise-baseline-normalized-traffic-breakdown"][3][b] = \
                            putx / baseline_total_traffic
                    results["concise-baseline-normalized-traffic-breakdown"][4][b] = \
                            concise_others / baseline_total_traffic

                results["normalized-traffic-breakdown"][0][b*num_schemes+s] = \
                        data / baseline_total_traffic
                results["normalized-traffic-breakdown"][1][b*num_schemes+s] = \
                        gets / baseline_total_traffic
                results["normalized-traffic-breakdown"][2][b*num_schemes+s] = \
                        data_exclusive / baseline_total_traffic
                results["normalized-traffic-breakdown"][3][b*num_schemes+s] = \
                        putx / baseline_total_traffic
                results["normalized-traffic-breakdown"][4][b*num_schemes+s] = \
                        unblock / baseline_total_traffic
                results["normalized-traffic-breakdown"][5][b*num_schemes+s] = \
                        exclusive_unblock / baseline_total_traffic
                results["normalized-traffic-breakdown"][6][b*num_schemes+s] = \
                        mem_data / baseline_total_traffic
                # results["normalized-traffic-breakdown"][8][b*num_schemes+s] = \
                #         enable_prepush / baseline_total_traffic
                # results["normalized-traffic-breakdown"][9][b*num_schemes+s] = \
                #         disable_prepush / baseline_total_traffic
                results["normalized-traffic-breakdown"][7][b*num_schemes+s] = \
                        others / baseline_total_traffic

                # network traffic loads
                results["inject-traffic"][s][b] = inject_flits / 1e6
                results["inject-ctrl-traffic"][s][b] = inject_ctrl_flits / 1e6
                results["inject-data-traffic"][s][b] = inject_data_flits / 1e6
                results["eject-traffic"][s][b] = eject_flits / 1e6
                results["eject-ctrl-traffic"][s][b] = eject_ctrl_flits / 1e6
                results["eject-data-traffic"][s][b] = eject_data_flits / 1e6
                results["network-traffic"][s][b] = int_link_utilization / 1e6

                results["normalized-inject-traffic"][s][b] = \
                        inject_flits / baseline_inject_flits
                results["normalized-inject-ctrl-traffic"][s][b] = \
                        inject_ctrl_flits / baseline_inject_ctrl_flits
                results["normalized-inject-data-traffic"][s][b] = \
                        inject_data_flits / baseline_inject_data_flits
                results["normalized-eject-traffic"][s][b] = \
                        eject_flits / baseline_eject_flits
                results["normalized-eject-ctrl-traffic"][s][b] = \
                        eject_ctrl_flits / baseline_eject_ctrl_flits
                results["normalized-eject-data-traffic"][s][b] = \
                        eject_data_flits / baseline_eject_data_flits
                results["normalized-network-traffic"][s][b] = \
                        int_link_utilization / baseline_total_traffic

                if args.print_csv:
                    print(f"normalized-traffic,{benchmark},{scheme},{results['normalized-inject-traffic'][s][b]},{results['normalized-eject-traffic'][s][b]},{results['normalized-network-traffic'][s][b]}")

                results["inject-load"][s][b] = \
                        inject_flits * cpu_ticks_per_cycle / sim_ticks
                results["inject-ctrl-load"][s][b] = \
                        inject_ctrl_flits * cpu_ticks_per_cycle / sim_ticks
                results["inject-data-load"][s][b] = \
                        inject_data_flits * cpu_ticks_per_cycle / sim_ticks
                results["eject-load"][s][b] = \
                        eject_flits * cpu_ticks_per_cycle / sim_ticks
                results["eject-ctrl-load"][s][b] = \
                        eject_ctrl_flits * cpu_ticks_per_cycle / sim_ticks
                results["eject-data-load"][s][b] = \
                        eject_data_flits * cpu_ticks_per_cycle / sim_ticks
                results["network-load"][s][b] = \
                        int_link_utilization * cpu_ticks_per_cycle / sim_ticks

                if benchmark == args.benchmark and args.print_csv:
                    print(f"{scheme}:\n"
                          f"   - inject load {results['inject-load'][s][b]}\n"
                          f"   - nework load {results['network-load'][s][b]}\n"
                          f"   -  eject load {results['eject-load'][s][b]}\n"
                          f"   - inject ctrl load {results['inject-ctrl-load'][s][b]}\n"
                          f"   - inject data load {results['inject-data-load'][s][b]}\n"
                          f"   -  eject ctrl load {results['eject-ctrl-load'][s][b]}\n"
                          f"   -  eject data load {results['eject-data-load'][s][b]}\n")

                statsfile.close()

    return results

def process_paper_runtime_link_widths(args):
    num_cores = len(args.num_cpus)
    num_link_widths = len(args.link_widths)
    num_benchmarks = len(args.benchmark_list)
    if num_benchmarks == 1:
        enable_gmean = 0
    else:
        enable_gmean = 1

    results = {"runtime-link-widths": {},
            "normalized-runtime-link-widths": {},
            "speedup-link-widths": {}}
    for n, ncpu in enumerate(args.num_cpus): 
        results["runtime-link-widths"][n] = {}
        results["normalized-runtime-link-widths"][n] = {}
        results["speedup-link-widths"][n] = {}
        for s, scheme in enumerate(args.scheme_list):
            results["runtime-link-widths"][n][scheme] = {}
            results["normalized-runtime-link-widths"][n][scheme] = np.zeros(
                    (num_link_widths, num_benchmarks), dtype=np.float64)
            results["speedup-link-widths"][n][scheme] = np.zeros(
                    (num_link_widths, (num_benchmarks+enable_gmean)), dtype=np.float64)

            for b, benchmark in enumerate(args.benchmark_list):
                results["runtime-link-widths"][n][scheme][benchmark] = {}
                for l, link_width in enumerate(args.link_widths):
                        results["runtime-link-widths"][n][scheme][benchmark][link_width] = 0

    for n, ncpu in enumerate(args.num_cpus): 
        for b, benchmark in enumerate(args.benchmark_list):

            baseline_runtime = None

            for s, scheme in enumerate(args.scheme_list):
                for l, link_width in enumerate(args.link_widths):
                    directory = f"{args.m5out_dir}/link-{link_width}bits/{scheme}/{benchmark}-{ncpu}cpus"
                    filename = f"{directory}/stats.txt"

                    sim_seconds = 0
                    with open(filename, "r") as statsfile:
                        for line in statsfile:
                            if "sim_seconds" in line:
                                line = line.split()
                                sim_seconds = float(line[1])
                                break
                            else:
                                continue

                        if l == 0 and s == 0:
                            baseline_runtime = sim_seconds
                            if sim_seconds == 0:
                                print(f"Warn: {filename} may be empty witout stats")
                                baseline_runtime = 1

                        results["runtime-link-widths"][n][scheme][benchmark][link_width] = sim_seconds
                        results["normalized-runtime-link-widths"][n][scheme][l][b] = \
                                sim_seconds / results["runtime-link-widths"][n]["baseline-software-prefetch"][benchmark][link_width]
                        if sim_seconds == 0:
                            results["speedup-link-widths"][n][scheme][l][b] = 0
                        else:
                            results["speedup-link-widths"][n][scheme][l][b] = \
                                    results["runtime-link-widths"][n]["baseline-software-prefetch"][benchmark][link_width] / sim_seconds

                        statsfile.close()

    for n, ncpu in enumerate(args.num_cpus):
        for s, scheme in enumerate(args.scheme_list):
            if num_benchmarks > 1:
                for l, link_widths in enumerate(args.link_widths):
                    results["speedup-link-widths"][n][scheme][l][-1] = \
                            stats.mstats.gmean(results["speedup-link-widths"][n][scheme][l][0:-1])

    return results

def process_filter_distribution(args):

    key = f"{args.prepush_scheme}-filter-distribution"
    results = {key: {}}

    for b, benchmark in enumerate(args.benchmark_list):
        results[key][benchmark] = {}
        results[key][benchmark]["Core-NI"] = 0
        results[key][benchmark]["Core-Cache"] = 0
        results[key][benchmark]["LLC-NI"] = 0
        results[key][benchmark]["LLC"] = 0
        results[key][benchmark]["Network"] = 0

        filename = f"{args.m5out_dir}/{args.prepush_scheme}/{benchmark}-{args.ncpu}cpus/stats.txt"

        total = 0
        with open(filename, "r") as statsfile:
            for line in statsfile:
                if "core_ni_prepush_filter_activity" in line:
                    line = line.split()
                    results[key][benchmark]["Core-NI"] = int(line[1])
                    total += int(line[1])
                elif "core_prepush_filter_activity" in line:
                    line = line.split()
                    results[key][benchmark]["Core-Cache"] = int(line[1])
                    total += int(line[1])
                elif "llc_ni_prepush_filter_activity" in line:
                    line = line.split()
                    results[key][benchmark]["LLC-NI"] = int(line[1])
                    total += int(line[1])
                elif "llc_prepush_filter_activity" in line:
                    line = line.split()
                    results[key][benchmark]["LLC"] = int(line[1])
                    total += int(line[1])
                elif "router_prepush_filter_activity" in line:
                    line = line.split()
                    results[key][benchmark]["Network"] = int(line[1])
                    total += int(line[1])
                    break
                elif "End Simulation Statistics" in line:
                    break

        results[key][benchmark]["total"] = total

    return results

def write_invalidation(args):
    print(f"processing write invalidation")
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)

    results = {f"writeinvalidation-interval": {}}
    results[f"normalized-writeinvalidation-interval"] = np.zeros(
        (num_schemes, num_benchmarks), dtype=np.float64)
    
    for b, benchmark in enumerate(args.benchmark_list):
        results[f"writeinvalidation-interval"][benchmark] = {}

        baseline_writeinvalidation_interval = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            writeinvalidation_interval = 0

            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "system.ruby.L1Cache.average_tick_in_write_invalidation" in line:
                        line = line.split()
                        writeinvalidation_interval = float(line[1])
                        # print(f"Find stats!!")
                        break
                    else:
                        continue

                if s == 0:
                    baseline_writeinvalidation_interval = writeinvalidation_interval
                    if writeinvalidation_interval == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        baseline_writeinvalidation_interval = 1

                results[f"writeinvalidation-interval"][benchmark][scheme] = writeinvalidation_interval
                results[f"normalized-writeinvalidation-interval"][s][b] = \
                        writeinvalidation_interval / baseline_writeinvalidation_interval

                statsfile.close()

    if args.print_csv:
        print(f"writeinvalidation interval:")
        key = f"writeinvalidation-interval"
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results[key][benchmark][scheme]},"

            print(line)

        print(f"normalized writeinvalidation interval:")
        key = f"normalized-writeinvalidation-interval"
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{1.0 / results[key][s][b]},"

            print(line)
    
    print(f"End processing write invalidation")

    return results

def process_load(args):
    print(f"processing load")
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)

    results = {f"load-interval": {}}
    results[f"normalized-load-interval"] = np.zeros(
        (num_schemes, num_benchmarks), dtype=np.float64)
    
    for b, benchmark in enumerate(args.benchmark_list):
        results[f"load-interval"][benchmark] = {}

        baseline_load_interval = None
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            load_interval = 0

            with open(filename, "r") as statsfile:
                for line in statsfile:
                    if "system.ruby.L1Cache.average_tick_in_load" in line:
                        line = line.split()
                        load_interval = float(line[1])
                        # print(f"Find stats!!")
                        break
                    else:
                        continue

                if s == 0:
                    baseline_load_interval = load_interval
                    if load_interval == 0:
                        print(f"Warn: {filename} may be empty witout stats")
                        baseline_load_interval = 1

                results[f"load-interval"][benchmark][scheme] = load_interval
                results[f"normalized-load-interval"][s][b] = \
                        load_interval / baseline_load_interval

                statsfile.close()

    if args.print_csv:
        print(f"load interval:")
        key = f"load-interval"
        for benchmark in args.benchmark_list:
            line = f"{benchmark},"
            for scheme in args.scheme_list:
                line += f"{results[key][benchmark][scheme]},"

            print(line)

        print(f"normalized load interval:")
        key = f"normalized-load-interval"
        for b, benchmark in enumerate(args.benchmark_list):
            line = f"{benchmark},"
            for s, scheme in enumerate(args.scheme_list):
                line += f"{1.0 / results[key][s][b]},"

            print(line)
    
    print(f"End processing load")

    return results

def process_prepush(args):

    key = f"{args.prepush_scheme}-prepushes"
    results = {key: {}}

    for b, benchmark in enumerate(args.benchmark_list):
        results[key][benchmark] = {}
        results[key][benchmark]["total"] = 0
        results[key][benchmark]["demand"] = 0
        results[key][benchmark]["prepushed-entries"] = 0
        results[key][benchmark]["used"] = 0
        results[key][benchmark]["unused"] = 0
        results[key][benchmark]["coherence-drop"] = 0
        results[key][benchmark]["redundancy-drop"] = 0
        results[key][benchmark]["deadlock-drop"] = 0

        total = 0
        demand = 0
        prepushed_cache_entries = 0
        used = 0
        unused = 0
        coherence_drop = 0
        redundancy_drop = 0
        deadlock_drop = 0

        filename = f"{args.m5out_dir}/{args.prepush_scheme}/{benchmark}-{args.ncpu}cpus/stats.txt"

        with open(filename, "r") as statsfile:
            for line in statsfile:
                if "total_early_prepushed_demand_cache_entries" in line:
                    line = line.split()
                    demand = int(line[1])
                elif "total_prepushed_cache_entries" in line:
                    line = line.split()
                    prepushed_cache_entries = int(line[1])
                elif "total_prepushes_dropped_for_coherence" in line:
                    line = line.split()
                    coherence_drop = int(line[1])
                elif "total_prepushes_dropped_for_deadlock" in line:
                    line = line.split()
                    deadlock_drop = int(line[1])
                elif "total_prepushes_dropped_for_redundancy " in line:
                    line = line.split()
                    redundancy_drop = int(line[1])
                # TODO: break redundancy in to cache and perpush buffer
                elif "total_prepushes_received" in line:
                    line = line.split()
                    total = int(line[1])
                elif "total_touched_prepushed_cache_entries" in line:
                    line = line.split()
                    used = int(line[1])
                    unused = prepushed_cache_entries - used
                    break
                elif "End Simulation Statistics" in line:
                    break

            if used == 0:
                unused = prepushed_cache_entries

            statsfile.close()
        # if total != demand + used + unused + coherence_drop + redundancy_drop + deadlock_drop:
        #     print(f"{benchmark}: total {total}, demand {demand}, used {used}, "
        #           f"unused {unused}, coherence-drop {coherence_drop}, "
        #           f"redundancy-drop {redundancy_drop} deadlock-drop {deadlock_drop}")
        #     assert "Error: prepush accuracy process error" == 0

        results[key][benchmark]["total"] = total
        results[key][benchmark]["demand"] = demand
        results[key][benchmark]["prepushed-entries"] = prepushed_cache_entries
        results[key][benchmark]["used"] = used
        results[key][benchmark]["unused"] = unused
        results[key][benchmark]["coherence-drop"] = coherence_drop
        results[key][benchmark]["redundancy-drop"] = redundancy_drop
        results[key][benchmark]["deadlock-drop"] = deadlock_drop

    return results

def process_software_wait(args):

    key = f"{args.software_prepush_scheme}-waits"
    results = {key: {}}

    for b, benchmark in enumerate(args.benchmark_list):
        results[key][benchmark] = {}
        results[key][benchmark]["total"] = 0
        results[key][benchmark]["timeout"] = 0
        results[key][benchmark]["guest_to_host"] = 0
        results[key][benchmark]["hit"] = 0

        total = 0
        timeout = 0
        guest_to_host = 0
        hit = 0

        filename = f"{args.m5out_dir}/{args.software_prepush_scheme}/{benchmark}-{args.ncpu}cpus/stats.txt"
        print(filename)

        with open(filename, "r") as statsfile:
            for line in statsfile:
                if "total_register_waitlist" in line:
                    line = line.split()
                    total = int(line[1])
                elif "total_guest_to_host_request" in line:
                    line = line.split()
                    guest_to_host = int(line[1])
                elif "total_guest_timeout" in line:
                    line = line.split()
                    timeout = int(line[1])
                elif "End Simulation Statistics" in line:
                    break

            statsfile.close()
        # if total != demand + used + unused + coherence_drop + redundancy_drop + deadlock_drop:
        #     print(f"{benchmark}: total {total}, demand {demand}, used {used}, "
        #           f"unused {unused}, coherence-drop {coherence_drop}, "
        #           f"redundancy-drop {redundancy_drop} deadlock-drop {deadlock_drop}")
        #     assert "Error: prepush accuracy process error" == 0

        results[key][benchmark]["total"] = total
        results[key][benchmark]["timeout"] = timeout
        results[key][benchmark]["guest_to_host"] = guest_to_host
        results[key][benchmark]["hit"] = total - timeout - guest_to_host

    return results


def process_misses(args):
    results = {}

    # miss rates
    num_schemes = len(args.scheme_list)
    num_benchmarks = len(args.benchmark_list)

    results["instructions"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["demand-accesses"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["demand-hits"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["demand-misses"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["miss-rate"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["miss-rate-change"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["miss-rate-mpki"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["miss-rate-mpki-l0"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)
    results["normalized-miss-rate-mpki"] = np.zeros(
            (num_schemes, num_benchmarks), dtype=np.float64)

    for b, benchmark in enumerate(args.benchmark_list):

        baseline_miss_rate = 0
        for s, scheme in enumerate(args.scheme_list):
            directory = f"{args.m5out_dir}/{scheme}/{benchmark}-{args.ncpu}cpus"
            filename = f"{directory}/stats.txt"

            demand_accesses = 0
            demand_hits = 0
            demand_misses = 0
            demand_misses_l0 = 0

            total_insts = 0

            file_empty = True
            with open(filename, "r") as statsfile:
                for line in statsfile:
                    file_empty = False
                    if "l0_cntrl" in line and "cache.demand_misses" in line:
                        line = line.split()
                        demand_misses_l0 += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_accesses" in line:
                        line = line.split()
                        demand_accesses += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_hits" in line:
                        line = line.split()
                        demand_hits += int(line[1])
                    elif "l1_cntrl" in line and "cache.demand_misses" in line:
                        line = line.split()
                        demand_misses += int(line[1])
                    elif "sim_insts" in line:
                        line = line.split()
                        total_insts += int(line[1])
                    elif "End Simulation Statistics" in line:
                        break

                statsfile.close()

            assert demand_accesses == demand_hits + demand_misses

            if file_empty:
                assert demand_accesses == 0
                demand_accesses = 1 # for divided by zero error

            miss_rate = demand_misses * 100 / demand_accesses
            if s == 0:
                baseline_miss_rate = miss_rate

            results["demand-accesses"][s][b] = demand_accesses
            results["demand-hits"][s][b] = demand_hits
            results["demand-misses"][s][b] = demand_misses
            results["miss-rate"][s][b] = miss_rate
            results["miss-rate-change"][s][b] = miss_rate - baseline_miss_rate
            if (total_insts != 0):
                results["miss-rate-mpki"][s][b] = demand_misses * 1000 / total_insts
                results["miss-rate-mpki-l0"][s][b] = demand_misses_l0 * 1000 / total_insts
            else:
                results["miss-rate-mpki"][s][b] = 0
                results["miss-rate-mpki-l0"][s][b] = 0

    for b, benchmark in enumerate(args.benchmark_list):
        for s, scheme in enumerate(args.scheme_list):
            results["normalized-miss-rate-mpki"][s][b] = results["miss-rate-mpki"][s][b] / results["miss-rate-mpki"][s][0]

    return results

def plot_motivation(args, results):
    # colors = ['#386cb0', \
    #           '#fdc086', \
    #           '#f0027f', '#7fc97f', '#bf5b17', '#beaed4', \
    #           '#7fc97f', '#666666', '#ffff99']
    colors = ['#8ECFC9', \
              '#FFBE7A', \
              '#FA7F6F', '#82b0d2', '#b9faf8', '#beaed4', \
              '#7fc97f', '#666666', '#ffff99']
    bar_width = 1.2

    num_cores = len(args.num_cpus)
    num_benchmarks = len(args.benchmark_list)
    num_links = len(args.link_widths)
    link_names = []
    for i in range(num_links):
        link_name = str(args.link_widths[i]) + "-bits"
        link_names.append(link_name) 

    group_names = []
    cpu_names = []
    xticks = []
    for n, ncpu in enumerate(args.num_cpus):
        if n == 0:
            data = results["access_latency"][n][:][:]
            base = 0
        else:
            data = np.concatenate((data, results["access_latency"][n][:][:]),
                    axis=1)
            base = len(xticks) + 3.1
            # base = len(xticks) + 1

        for i in np.arange(num_benchmarks):
            xticks.append(base + 1.4*i)
            # xticks.append(base + i)

        if ncpu == 16:
            cpu_names.append(f"{ncpu} cores with 4$\\times$4 mesh")
        elif ncpu == 64:
            cpu_names.append(f"{ncpu} cores with 8$\\times$8 mesh")
        else:
            cpu_names.append(f"{ncpu} cores")
        print(args.benchmark_names)
        group_names += args.benchmark_names
        print(group_names)
        print(args.link_widths)

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)
    print(data)

    figname = f"{args.fig_dir}/motivation_access_latency.pdf"
    #figsize = (12, 5)
    figsize = (10, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.link_widths,
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False,
            width=bar_width)
    fig.autofmt_xdate()

    # ax.set_ylim(0, 2)
    ax.set_yticks(np.arange(0, 400, 50))
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Average Load Latency (Cycles)")
    ax.yaxis.set_label_coords(-0.08, 0.33)

    ax.legend(
            hdls,
            link_names,
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.495, 1.23),
            # ncol=np.ceil((num_links + 1) / 2),
            ncol=num_links,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6)

    fig.subplots_adjust(bottom=0.28, top=0.8)

    ly = num_cores
    scale = 1. / ly
    ypos = -.5
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_runtime(args, results):
    colors = ['#8ECFC9', \
              '#FFBE7A', \
              '#FA7F6F', '#82b0d2', '#b9faf8', '#beaed4', \
              '#7fc97f', '#666666', '#ffff99', "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]
    bar_width = 1.35

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names)

    # normalized runtime
    data = [list(i) for i in zip(*results["normalized-runtime"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-runtime.pdf"
    if num_benchmarks == 1:
        figsize = (8, 5)
    else:
        figsize = (8, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Runtime")

    if num_benchmarks == 1:
        add_label(ax, len(args.scheme_names),
                results["normalized-runtime"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # sppedup with baseline
    data = [list(i) for i in zip(*results["speedup"])]
    data = np.array(data, dtype=np.float64)
    print(data)
    data_fig = np.zeros(
            (data.shape[0], data.shape[1]), dtype=np.float64)
    print(data_fig)
    for i in range(len(data)):
        data_fig[i] = data[i]
    print(data_fig)

    figname = f"{args.fig_dir}/speedup-with-baseline.pdf"
    if num_benchmarks == 1:
        figsize = (10, 8)
    else:
        figsize = (10, 6)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    if num_benchmarks == 1:
        hdls = barchart.draw(
                ax,
                data_fig,
                group_names=args.benchmark_names,
                entry_names=args.scheme_names,
                colors=colors,
                breakdown=False)
        add_label(ax, num_schemes, results["speedup"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.15, right=0.55)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        hdls = barchart.draw(
                ax,
                data_fig,
                group_names=args.benchmark_names + ["gmean"],
                entry_names=args.scheme_names,
                colors=colors,
                breakdown=False)
        fig.autofmt_xdate()

        # newbar = {}
        # newbar[0] = hdls[0]
        # newbar[1] = hdls[2]
        # newbar[2] = hdls[1]
        # newbar[3] = hdls[3]
        # newbar[4] = hdls[4]

        # legend1 = plt.legend(handles=[hdls[0],hdls[1]],
        #                     labels=args.scheme_names[1:3],
        #                     ncol=2,
        #                     bbox_to_anchor=(-0.12, 1.40),
        #                     loc="upper left",
        #                     frameon=False,
        #                     handletextpad=0.2,
        #                     columnspacing=0.6,
        #                     labelspacing=0.1, fontsize=24)
        # legend2 = plt.legend(handles=[hdls[2],hdls[3],hdls[4]],
        #                     labels=args.scheme_names[3:],
        #                     ncol=3, 
        #                     bbox_to_anchor=(-0.12, 1.28),
        #                     loc="upper left",
        #                     frameon=False,
        #                     handletextpad=0.2,
        #                     columnspacing=0.6,
        #                     labelspacing=0.1, fontsize=24)
        # ax.add_artist(legend1)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.47, 1.33),
                # ncol=len(args.scheme_list)/2,
                ncol=5,
                frameon=False,
                handletextpad=0.1,
                columnspacing=0.4,
                labelspacing=0.1)

    ax.yaxis.grid(True, linestyle="--") 
    y_range = [0,0.5,1,1.5,2,2.5,3]
    ax.set_yticks(y_range,y_range)
    ax.set_ylabel("Speedup over Baseline")
    fig.subplots_adjust(bottom=0.45, top=0.8)
    ax.yaxis.set_label_coords(-0.12, 0.5)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    # sppedup
    data = [list(i) for i in zip(*results["speedup"])]
    data = np.array(data, dtype=np.float64)
    print(data)
    data_fig = np.zeros(
            (data.shape[0], data.shape[1]-1), dtype=np.float64)
    print(data_fig)
    for i in range(len(data)):
        data_fig[i] = data[i][1:]
    print(data_fig)

    figname = f"{args.fig_dir}/speedup.pdf"
    if num_benchmarks == 1:
        figsize = (10, 8)
    else:
        figsize = (10, 6)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    if num_benchmarks == 1:
        hdls = barchart.draw(
                ax,
                data_fig,
                group_names=args.benchmark_names,
                entry_names=args.scheme_names[1:],
                colors=colors,
                breakdown=False)
        add_label(ax, num_schemes, results["speedup"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.15, right=0.55)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        hdls = barchart.draw(
                ax,
                data_fig,
                group_names=args.benchmark_names + ["gmean"],
                entry_names=args.scheme_names[1:],
                colors=colors,
                breakdown=False)
        fig.autofmt_xdate()

        # newbar = {}
        # newbar[0] = hdls[0]
        # newbar[1] = hdls[2]
        # newbar[2] = hdls[1]
        # newbar[3] = hdls[3]
        # newbar[4] = hdls[4]

        # legend1 = plt.legend(handles=[hdls[0],hdls[1]],
        #                     labels=args.scheme_names[1:3],
        #                     ncol=2,
        #                     bbox_to_anchor=(-0.12, 1.40),
        #                     loc="upper left",
        #                     frameon=False,
        #                     handletextpad=0.2,
        #                     columnspacing=0.6,
        #                     labelspacing=0.1, fontsize=24)
        # legend2 = plt.legend(handles=[hdls[2],hdls[3],hdls[4]],
        #                     labels=args.scheme_names[3:],
        #                     ncol=3, 
        #                     bbox_to_anchor=(-0.12, 1.28),
        #                     loc="upper left",
        #                     frameon=False,
        #                     handletextpad=0.2,
        #                     columnspacing=0.6,
        #                     labelspacing=0.1, fontsize=24)
        # ax.add_artist(legend1)
        ax.legend(
                hdls,
                args.scheme_names[1:],
                loc="upper center",
                bbox_to_anchor=(0.47, 1.33),
                # ncol=len(args.scheme_list)/2,
                ncol=5,
                frameon=False,
                handletextpad=0.1,
                columnspacing=0.4,
                labelspacing=0.1)

    ax.yaxis.grid(True, linestyle="--") 
    y_range = [0,0.5,1,1.5]
    ax.set_yticks(y_range,y_range)
    ax.set_ylabel("Speedup over Baseline")
    fig.subplots_adjust(bottom=0.45, top=0.8)
    ax.yaxis.set_label_coords(-0.07, 0.3)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    # sppedup nobaseline
    # num_benchmarks = len(args.benchmark_list)
    # num_schemes = len(args.scheme_names[1:])

    # a = results["speedup"][1:]
    # b = np.zeros((num_schemes, (num_benchmarks)), dtype=np.float64)
    # for i in range(num_schemes):
    #     b[i] = a[i][:-1]
    # data = [list(i) for i in zip(*b)]
    # data = np.array(data, dtype=np.float64)

    # figname = f"{args.fig_dir}/speedup-overPrefetcher.pdf"
    # if num_benchmarks == 1:
    #     figsize = (20, 10)
    # else:
    #     figsize = (5.5, 8)
    # pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
    #         font=("family", "Tw Cen MT"))

    # ax = fig.gca()

    # if num_benchmarks == 1:
    #     hdls = barchart.draw(
    #             ax,
    #             data,
    #             group_names=args.benchmark_names,
    #             entry_names=args.scheme_names[1:],
    #             colors=colors,
    #             breakdown=False)
    #     add_label(ax, num_schemes, results["speedup"][4][0]) #[4][0]
    #     fig.subplots_adjust(left=0.15, right=0.55)
    #     ax.legend(
    #             hdls,
    #             args.scheme_names[1:],
    #             loc="right",
    #             bbox_to_anchor=(1.9, 0.5),
    #             ncol=1,
    #             frameon=False)
    # else:
    #     hdls = barchart.draw(
    #             ax,
    #             data,
    #             group_names=args.benchmark_names,
    #             entry_names=args.scheme_names[1:],
    #             colors=colors,
    #             breakdown=False)
    #     # fig.autofmt_xdate()
    #     ax.legend(
    #             hdls,
    #             args.scheme_names[1:],
    #             loc="upper center",
    #             bbox_to_anchor=(0.49, 1.35),
    #             ncol=len(args.scheme_list[1:])/2,
    #             # ncol=len(args.scheme_list[1:]),
    #             frameon=False,
    #             handletextpad=0.1,
    #             columnspacing=0.5)

    # ax.yaxis.grid(True, linestyle="--")
    # ax.set_ylabel("Speedup over L1Bingo-L2Stride", y=0.55)
    # fig.subplots_adjust(bottom=0.45, top=0.8, left=0.2)

    # if not args.disable_pdf:
    #     pdf.plot_teardown(pdfpage, fig)

    # if args.show:
    #     plt.show()

def plot_runtime_and_miss_for_all_cpus(args, results):
    colors = ['#8ECFC9', \
              '#FFBE7A', \
              '#82b0d2', \
              '#FA7F6F', '#BEB8DC', '#beaed4', \
              '#7fc97f', '#666666', '#ffff99']
    bar_width = 1.35

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names[:])
    len_num_cpus = len(args.num_cpus)
    assert len_num_cpus > 1

    group_names = []
    cpu_names = []
    xticks = []
    for n, ncpu in enumerate(args.num_cpus):
        if n == 0:
            data = results[f"{ncpu}cpus-speedup"][:][:]
            base = 0
        else:
            data = np.concatenate((data, results[f"{ncpu}cpus-speedup"][:][:]),
                    axis=1)
            base = len(xticks) + 1

        if len(args.benchmark_names) > 1:
            for i in np.arange(num_benchmarks + 1):
                xticks.append(base + i)
        else:
            for i in np.arange(num_benchmarks):
                xticks.append(base + i)

        if ncpu == 16:
            cpu_names.append(f"{ncpu} cores with 4$\\times$4 mesh")
        elif ncpu == 64:
            cpu_names.append(f"{ncpu} cores with 8$\\times$8 mesh")
        else:
            cpu_names.append(f"{ncpu} cores")
        print(args.benchmark_names)
        if len(args.benchmark_names) > 1:
            group_names += args.benchmark_names + ["gmean"]
        else:
            group_names += args.benchmark_names
        print("Group names list")
        print(group_names)
        print(args.scheme_names)

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)
    print("data list")
    print(data)

    figname = f"{args.fig_dir}/all-cpus-speedup-mpki-categories-nowarm.pdf"
    #figsize = (12, 5)
    figsize = (10, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.scheme_names[:],
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()

    y_range = [0.0,0.5,1.0,1.5,2.0]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup over PushMulticast")
    ax.yaxis.set_label_coords(-0.09, 0.3)

    # # miss rate
    # ax2 = ax.twinx() # secondary ax for miss rate

    # miss_rates = []
    # for n, ncpu in enumerate(args.num_cpus):
    #     for b, benchmark in enumerate(args.benchmark_list):
    #         miss_rates.append([])
    #         for s, scheme in enumerate(args.scheme_names[1:]):
    #             print(scheme)
    #             miss_rates[-1].append(results[f"{ncpu}cpus-mpki"][s][b])

    # miss_rates = np.array(miss_rates, dtype=np.float64)

    # ax2_xticks = []
    # width = 0.8
    # base = -width / 2.0 + width / num_schemes / 2.0
    # for i in np.arange(num_schemes):
    #     ax2_xticks.append(base + i * width / num_schemes)

    # # ax2.set_ylim(0, 120)
    # ax2.set_ylabel("Private L2 MPKI")
    # for n, ncpu in enumerate(args.num_cpus):
    #     for b in range(num_benchmarks):
    #         offset = (num_benchmarks + 2) * n + b
    #         tmp = ax2.plot([i + offset for i in ax2_xticks],
    #                         miss_rates[num_benchmarks*n + b],
    #                         "o", markersize=5, color="black", linestyle="none",
    #                         markeredgecolor="#4b4a25")
    #     if n == 0:
    #         hdls += tmp

    # ax.legend(
    #         hdls,
    #         args.scheme_names[1:] + ["L2 MPKI"],
    #         loc="upper center",
    #         #bbox_to_anchor=(0.5, 1.18),
    #         bbox_to_anchor=(0.5, 1.2),
    #         # ncol=np.ceil((num_schemes + 1) / 2),
    #         ncol=num_schemes+1,
    #         frameon=False,
    #         handletextpad=0.2,
    #         columnspacing=0.6)
    ax.legend(
            hdls,
            args.scheme_names[:],
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.5, 1.23),
            # ncol=np.ceil((num_schemes + 1) / 2),
            ncol=num_schemes+1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6)

    fig.subplots_adjust(bottom=0.28, top=0.8)

    ly = len_num_cpus
    scale = 1. / ly
    ypos = -.5
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names[1:])
    len_num_cpus = len(args.num_cpus)
    assert len_num_cpus > 1

    group_names = []
    cpu_names = []
    xticks = []
    for n, ncpu in enumerate(args.num_cpus):
        if n == 0:
            data = results[f"{ncpu}cpus-speedup"][1:][:]
            base = 0
        else:
            data = np.concatenate((data, results[f"{ncpu}cpus-speedup"][1:][:]),
                    axis=1)
            base = len(xticks) + 0.6

        if len(args.benchmark_names) > 1:
            for i in np.arange(num_benchmarks + 1):
                xticks.append(base + i)
        else:
            for i in np.arange(num_benchmarks):
                xticks.append(base + i)

        if ncpu == 16:
            cpu_names.append(f"{ncpu} cores with 4$\\times$4 mesh")
        elif ncpu == 64:
            cpu_names.append(f"{ncpu} cores with 8$\\times$8 mesh")
        else:
            cpu_names.append(f"{ncpu} cores")
        print(args.benchmark_names)
        if len(args.benchmark_names) > 1:
            group_names += args.benchmark_names + ["gmean"]
        else:
            group_names += args.benchmark_names
        print(group_names)
        print(args.scheme_names)

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-cpus-speedup-mpki-categories.pdf"
    #figsize = (12, 5)
    figsize = (10, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.scheme_names[1:],
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()

    ax.set_ylim(0, 2.2)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup over Baseline")
    y_range = [0,0.5,1,1.5,2]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.set_label_coords(-0.07, 0.4)

    # # miss rate
    # ax2 = ax.twinx() # secondary ax for miss rate

    # miss_rates = []
    # for n, ncpu in enumerate(args.num_cpus):
    #     for b, benchmark in enumerate(args.benchmark_list):
    #         miss_rates.append([])
    #         for s, scheme in enumerate(args.scheme_names[1:]):
    #             print(scheme)
    #             miss_rates[-1].append(results[f"{ncpu}cpus-mpki"][s][b])

    # miss_rates = np.array(miss_rates, dtype=np.float64)

    # ax2_xticks = []
    # width = 0.8
    # base = -width / 2.0 + width / num_schemes / 2.0
    # for i in np.arange(num_schemes):
    #     ax2_xticks.append(base + i * width / num_schemes)

    # # ax2.set_ylim(0, 120)
    # ax2.set_ylabel("Private L2 MPKI")
    # for n, ncpu in enumerate(args.num_cpus):
    #     for b in range(num_benchmarks):
    #         offset = (num_benchmarks + 2) * n + b
    #         tmp = ax2.plot([i + offset for i in ax2_xticks],
    #                         miss_rates[num_benchmarks*n + b],
    #                         "o", markersize=5, color="black", linestyle="none",
    #                         markeredgecolor="#4b4a25")
    #     if n == 0:
    #         hdls += tmp

    # ax.legend(
    #         hdls,
    #         args.scheme_names[1:] + ["L2 MPKI"],
    #         loc="upper center",
    #         #bbox_to_anchor=(0.5, 1.18),
    #         bbox_to_anchor=(0.5, 1.2),
    #         # ncol=np.ceil((num_schemes + 1) / 2),
    #         ncol=num_schemes+1,
    #         frameon=False,
    #         handletextpad=0.2,
    #         columnspacing=0.6)
    ax.legend(
            hdls,
            args.scheme_names[1:],
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.5, 1.23),
            # ncol=np.ceil((num_schemes + 1) / 2),
            ncol=num_schemes+1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6)

    fig.subplots_adjust(bottom=0.28, top=0.8)

    ly = len_num_cpus
    scale = 1. / ly
    ypos = -.50
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    figname = f"{args.fig_dir}/ablation-speedup.pdf"
    #figsize = (12, 5)
    figsize = (11, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.scheme_names[1:],
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()

    y_range = [0.0,0.5,1.0,1.5,2.0]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup over Baseline")
    ax.yaxis.set_label_coords(-0.065, 0.4)

    print("printing")
    print(hdls)

    # newbar = {}
    # newbar[0] = hdls[0]
    # newbar[1] = hdls[2]
    # newbar[2] = hdls[1]
    # newbar[3] = hdls[3]
    # newbar[4] = hdls[4]

    # legend1 = plt.legend(handles=[hdls[0],hdls[1]],
    #                     labels=args.scheme_names[1:3],
    #                     ncol=2,
    #                     bbox_to_anchor=(-0.12, 1.40),
    #                     loc="upper left",
    #                     frameon=False,
    #                     handletextpad=0.2,
    #                     columnspacing=0.6,
    #                     labelspacing=0.1, fontsize=24)
    # legend2 = plt.legend(handles=[hdls[2],hdls[3],hdls[4]],
    #                     labels=args.scheme_names[3:],
    #                     ncol=3, 
    #                     bbox_to_anchor=(-0.12, 1.28),
    #                     loc="upper left",
    #                     frameon=False,
    #                     handletextpad=0.2,
    #                     columnspacing=2.2,
    #                     labelspacing=0.1, fontsize=24)
    # ax.add_artist(legend1)
    ax.legend(
            hdls,
            args.scheme_names[1:],
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.495, 1.35),
            # ncol=np.ceil((num_schemes + 1) / 2),
            ncol=2,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6,
            labelspacing=0.1, fontsize=24)

    fig.subplots_adjust(bottom=0.28, top=0.8)

    ly = len_num_cpus
    scale = 1. / ly
    ypos = -.50
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    figname = f"{args.fig_dir}/nowarm-speedup.pdf"
    #figsize = (12, 5)
    figsize = (9, 4.5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.scheme_names[1:],
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()

    y_range = [0,0.5,1,1.5,2]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup over Baseline")

    print("printing")
    print(hdls)

    ax.legend(
            hdls,
            args.scheme_names[1:],
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.5, 1.4),
            # ncol=np.ceil((num_schemes + 1) / 2),
            ncol=2,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6,
            labelspacing=0.1, fontsize=24)

    fig.subplots_adjust(bottom=0.25, top=0.8)

    ly = len_num_cpus
    scale = 1. / ly
    ypos = -.40
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_runtime_for_all_cpus(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', "#BEB8DC", '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names)
    len_num_cpus = len(args.num_cpus)
    assert len_num_cpus > 1

    group_names = []
    cpu_names = []
    xticks = []
    for n, ncpu in enumerate(args.num_cpus):
        if n == 0:
            data = results[f"{ncpu}cpus-speedup"]
            base = 0
        else:
            data = np.concatenate((data, results[f"{ncpu}cpus-speedup"]),
                    axis=1)
            base = len(xticks) + 1

        for i in np.arange(num_benchmarks + 1):
            xticks.append(base + i)

        if ncpu == 16:
            cpu_names.append(f"{ncpu} cores with 4$\\times$4 mesh")
        elif ncpu == 64:
            cpu_names.append(f"{ncpu} cores with 8$\\times$8 mesh")
        else:
            cpu_names.append(f"{ncpu} cores")
        group_names += args.benchmark_names + ["gmean"]

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-cpus-speedup.pdf"
    figsize = (12, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.scheme_names,
            xticks=xticks,
            xticklabelfontsize=18,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()
    ax.legend(
            hdls,
            args.scheme_names,
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.5, 1.33),
            ncol=len(args.scheme_list) // 2,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6)

    ax.set_ylim(0, 2)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup over Baseline")

    fig.subplots_adjust(bottom=0.25, top=0.8)

    ly = len_num_cpus
    scale = 1. / ly
    ypos = -.35
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_traffic(args, results):
    #entry_names = ["Data", "GetS (Read Request)",
    entry_names = ["Data", "GetS",
                   "DataExcl", "PutX", "WbAck", "ExclUnblock",
                   "MemData", "Others"]
    concise_entry_names = ["Shared Data", "Read Request",
                           "Exclusive Data", "WriteBack Data",  "Others"]
    concise_entry_names_config = ["Shared Data", "Read Request",
                           "Exclusive Data", "WriteBack Data", "Config",  "Others"]
    l2_inject_entry_names = ["Read Request", "WriteBack Data",
                             "Other Injection"]
    l2_eject_entry_names = ["Shared Data", "Exclusive Data", "Other Ejection"]
    llc_inject_entry_names = ["Shared Data", "Exclusive Data", "Other Injection"]
    llc_eject_entry_names = ["Read Request", "WriteBack Data",
                             "Other Ejection"]
    
    # ["Read Request", "WriteBack Data", "Other Injection"]
    l2_inject_llc_eject_colors = ['#FA7F6F', '#FFBE7A', '#bf5b17', '#999999']

    # ["Shared Data", "Exclusive Data", "Other Ejection"]
    l2_eject_llc_inject_colors = ['#82B0D2', '#8ECFC9', '#E7DAD2']
    integrate_entry_names = ["Shared Data", "Exclusive Data", "Read Request", "WriteBack Data", "Others"]
    integrate_colors = ['#386cb0', '#beaed4', '#f0027f', '#7fc97f', '#bf5b17', '#74a9cf']

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names)

    group_names = []
    for benchmark in args.benchmark_list:
        for scheme in args.scheme_names:
            group_names.append(scheme)

    # concise_entry_names = ["Shared Data", "Read Request",
    #                        "Exclusive Data", "WriteBack Data",  "Others"]
    colors = ['#82B0D2', '#FA7F6F',   
              '#8ECFC9', '#FFBE7A', '#E7DAD2', '#666666', '#ffff99', '#fdc086', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]
    xticks = []
    additional_width = 0.2
    start_xtick = (2 - (additional_width * (len(args.scheme_list) - 1))) / 2
    local_xticks = []
    for i in range(len(args.scheme_list)):
        local_xticks.append(start_xtick + (i * (1 + additional_width)))
    for i in range(0, len(args.benchmark_list)):
        for j in range(0, len(args.scheme_list)):
            xticks.append(i * (len(args.scheme_list) + 0.5) + (j ))
            # xticks.append(i * (len(args.scheme_list) + 1) + local_xticks[j])
    print(local_xticks)
    print(xticks)

    data = [list(i) for i in zip(*results["traffic-breakdown"])]
    data = np.array(data, dtype=np.int64)

    figname = f"{args.fig_dir}/traffic-breakdown.pdf"
    if num_benchmarks == 1:
        figsize=(8, 6)
    else:
        figsize=(20, 6)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=22,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors,
            legendloc="upper center",
            legendncol=len(entry_names),
            xticklabelfontsize=18,
            xticklabelrotation=90)
    ax.set_ylabel("Traffic Breakdown in Number of Flits")
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    if num_benchmarks == 1:
        ax.legend(
                hdls,
                entry_names,
                loc="right",
                bbox_to_anchor=(1.8, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        ax.legend(
                hdls,
                entry_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(entry_names),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.50
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    if num_benchmarks == 1:
        fig.subplots_adjust(left=0.15, right=0.6, bottom=0.32)
    else:
        fig.subplots_adjust(left=0.04, right=0.99, bottom=0.32)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized traffic breakdown
    data = [list(i) for i in zip(*results["normalized-traffic-breakdown"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=22,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors,
            legendloc="upper center",
            legendncol=len(entry_names),
            xticklabelfontsize=18,
            xticklabelrotation=90)
    ax.set_ylabel("Normalized Traffic Breakdown")
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    if num_benchmarks == 1:
        ax.legend(
                hdls,
                entry_names,
                loc="right",
                bbox_to_anchor=(1.8, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        ax.legend(
                hdls,
                entry_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(entry_names),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.5
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    if num_benchmarks == 1:
        fig.subplots_adjust(left=0.15, right=0.6, bottom=0.32)
    else:
        fig.subplots_adjust(left=0.05, right=0.99, bottom=0.32)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)


    data = [list(i) for i in zip(*results["concise-traffic-breakdown"])]
    data = np.array(data, dtype=np.int64)

    figname = f"{args.fig_dir}/concise-traffic-breakdown.pdf"
    if num_benchmarks == 1:
        figsize = (8, 6)
    else:
        figsize = (16, 6)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=22,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=concise_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors,
            legendloc="upper center",
            legendncol=len(concise_entry_names),
            xticklabelfontsize=18,
            xticklabelrotation=90)
    ax.set_ylabel("Traffic Breakdown in Number of Flits")
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    if num_benchmarks == 1:
        ax.legend(
                hdls,
                concise_entry_names,
                loc="right",
                bbox_to_anchor=(1.85, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        ax.legend(
                hdls,
                concise_entry_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(concise_entry_names),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.50
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    if num_benchmarks == 1:
        fig.subplots_adjust(left=0.15, right=0.6, bottom=0.32)
    else:
        fig.subplots_adjust(left=0.04, right=0.99, bottom=0.32)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized traffic breakdown
    data = [list(i) for i in zip(*results["concise-normalized-traffic-breakdown"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/concise-normalized-traffic-breakdown.pdf"
    # pdfpage, fig = pdf.plot_setup(figname, figsize=(16, 7), fontsize=28,
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 7), fontsize=28,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=concise_entry_names,
            # entry_names=concise_entry_names_config,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors,
            legendloc="upper center",
            legendncol=len(concise_entry_names),
            # legendncol=len(concise_entry_names_config),
            xticklabelfontsize=26,
            xticklabelrotation=90)
    
    # fig.autofmt_xdate()

    ax.set_ylabel("Normalized Traffic Breakdown", y=0.3)
    y_range = [0,0.25,0.5,0.75,1,1.25]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.set_label_coords(-0.09, 0)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    if num_benchmarks == 1:
        ax.legend(
                hdls,
                concise_entry_names,
                # concise_entry_names_config,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.47),
                ncol=3,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        ax.legend(
                hdls,
                concise_entry_names,
                # concise_entry_names_config,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.47),
                ncol=3,
                frameon=False,
                handletextpad=0.1,
                columnspacing=0.5,
                labelspacing=0.1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -1.2
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=25,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    if num_benchmarks == 1:
        fig.subplots_adjust(left=0.12, right=0.9, bottom=0.55)
    else:
        fig.subplots_adjust(left=0.12, right=0.9, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized l2 inject traffic breakdown
    data = [list(i) for i in zip(*results["normalized-l2-inject-traffic-breakdown"])]
    data1 = data
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-l2-inject-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=l2_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(l2_inject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax.set_ylabel("Norm. L2 Injection Traffic Breakdown", y = 0.23)
    ax.yaxis.grid(True, linestyle="--")
    y_range = [0,0.5,1,1.5]
    ax.set_yticks(y_range,y_range)
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls,
            l2_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.23),
            ncol=len(l2_inject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.68
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized l2 eject traffic breakdown
    data = [list(i) for i in zip(*results["normalized-l2-eject-traffic-breakdown"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-l2-eject-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=l2_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(l2_eject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax.set_ylabel("Norm. L2 Ejection Traffic Breakdown", y=0.23)
    y_range = [0,0.5,1,1.5,2,2.5]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls,
            l2_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.23),
            ncol=len(l2_eject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.68
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized LLC inject traffic breakdown
    data = [list(i) for i in zip(*results["normalized-llc-inject-traffic-breakdown"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-llc-inject-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=llc_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(llc_inject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax.set_ylabel("Norm. LLC Injection Traffic Breakdown", y=0.23)
    y_range = [0,0.5,1,1.4]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls,
            llc_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.23),
            ncol=len(llc_inject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.68
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized llc eject traffic breakdown
    data = [list(i) for i in zip(*results["normalized-llc-eject-traffic-breakdown"])]
    data2 = data
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-llc-eject-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=llc_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(llc_eject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax.set_ylabel("Norm. LLC Ejection Traffic Breakdown", y=0.23)
    y_range = [0,0.5,1,1.5,2]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls,
            llc_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.23),
            ncol=len(llc_eject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.68
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # pos-neg normalized l2 inject-eject traffic breakdown
    posdata = [list(i) for i in zip(*results["normalized-l2-inject-traffic-breakdown"])]
    negdata = [list(i) for i in zip(*results["neg-normalized-l2-eject-traffic-breakdown"])]
    posdata = np.array(posdata, dtype=np.float64)
    negdata = np.array(negdata, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-l2-in-eject-traffic-breakdown.pdf"
    # pdfpage, fig = pdf.plot_setup(figname, figsize=(16, 10), fontsize=28,
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 10), fontsize=28,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    ax2 = ax.twinx()
    hdls1 = barchart.draw(
            ax,
            posdata,
            group_names=group_names,
            entry_names=l2_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(l2_inject_entry_names),
            xticklabelfontsize=28,
            xticklabelrotation=90)
    hdls2 = barchart.draw(
            ax,
            negdata,
            group_names=group_names,
            entry_names=l2_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(l2_eject_entry_names),
            xticklabelfontsize=26,
            xticklabelrotation=90)
    ax2.set_yticks([])
    ax.set_ylabel("Norm. L2 In/Ejection Traffic Breakdown", y=0.23)
    ax.text(0.25, 0.91, "Injected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 28)
    ax.text(0.25, 0.032, "Ejected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 28)
    line_ypos = 0.5055
    line = plt.Line2D(
            [0, 1], [line_ypos, line_ypos],
            transform=ax.transAxes,
            color="black",
            linewidth=2, linestyle='-')
    line.set_clip_on(False)
    ax.add_line(line)

    y_range = [-1,-0.5,0,0.5,1]
    y_list_range = [1,0.5,0,0.5,1]
    ax.set_yticks(y_range,y_list_range)
    ax.yaxis.set_label_coords(-0.06, 0.1)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls1,
            l2_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.34),
            ncol=len(l2_inject_entry_names),
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.2)
    ax2.legend(
            hdls2,
            l2_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.22),
            ncol=len(l2_eject_entry_names),
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.2)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.85
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=25,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.1, right=0.9, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # pos-neg normalized llc inject-eject traffic breakdown
    posdata = [list(i) for i in zip(*results["normalized-llc-inject-traffic-breakdown"])]
    negdata = [list(i) for i in zip(*results["neg-normalized-llc-eject-traffic-breakdown"])]
    posdata = np.array(posdata, dtype=np.float64)
    negdata = np.array(negdata, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-llc-in-eject-traffic-breakdown.pdf"
    # pdfpage, fig = pdf.plot_setup(figname, figsize=(16, 10), fontsize=28,
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 10), fontsize=28,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    ax2 = ax.twinx()
    hdls1 = barchart.draw(
            ax,
            posdata,
            group_names=group_names,
            entry_names=llc_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(llc_inject_entry_names),
            xticklabelfontsize=28,
            xticklabelrotation=90)
    hdls2 = barchart.draw(
            ax,
            negdata,
            group_names=group_names,
            entry_names=llc_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(llc_eject_entry_names),
            xticklabelfontsize=26,
            xticklabelrotation=90)
    ax2.set_yticks([])
    ax.set_ylabel("Norm. LLC In/Ejection Traffic Breakdown", y=0.23)
    ax.text(0.25, 0.9, "Injected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 28)
    ax.text(0.25, 0.03, "Ejected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 28)
    line_ypos = 0.495
    line = plt.Line2D(
            [0, 1], [line_ypos, line_ypos],
            transform=ax.transAxes,
            color="black",
            linewidth=2, linestyle='-')
    line.set_clip_on(False)
    ax.add_line(line)

    y_range = [-1,-0.5,0,0.5,1]
    y_list_range = [1,0.5,0,0.5,1]
    ax.set_yticks(y_range,y_list_range)
    ax.yaxis.set_label_coords(-0.06, 0.1)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls1,
            llc_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.34),
            ncol=len(llc_inject_entry_names),
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.2)
    ax2.legend(
            hdls2,
            llc_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.22),
            ncol=len(llc_eject_entry_names),
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.2)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.85
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=25,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.1, right=0.9, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # Integrate normalized llc inject-eject traffic breakdown
    data = [list(i) for i in zip(*results["integrate-normalized-llc-in-eject-traffic-breakdown"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/integrate-normalized-llc-in-eject-traffic-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    ax2 = ax.twinx()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=integrate_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=integrate_colors,
            legendloc="upper center",
            legendncol=len(integrate_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax2.set_yticks([])
    ax.set_ylabel("Norm. LLC In/Ejection Traffic Breakdown", y=0.23)
    # ax.text(0.9, 0.9, "Inject Flits", ha='right',
    #                 transform=ax.transAxes, fontsize = 18)
    # ax.text(0.9, 0.1, "Eject Flits", ha='right',
    #                 transform=ax.transAxes, fontsize = 18)
    # line_ypos = 0.524
    # line = plt.Line2D(
    #         [0, 1], [line_ypos, line_ypos],
    #         transform=ax.transAxes,
    #         color="black",
    #         linewidth=2, linestyle='-')
    # line.set_clip_on(False)
    # ax.add_line(line)

    y_range = [0,0.5,1,1.5]
    y_list_range = [0,0.5,1,1.5]
    ax.set_yticks(y_range,y_list_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls,
            integrate_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.35),
            ncol=3,
            frameon=False,
            handletextpad=0.6,
            columnspacing=1,
            labelspacing=0.2)
    # ax.legend(
    #         hdls1,
    #         llc_inject_entry_names,
    #         loc="upper center",
    #         bbox_to_anchor=(0.5, 1.35),
    #         ncol=len(llc_inject_entry_names),
    #         frameon=False,
    #         handletextpad=0.6,
    #         columnspacing=1)
    # ax2.legend(
    #         hdls2,
    #         llc_eject_entry_names,
    #         loc="upper center",
    #         bbox_to_anchor=(0.5, 1.23),
    #         ncol=len(llc_eject_entry_names),
    #         frameon=False,
    #         handletextpad=0.6,
    #         columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.68
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # network traffic loads
    colors = ['#386cb0', '#fdc086', '#f0027f', '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    # injection
    data = [list(i) for i in zip(*results["inject-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-load.pdf"
    if num_benchmarks == 1:
        figsize = (8, 5)
    else:
        figsize = (20, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["inject-load"][0][0])
        add_label(ax, num_schemes, results["inject-load"][4][0])
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # injection control traffic
    data = [list(i) for i in zip(*results["inject-ctrl-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-ctrl-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Ctrl Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["inject-ctrl-load"][0][0])
        add_label(ax, num_schemes, results["inject-ctrl-load"][4][0])
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # injection data traffic
    data = [list(i) for i in zip(*results["inject-data-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-data-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Data Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["inject-data-load"][0][0])
        add_label(ax, num_schemes, results["inject-data-load"][4][0])
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # ejection
    data = [list(i) for i in zip(*results["eject-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["eject-load"][0][0])
        add_label(ax, num_schemes, results["eject-load"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # ejection control load
    data = [list(i) for i in zip(*results["eject-ctrl-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-ctrl-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Ctrl Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["eject-ctrl-load"][0][0])
        add_label(ax, num_schemes, results["eject-ctrl-load"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # ejection data load
    data = [list(i) for i in zip(*results["eject-data-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-data-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Data Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 8)
        add_baseline_label(ax, num_schemes, results["eject-data-load"][0][0])
        add_label(ax, num_schemes, results["eject-data-load"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # network load
    data = [list(i) for i in zip(*results["network-load"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/network-load.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Network Loads (flits/cycle)")

    if num_benchmarks == 1:
        ax.set_ylim(0, 20)
        add_baseline_label(ax, num_schemes, results["network-load"][0][0])
        add_label(ax, num_schemes, results["network-load"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.set_ylim(0, 30)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # inject traffic
    data = [list(i) for i in zip(*results["inject-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes, results["inject-traffic"][0][0])
        add_label(ax, num_schemes, results["inject-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # inject control traffic
    data = [list(i) for i in zip(*results["inject-ctrl-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-ctrl-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Ctrl Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes,
                results["inject-ctrl-traffic"][0][0])
        add_label(ax, num_schemes, results["inject-ctrl-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # inject data traffic
    data = [list(i) for i in zip(*results["inject-data-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/inject-data-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Injection Data Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes,
                results["inject-data-traffic"][0][0])
        add_label(ax, num_schemes, results["inject-data-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # eject traffic
    data = [list(i) for i in zip(*results["eject-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes, results["eject-traffic"][0][0])
        add_label(ax, num_schemes, results["eject-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # eject control traffic
    data = [list(i) for i in zip(*results["eject-ctrl-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-ctrl-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Ctrl Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes, results["eject-ctrl-traffic"][0][0])
        add_label(ax, num_schemes, results["eject-ctrl-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # eject data traffic
    data = [list(i) for i in zip(*results["eject-data-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/eject-data-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Ejection Data Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 15)
        add_baseline_label(ax, num_schemes, results["eject-data-traffic"][0][0])
        add_label(ax, num_schemes, results["eject-data-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # network traffic
    data = [list(i) for i in zip(*results["network-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/network-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Network Traffic (millions of flits)")

    if num_benchmarks == 1:
        #ax.set_ylim(0, 35)
        add_baseline_label(ax, num_schemes, results["network-traffic"][0][0])
        add_label(ax, num_schemes, results["network-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized inject traffic
    data = [list(i) for i in zip(*results["normalized-inject-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-inject-traffic.pdf"
    if num_benchmarks == 1:
        figsize = (8, 5)
    else:
        figsize = (16, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Injection Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes, results["normalized-inject-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized inject control traffic
    data = [list(i) for i in zip(*results["normalized-inject-ctrl-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-inject-ctrl-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Injection Ctrl Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-inject-ctrl-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized inject data traffic
    data = [list(i) for i in zip(*results["normalized-inject-data-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-inject-data-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Injection Data Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-inject-data-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized eject traffic
    data = [list(i) for i in zip(*results["normalized-eject-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-eject-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Ejection Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-eject-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized eject control traffic
    data = [list(i) for i in zip(*results["normalized-eject-ctrl-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-eject-ctrl-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Ejection Ctrl Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-eject-ctrl-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized eject data traffic
    data = [list(i) for i in zip(*results["normalized-eject-data-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-eject-data-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Ejection Data Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-eject-data-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # normalized network traffic
    data = [list(i) for i in zip(*results["normalized-network-traffic"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-network-traffic.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Normalized Network Traffic")

    if num_benchmarks == 1:
        ax.set_ylim(0, 1)
        add_label(ax, num_schemes,
                results["normalized-network-traffic"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.2, right=0.6)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.15),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_traffic_withoutbaseline(args, results):
    #entry_names = ["Data", "GetS (Read Request)",
    entry_names = ["Data", "GetS",
                   "DataExcl", "PutX", "WbAck", "ExclUnblock",
                   "MemData", "Others"]
    concise_entry_names = ["Shared Data", "Read Request",
                           "Exclusive Data", "WriteBack Data",  "Others"]
    l2_inject_entry_names = ["Read Request", "WriteBack Data",
                             "Other Injection"]
    l2_eject_entry_names = ["Shared Data", "Exclusive Data", "Other Ejection"]
    llc_inject_entry_names = ["Shared Data", "Exclusive Data", "Other Injection"]
    llc_eject_entry_names = ["Read Request", "WriteBack Data",
                             "Other Ejection"]
    l2_inject_llc_eject_colors = ['#f0027f', '#7fc97f', '#bf5b17', '#8ECFC9']
    l2_eject_llc_inject_colors = ['#386cb0', '#beaed4', '#74a9cf']
    integrate_entry_names = ["Shared Data", "Exclusive Data", "Read Request", "WriteBack Data", "Others"]
    integrate_colors = ['#386cb0', '#beaed4', '#f0027f', '#7fc97f', '#bf5b17', '#74a9cf']

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names[1:])

    group_names = []
    for benchmark in args.benchmark_list:
        for scheme in args.scheme_names[1:]:
            group_names.append(scheme)

    colors = ['#386cb0', '#7fc97f', '#f0027f', '#beaed4', \
             '#bf5b17', '#74a9cf', '#666666', '#ffff99', '#fdc086', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]
    xticks = []
    for i in range(0, len(args.benchmark_list)):
        for j in range(0, len(args.scheme_list[1:])):
            xticks.append(i * (len(args.scheme_list[1:]) + 1) + j)

    # normalized traffic breakdown
    result_temp = np.zeros((6, num_benchmarks * num_schemes), dtype=np.float64)
    for b in range(num_benchmarks):
        for s in range(num_schemes):
            result_temp[0][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][0][b*(num_schemes+1)+s+1]
            result_temp[1][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][1][b*(num_schemes+1)+s+1]
            result_temp[2][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][2][b*(num_schemes+1)+s+1]
            result_temp[3][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][3][b*(num_schemes+1)+s+1]
            result_temp[4][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][4][b*(num_schemes+1)+s+1]
            result_temp[5][b*num_schemes+s] = results["concise-normalized-traffic-breakdown"][5][b*(num_schemes+1)+s+1]
    # print(result_temp)
    data = [list(i) for i in zip(*result_temp)]
    data = np.array(data, dtype=np.float64)
    # print(data)

    figname = f"{args.fig_dir}/concise-normalized-traffic-breakdown-nobaseline.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=concise_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors,
            legendloc="upper center",
            legendncol=len(concise_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax.set_ylabel("Normalized Traffic Breakdown", y=0.22)
    y_range = [0,0.5,1,1.5]
    ax.set_yticks(y_range,y_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    if num_benchmarks == 1:
        ax.legend(
                hdls,
                concise_entry_names,
                loc="right",
                bbox_to_anchor=(1.85, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        ax.legend(
                hdls,
                concise_entry_names,
                loc="upper center",
                bbox_to_anchor=(0.48, 1.25),
                ncol=len(concise_entry_names),
                frameon=False,
                handletextpad=0.1,
                columnspacing=0.5)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.9
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    if num_benchmarks == 1:
        fig.subplots_adjust(left=0.15, right=0.6, bottom=0.32)
    else:
        fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # pos-neg normalized l2 inject-eject traffic breakdown
    result_pos_temp = np.zeros((4, num_benchmarks * num_schemes), dtype=np.float64)
    for b in range(num_benchmarks):
        for s in range(num_schemes):
            result_pos_temp[0][b*num_schemes+s] = results["normalized-l2-inject-traffic-breakdown"][0][b*(num_schemes+1)+s+1]
            result_pos_temp[1][b*num_schemes+s] = results["normalized-l2-inject-traffic-breakdown"][1][b*(num_schemes+1)+s+1]
            result_pos_temp[2][b*num_schemes+s] = results["normalized-l2-inject-traffic-breakdown"][2][b*(num_schemes+1)+s+1]
            result_pos_temp[3][b*num_schemes+s] = results["normalized-l2-inject-traffic-breakdown"][3][b*(num_schemes+1)+s+1]
    
    result_neg_temp = np.zeros((3, num_benchmarks * num_schemes), dtype=np.float64)
    for b in range(num_benchmarks):
        for s in range(num_schemes):
            result_neg_temp[0][b*num_schemes+s] = results["neg-normalized-l2-eject-traffic-breakdown"][0][b*(num_schemes+1)+s+1]
            result_neg_temp[1][b*num_schemes+s] = results["neg-normalized-l2-eject-traffic-breakdown"][1][b*(num_schemes+1)+s+1]
            result_neg_temp[2][b*num_schemes+s] = results["neg-normalized-l2-eject-traffic-breakdown"][2][b*(num_schemes+1)+s+1]
    
    posdata = [list(i) for i in zip(*result_pos_temp)]
    negdata = [list(i) for i in zip(*result_neg_temp)]
    posdata = np.array(posdata, dtype=np.float64)
    negdata = np.array(negdata, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-l2-in-eject-traffic-breakdown-nobaseline.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 8), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    ax2 = ax.twinx()
    hdls1 = barchart.draw(
            ax,
            posdata,
            group_names=group_names,
            entry_names=l2_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(l2_inject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    hdls2 = barchart.draw(
            ax,
            negdata,
            group_names=group_names,
            entry_names=l2_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(l2_eject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax2.set_yticks([])
    ax.set_ylabel("Norm. L2 In/Ejection Traffic Breakdown", y=0.23)
    ax.text(0.15, 0.9, "Injected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 20)
    ax.text(0.15, 0.05, "Ejected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 20)
    line_ypos = 0.56
    line = plt.Line2D(
            [0, 1], [line_ypos, line_ypos],
            transform=ax.transAxes,
            color="black",
            linewidth=2, linestyle='-')
    line.set_clip_on(False)
    ax.add_line(line)

    y_range = [-2.5,-2,-1.5,-1,-0.5,0,0.5,1,1.5,2]
    y_list_range = [2.5,2,1.5,1,0.5,0,0.5,1,1.5,2]
    ax.set_yticks(y_range,y_list_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls1,
            l2_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.26),
            ncol=len(l2_inject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)
    ax2.legend(
            hdls2,
            l2_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.165),
            ncol=len(l2_eject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.65
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # pos-neg normalized llc inject-eject traffic breakdown
    result_pos_temp = np.zeros((3, num_benchmarks * num_schemes), dtype=np.float64)
    for b in range(num_benchmarks):
        for s in range(num_schemes):
            result_pos_temp[0][b*num_schemes+s] = results["normalized-llc-inject-traffic-breakdown"][0][b*(num_schemes+1)+s+1]
            result_pos_temp[1][b*num_schemes+s] = results["normalized-llc-inject-traffic-breakdown"][1][b*(num_schemes+1)+s+1]
            result_pos_temp[2][b*num_schemes+s] = results["normalized-llc-inject-traffic-breakdown"][2][b*(num_schemes+1)+s+1]
    
    result_neg_temp = np.zeros((4, num_benchmarks * num_schemes), dtype=np.float64)
    for b in range(num_benchmarks):
        for s in range(num_schemes):
            result_neg_temp[0][b*num_schemes+s] = results["neg-normalized-llc-eject-traffic-breakdown"][0][b*(num_schemes+1)+s+1]
            result_neg_temp[1][b*num_schemes+s] = results["neg-normalized-llc-eject-traffic-breakdown"][1][b*(num_schemes+1)+s+1]
            result_neg_temp[2][b*num_schemes+s] = results["neg-normalized-llc-eject-traffic-breakdown"][2][b*(num_schemes+1)+s+1]
            result_neg_temp[3][b*num_schemes+s] = results["neg-normalized-llc-eject-traffic-breakdown"][3][b*(num_schemes+1)+s+1]

    posdata = [list(i) for i in zip(*result_pos_temp)]
    negdata = [list(i) for i in zip(*result_neg_temp)]
    posdata = np.array(posdata, dtype=np.float64)
    negdata = np.array(negdata, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-llc-in-eject-traffic-breakdown-nobaseline.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 8), fontsize=18,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    ax2 = ax.twinx()
    hdls1 = barchart.draw(
            ax,
            posdata,
            group_names=group_names,
            entry_names=llc_inject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_eject_llc_inject_colors,
            legendloc="upper center",
            legendncol=len(llc_inject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    hdls2 = barchart.draw(
            ax,
            negdata,
            group_names=group_names,
            entry_names=llc_eject_entry_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=l2_inject_llc_eject_colors,
            legendloc="upper center",
            legendncol=len(llc_eject_entry_names),
            xticklabelfontsize=16,
            xticklabelrotation=90)
    ax2.set_yticks([])
    ax.set_ylabel("Norm. LLC In/Ejection Traffic Breakdown", y=0.23)
    ax.text(0.15, 0.9, "Injected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 20)
    ax.text(0.15, 0.05, "Ejected Flits", ha='right',
                    transform=ax.transAxes, fontsize = 20)
    line_ypos = 0.525
    line = plt.Line2D(
            [0, 1], [line_ypos, line_ypos],
            transform=ax.transAxes,
            color="black",
            linewidth=2, linestyle='-')
    line.set_clip_on(False)
    ax.add_line(line)

    y_range = [-1.5,-1,-0.5,0,0.5,1,1.5]
    y_list_range = [1.5,1,0.5,0,0.5,1,1.5]
    ax.set_yticks(y_range,y_list_range)
    ax.yaxis.grid(True, linestyle="--")
    fmt.resize_ax_box(ax, hratio=0.8)

    # legend
    ax.legend(
            hdls1,
            llc_inject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.26),
            ncol=len(llc_inject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)
    ax2.legend(
            hdls2,
            llc_eject_entry_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.165),
            ncol=len(llc_eject_entry_names),
            frameon=False,
            handletextpad=0.6,
            columnspacing=1)

    # xticks and labels
    ly = len(args.benchmark_list)
    scale = 1. / ly
    ypos = -.65
    pos = 0
    xlabels = args.benchmark_names
    for pos in range(ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, xlabels[pos], ha='center', fontsize=18,
                    transform=ax.transAxes)
        add_xaxis_line(ax, pos * scale, ypos)

    fig.subplots_adjust(left=0.08, right=0.99, bottom=0.55)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)


def plot_link_load(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    key = f"{args.benchmark_name}-link-load"

    for s, scheme in enumerate(args.scheme_list):
        loads = results[key][scheme]["loads"]
        link_names = results[key][scheme]["link-names"]
        sorted_loads = results[key][scheme]["sorted-loads"]

        if not loads:
            continue

        data = [loads]
        data = [list(i) for i in zip(*data)]
        data = np.array(data, dtype=np.float64)

        figname = f"{args.fig_dir}/{key}-{scheme}.pdf"
        pdfpage, fig = pdf.plot_setup(figname, figsize = (25, 5), fontsize=20,
                font=("family", "Tw Cen MT"))

        ax = fig.gca()
        hdls = barchart.draw(
                ax,
                data,
                group_names=link_names,
                colors=[colors[s]],
                breakdown=False,
                xticklabelrotation="vertical",
                xticklabelfontsize=16)
        ax.yaxis.grid(True, linestyle="--")
        scheme_name = args.scheme_names[s]
        ylabel = f"{args.benchmark_name} {scheme_name} Link Load (flit/cycle)"
        ax.set_ylabel("Link Load (flit/cycle)")
        ax.set_ylim(0, 1)
        ax.set_title(ylabel)
        fig.subplots_adjust(bottom=0.4)

        if not args.disable_pdf:
            pdf.plot_teardown(pdfpage, fig)

        data = []
        names = []
        for l, load in enumerate(sorted_loads):
            for name in results[key][scheme]["load-link-names"][load]:
                data.append([load])
                names.append(name)

        data = np.array(data, dtype=np.float64)

        figname = f"{args.fig_dir}/{key}-{scheme}-sorted.pdf"
        pdfpage, fig = pdf.plot_setup(figname, figsize = (25, 5), fontsize=20,
                font=("family", "Tw Cen MT"))

        ax = fig.gca()
        hdls = barchart.draw(
                ax,
                data,
                group_names=names,
                colors=[colors[s]],
                breakdown=False,
                xticklabelrotation="vertical",
                xticklabelfontsize=16)
        ax.yaxis.grid(True, linestyle="--")
        scheme_name = args.scheme_names[s]
        ylabel = f"{args.benchmark_name} {scheme_name} Link Load (flit/cycle)"
        ax.set_ylabel("Link Load (flit/cycle)")
        ax.set_ylim(0, 1)
        ax.set_title(ylabel)
        fig.subplots_adjust(bottom=0.4)

        if not args.disable_pdf:
            pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_runtime_link_widths(args, results):
    # colors = ['#386cb0', '#fdc086', '#f0027f', '#7fc97f', '#beaed4', \
    #           '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    colors = ['#8ECFC9', \
              '#FFBE7A', \
              '#FA7F6F', '#82b0d2', '#b9faf8', '#beaed4', \
              '#7fc97f', '#666666', '#ffff99', "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]
    bar_width = 1.1

    num_cores = len(args.num_cpus)
    num_benchmarks = len(args.benchmark_list)
    num_links = len(args.link_widths)
    link_names = []
    for i in range(num_links):
        link_name = str(args.link_widths[i]) + "-bits"
        link_names.append(link_name) 

    group_names = []
    cpu_names = []
    xticks = []
    for n, ncpu in enumerate(args.num_cpus):
        if n == 0:
            data = results["speedup-link-widths"][n]["softprepush"][:][:]
            base = 0
        else:
            data = np.concatenate((data, results["speedup-link-widths"][n]["softprepush"][:][:]),
                    axis=1)
            base = len(xticks) + 3.1
            # base = len(xticks) + 1

        for i in np.arange(num_benchmarks + 1):
            xticks.append(base + 1.3*i)
            # xticks.append(base + i)

        if ncpu == 16:
            cpu_names.append(f"{ncpu} cores with 4$\\times$4 mesh")
        elif ncpu == 64:
            cpu_names.append(f"{ncpu} cores with 8$\\times$8 mesh")
        else:
            cpu_names.append(f"{ncpu} cores")
        print(args.benchmark_names)
        group_names += args.benchmark_names + ["gmean"]
        print(group_names)
        print(args.link_widths)

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)
    print(data)

    figname = f"{args.fig_dir}/Link-Width-Study.pdf"
    #figsize = (12, 5)
    figsize = (11, 5)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()

    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=args.link_widths,
            xticks=xticks,
            xticklabelfontsize=24,
            colors=colors,
            breakdown=False,
            width=bar_width)
    fig.autofmt_xdate()

    # ax.set_ylim(0, 2)
    ax.set_yticks(np.arange(0, 2.5, 0.5))
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Speedup Over Baseline")
    ax.yaxis.set_label_coords(-0.06, 0.37)

    ax.legend(
            hdls,
            link_names,
            loc="upper center",
            #bbox_to_anchor=(0.5, 1.18),
            bbox_to_anchor=(0.5, 1.23),
            # ncol=np.ceil((num_links + 1) / 2),
            ncol=num_links,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.6)

    fig.subplots_adjust(bottom=0.28, top=0.8)

    ly = num_cores
    scale = 1. / ly
    ypos = -.5
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, cpu_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

    # prepush_schemes = []
    # prepush_names = []
    # num_prepushes = 0
    # for n, ncpu in enumerate(args.scheme_list):
    #     if "prepush" in scheme:
    #         num_prepushes += 1
    #         prepush_schemes.append(scheme)
    #         prepush_names.append(args.scheme_names[s])

    # if num_prepushes >= 1:
    #     num_benchmarks = len(args.benchmark_list)
    #     group_names = []
    #     xticks = []
    #     result_neg_temp = np.zeros((len(prepush_schemes), num_link_widths, num_benchmarks + 1), dtype=np.float64)
    #     for s, scheme in enumerate(prepush_schemes):
    #         for l in range(num_link_widths):
    #             for b in range(num_benchmarks + 1):
    #                 print(results["speedup-link-widths"][scheme][l][b])
    #                 result_neg_temp[s][l][b] = results["speedup-link-widths"][scheme][l][b]
    #     for s, scheme in enumerate(prepush_schemes):
            
    #         if s == 0:
    #             # print(results["speedup-link-widths"][scheme])
    #             # print(results["speedup-link-widths"][scheme][:-1])
    #             data = result_neg_temp[s]
    #             base = 0
    #         else:
    #             data = np.concatenate((data,
    #                 result_neg_temp[s]), axis=1)
    #             base = len(xticks) + 0.5*s
    #         for i in np.arange(num_benchmarks + 1):
    #             xticks.append(base + i)
    #         group_names += args.benchmark_names + ["gmean"]
    #     data = [list(i) for i in zip(*data)]
    #     data = np.array(data, dtype=np.float64)

    #     figname = f"{args.fig_dir}/all-speedup-link-widths.pdf"
    #     figsize = (10, 4)
    #     pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
    #             font=("family", "Tw Cen MT"))
    #     print(results["speedup-link-widths"])
    #     # print(data) result_neg_temp = np.zeros((4, num_benchmarks * num_schemes), dtype=np.float64)
    #     print(group_names)
    #     ax = fig.gca()
    #     hdls = barchart.draw(
    #             ax,
    #             data,
    #             group_names=group_names,
    #             entry_names=link_width_names,
    #             xticks=xticks,
    #             xticklabelfontsize=18,
    #             colors=colors,
    #             breakdown=False)

    #     fig.autofmt_xdate()
    #     ax.legend(
    #             hdls,
    #             link_width_names,
    #             loc="upper center",
    #             bbox_to_anchor=(0.5, 1.33),
    #             ncol=num_link_widths,
    #             frameon=False,
    #             handletextpad=0.5,
    #             columnspacing=1)

    #     ax.yaxis.grid(True, linestyle="--")
    #     ax.set_ylim(0, 1.75)
    #     y_range = [0,0.5,1,1.5]
    #     ax.set_yticks(y_range,y_range)
    #     ax.set_ylabel("Speedup over Baseline",labelpad = 3, y = 0.28)

    #     fig.subplots_adjust(bottom=0.5)

    #     # xticks and labels
    #     ly = num_prepushes
    #     scale = 1. / ly
    #     ypos = -.65
    #     for pos in range(0, ly + 1):
    #         lxpos = (pos + 0.5) * scale
    #         if pos < ly:
    #             ax.text(lxpos, ypos, prepush_names[pos], ha='center',
    #                     transform=ax.transAxes)
    #         add_line(ax, pos * scale, 0, pos * scale, ypos)

    #     if not args.disable_pdf:
    #         pdf.plot_teardown(pdfpage, fig)

    # if args.show:
    #     plt.show()

def plot_filter_distribution(args, results):
    filter_components = ["Core-Cache", "Core-NI", "Network", "LLC-NI", "LLC"]

    data = np.zeros((len(filter_components), len(args.benchmark_list)),
                dtype=np.float64)
    data_percent = np.zeros((len(filter_components), len(args.benchmark_list)),
                dtype=np.float64)

    data_label_ypos = np.zeros(len(args.benchmark_list))
    data_total = np.zeros(len(args.benchmark_list), dtype=np.int32)
    ylim_max = 3

    key = f"{args.prepush_scheme}-filter-distribution"
    for b, benchmark in enumerate(args.benchmark_list):
        data_total[b] = results[key][benchmark]["total"]
        total = results[key][benchmark]["total"] / 1e6
        data_label_ypos[b] = total / ylim_max
        if total == 0:
            print(f"Warning: {benchmark} has no filtering in "
                  f"{args.prepush_scheme}")
            continue
        for c, component in enumerate(filter_components):
            data[c][b] = results[key][benchmark][component] / 1e6
            data_percent[c][b] = data[c][b] * 100 / total

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=filter_components,
            breakdown=True)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    ax.set_ylabel("Filtering Count Distribution (million)")

    ax.legend(
            hdls[::-1],
            filter_components[::-1],
            loc="upper right",
            bbox_to_anchor=(1.3, 1),
            ncol=1,
            frameon=False)
    fig.subplots_adjust(left=0.08, right=0.8)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        ax.text(lxpos, data_label_ypos[pos-1]+0.02, data_total[pos-1],
                ha='center', fontsize=18, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    data_percent = [list(i) for i in zip(*data_percent)]
    data_percent = np.array(data_percent, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data_percent,
            group_names=args.benchmark_names,
            entry_names=filter_components,
            breakdown=True)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.set_ylabel(f"Filtering Distribution in {args.prepush_name} (%)")

    ax.legend(
            hdls[::-1],
            filter_components[::-1],
            loc="upper right",
            bbox_to_anchor=(1.3, 1),
            ncol=1,
            frameon=False)
    fig.subplots_adjust(left=0.08, right=0.8)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        if data_total[pos-1] == 0:
            total = data_total[pos-1]
        if data_total[pos-1] > 1e6:
            total = f"{data_total[pos-1] / 1e6:.1f}M"
        elif data_total[pos-1] > 1e3:
            total = f"{data_total[pos-1] / 1e3:.1f}k"
        else:
            total = f"{data_total[pos-1]}"
        ax.text(lxpos, 1.02, total,
                ha='center', fontsize=20, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_prepush(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', \
            #'#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    prepush_breakdown_names = ["Early-Resp", "Miss-to-Hit", "Unused",
            "Coherence-Drop", "Redundancy-Drop", "Deadlock-Drop"]

    prepush_components = ["demand", "used", "unused", "coherence-drop",
            "redundancy-drop", "deadlock-drop"]

    data = np.zeros((len(prepush_components), len(args.benchmark_list)),
                dtype=np.float64)
    norm_data = np.zeros((len(prepush_components), len(args.benchmark_list)),
                dtype=np.float64)

    data_label_ypos = np.zeros(len(args.benchmark_list))
    data_total = np.zeros(len(args.benchmark_list), dtype=np.int32)
    ylim_max = 35
    scale = 1e6
    if args.prepush_scheme == "prepush-stream":
        ylim_max = 200
        scale = 1e3

    key = f"{args.prepush_scheme}-prepushes"
    for b, benchmark in enumerate(args.benchmark_list):
        total = results[key][benchmark]["total"]
        data_total[b] = total
        total /=  scale
        data_label_ypos[b] = total / ylim_max
        if total == 0:
            print(f"Warning: {benchmark} has no prepush in {args.prepush_scheme}")
            continue
        for c, component in enumerate(prepush_components):
            data[c][b] = float(results[key][benchmark][component]) / scale
            norm_data[c][b] = data[c][b] * 100.0 / total

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=prepush_breakdown_names,
            breakdown=True,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    if args.prepush_scheme == "prepush-stream":
        ax.set_ylabel("Push Usage Count Breakdown (kilo)")
    else:
        ax.set_ylabel("Push Usage Count Breakdown (million)")

    ax.legend(
            hdls[::-1],
            prepush_breakdown_names[::-1],
            loc="upper right",
            bbox_to_anchor=(1.36, 1),
            ncol=1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.4)
    fig.subplots_adjust(left=0.08, right=0.76)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        if data_total[pos-1] == 0:
            total = data_total[pos-1]
        if data_total[pos-1] > 1e6:
            total = f"{data_total[pos-1] / 1e6:.1f}M"
        elif data_total[pos-1] > 1e3:
            total = f"{data_total[pos-1] / 1e3:.1f}k"
        else:
            total = f"{data_total[pos-1]}"
        ax.text(lxpos, 1.02, total,
                ha='center', fontsize=20, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    norm_data = [list(i) for i in zip(*norm_data)]
    norm_data = np.array(norm_data, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}-breakdown-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            norm_data,
            group_names=args.benchmark_names,
            entry_names=prepush_breakdown_names,
            breakdown=True,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.set_ylabel(f"Push Usage Breakdown in {args.prepush_name} (%)")

    ax.legend(
            hdls[::-1],
            prepush_breakdown_names[::-1],
            loc="upper right",
            bbox_to_anchor=(1.36, 1),
            ncol=1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.4)
    fig.subplots_adjust(left=0.08, right=0.76)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        if data_total[pos-1] == 0:
            total = data_total[pos-1]
        if data_total[pos-1] > 1e6:
            total = f"{data_total[pos-1] / 1e6:.1f}M"
        elif data_total[pos-1] > 1e3:
            total = f"{data_total[pos-1] / 1e3:.1f}k"
        else:
            total = f"{data_total[pos-1]}"
        ax.text(lxpos, 1.02, total,
                ha='center', fontsize=20, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_waits(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', \
            #'#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    # results[key][benchmark]["total"] = 0
    # results[key][benchmark]["timeout"] = 0
    # results[key][benchmark]["guest_to_host"] = 0
    # results[key][benchmark]["hit"] = 0

    software_prepush_breakdown_names = ["Timeout", "Switch Host Requests", "Satisfied"]

    software_prepush_components = ["timeout", "guest_to_host", "hit"]

    data = np.zeros((len(software_prepush_components), len(args.benchmark_list)),
                dtype=np.float64)
    norm_data = np.zeros((len(software_prepush_components), len(args.benchmark_list)),
                dtype=np.float64)

    data_label_ypos = np.zeros(len(args.benchmark_list))
    data_total = np.zeros(len(args.benchmark_list), dtype=np.int32)
    ylim_max = 35
    scale = 1e6

    key = f"{args.software_prepush_scheme}-waits"
    for b, benchmark in enumerate(args.benchmark_list):
        total = results[key][benchmark]["total"]
        data_total[b] = total
        total /=  scale
        data_label_ypos[b] = total / ylim_max
        if total == 0:
            print(f"Warning: {benchmark} has no prepush in {args.prepush_scheme}")
            continue
        for c, component in enumerate(software_prepush_components):
            data[c][b] = float(results[key][benchmark][component]) / scale
            norm_data[c][b] = data[c][b] * 100.0 / total

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=software_prepush_breakdown_names,
            breakdown=True,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    if args.prepush_scheme == "prepush-stream":
        ax.set_ylabel("Push Usage Count Breakdown (kilo)")
    else:
        ax.set_ylabel("Push Usage Count Breakdown (million)")

    ax.legend(
            hdls[::-1],
            software_prepush_breakdown_names[::-1],
            loc="upper right",
            bbox_to_anchor=(1.36, 1),
            ncol=1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.4)
    fig.subplots_adjust(left=0.08, right=0.76)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        if data_total[pos-1] == 0:
            total = data_total[pos-1]
        if data_total[pos-1] > 1e6:
            total = f"{data_total[pos-1] / 1e6:.1f}M"
        elif data_total[pos-1] > 1e3:
            total = f"{data_total[pos-1] / 1e3:.1f}k"
        else:
            total = f"{data_total[pos-1]}"
        ax.text(lxpos, 1.02, total,
                ha='center', fontsize=20, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    norm_data = [list(i) for i in zip(*norm_data)]
    norm_data = np.array(norm_data, dtype=np.float64)

    figname = f"{args.fig_dir}/{key}-breakdown-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(12, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            norm_data,
            group_names=args.benchmark_names,
            entry_names=software_prepush_breakdown_names,
            breakdown=True,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.set_ylabel(f"Push Usage Breakdown in {args.prepush_name} (%)")

    ax.legend(
            hdls[::-1],
            software_prepush_breakdown_names[::-1],
            loc="upper right",
            bbox_to_anchor=(1.36, 1),
            ncol=1,
            frameon=False,
            handletextpad=0.2,
            columnspacing=0.4)
    fig.subplots_adjust(left=0.08, right=0.76)

    # xticks and labels
    ly = len(args.benchmark_list) + 1
    scale = 1. / ly
    for pos in range(1, ly):
        lxpos = pos * scale
        if data_total[pos-1] == 0:
            total = data_total[pos-1]
        if data_total[pos-1] > 1e6:
            total = f"{data_total[pos-1] / 1e6:.1f}M"
        elif data_total[pos-1] > 1e3:
            total = f"{data_total[pos-1] / 1e3:.1f}k"
        else:
            total = f"{data_total[pos-1]}"
        ax.text(lxpos, 1.02, total,
                ha='center', fontsize=20, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_all_filter_distribution(args, results):
    filter_components = ["Core-Cache", "Core-NI", "Network", "LLC-NI", "LLC"]

    num_benchmarks = len(args.benchmark_list)

    num_prepush_schemes = 0
    prepush_schemes = []
    prepush_names = []
    for s, scheme in enumerate(args.scheme_list):
        if "prepush" in scheme:
            num_prepush_schemes += 1
            prepush_schemes.append(scheme)
            prepush_names.append(args.scheme_names[s])

    data = np.zeros(
            (len(filter_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)
    data_percent = np.zeros(
            (len(filter_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)

    group_names = []
    xticks = []
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_names):
            group_names.append(benchmark)
            xticks.append(s * (num_benchmarks + 1) + b)

    data_label_ypos = np.zeros((num_prepush_schemes, num_benchmarks))
    data_total = np.zeros((num_prepush_schemes, num_benchmarks), dtype=np.int32)
    ylim_max = 0


    for s, scheme in enumerate(prepush_schemes):
        key = f"{scheme}-filter-distribution"
        for b, benchmark in enumerate(args.benchmark_list):
            data_total[s][b] = results[key][benchmark]["total"]
            total = results[key][benchmark]["total"] / 1e6
            if ylim_max < total:
                ylim_max = total
            if total == 0:
                print(f"Warning: {benchmark} has no filtering in {scheme}")
                continue
            for c, component in enumerate(filter_components):
                data[c][s * num_benchmarks + b] = results[key][benchmark][component] / 1e6
                data_percent[c][s * num_benchmarks + b] = data[c][s * num_benchmarks + b] * 100 / total

    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_list):
            total = results[key][benchmark]["total"] / 1e6
            data_label_ypos[s][b] = total / ylim_max

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-prepush-filter-distribution.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(10, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=filter_components,
            breakdown=True,
            xticks=xticks,
            width=0.8)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    ax.set_ylabel("Filtering Count Distribution (million)")

    ax.legend(
            hdls[::-1],
            filter_components[::-1],
            loc='upper center',
            ncol=len(filter_components),
            bbox_to_anchor=(0.5, 1.15),
            frameon=False,
            handletextpad=0.5,
            columnspacing=1)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.3)

    # xticks and labels
    ly = num_prepush_schemes
    scale = 1. / ly
    ypos = -.41
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, prepush_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_list):
            xpos = (s * (num_benchmarks + 1) + b + 1) * scale
            ax.text(xpos, data_label_ypos[s][b], data_total[s][b],
                    ha='center', fontsize=18, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    data_percent = [list(i) for i in zip(*data_percent)]
    data_percent = np.array(data_percent, dtype=np.float64)

    figname = f"{args.fig_dir}/all-prepush-filter-distribution-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(10, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data_percent,
            group_names=group_names,
            entry_names=filter_components,
            breakdown=True,
            xticks=xticks,
            xticklabelfontsize=18,
            xticklabelrotation=90,
            width=0.8)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.set_ylabel(f"Filtering Distribution (%)")

    ax.legend(
            hdls[::-1],
            filter_components[::-1],
            loc='upper center',
            ncol=len(filter_components),
            bbox_to_anchor=(0.5, 1.22),
            frameon=False,
            handletextpad=0.5,
            columnspacing=1)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.3)

    # xticks and labels
    ly = num_prepush_schemes
    scale = 1. / ly
    ypos = -.3
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, prepush_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_list):
            if data_total[s][b] > 1e6:
                total = f"{data_total[s][b] / 1e6:.1f}M"
            elif data_total[s][b] > 1e3:
                total = f"{data_total[s][b] / 1e3:.1f}k"
            else:
                total = f"{data_total[s][b]}"
            xpos = (s * (num_benchmarks + 1) + b + 1) * scale
            ax.text(xpos, 1.02, total, ha='center', fontsize=20,
                    transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_all_prepush(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    prepush_breakdown_names = ["Early-Resp", "Miss-to-Hit", "Unused",
            "Coherence-Drop", "Redundancy-Drop", "Deadlock-Drop"]

    prepush_components = ["demand", "used", "unused", "coherence-drop",
            "redundancy-drop", "deadlock-drop"]

    num_benchmarks = len(args.benchmark_list)
    num_prepush_schemes = 0
    prepush_schemes = []
    prepush_names = []

    for s, scheme in enumerate(args.scheme_list):
        if "prepush" in scheme:
            num_prepush_schemes += 1
            prepush_schemes.append(scheme)
            prepush_names.append(args.scheme_names[s])

    data = np.zeros(
            (len(prepush_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)
    norm_data = np.zeros(
            (len(prepush_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)

    group_names = []
    xticks = []
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_names):
            group_names.append(benchmark)
            xticks.append(s * (num_benchmarks + 1) + b)

    data_label_ypos = np.zeros((num_prepush_schemes, num_benchmarks))
    data_total = np.zeros((num_prepush_schemes, num_benchmarks), dtype=np.int32)
    ylim_max = 35
    scale = 1e6

    for s, scheme in enumerate(prepush_schemes):
        key = f"{scheme}-prepushes"
        for b, benchmark in enumerate(args.benchmark_list):
            total = results[key][benchmark]["total"]
            data_total[s][b] = total
            total /=  scale
            data_label_ypos[s][b] = total / ylim_max
            if total == 0:
                print(f"Warning: {benchmark} has no prepush in {scheme}")
                continue
            for c, component in enumerate(prepush_components):
                data[c][s * num_benchmarks + b] = float(results[key][benchmark][component]) / scale
                norm_data[c][s * num_benchmarks + b] = data[c][s * num_benchmarks + b] * 100.0 / total

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-prepush-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(10, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=prepush_breakdown_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    ax.set_ylabel("Push Usage Count Breakdown (million)")

    ax.legend(
            hdls[::-1],
            prepush_breakdown_names[::-1],
            loc="upper center",
            bbox_to_anchor=(0.5, 1.22),
            ncol=len(prepush_breakdown_names) // 2,
            frameon=False,
            handletextpad=0.5,
            columnspacing=1)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.3)

    # xticks and labels
    ly = num_prepush_schemes
    scale = 1. / ly
    ypos = -.41
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, prepush_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_list):
            if data_total[s][b] > 1e6:
                total = f"{data_total[s][b] / 1e6:.1f}M"
            elif data_total[s][b] > 1e3:
                total = f"{data_total[s][b] / 1e3:.1f}k"
            else:
                total = f"{data_total[s][b]}"
            xpos = (s * (num_benchmarks + 1) + b + 1) * scale
            ax.text(xpos, data_label_ypos[s][b], total, ha='center',
                    fontsize=18, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    norm_data = [list(i) for i in zip(*norm_data)]
    norm_data = np.array(norm_data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-prepush-breakdown-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(8, 6.5), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            norm_data,
            group_names=group_names,
            entry_names=prepush_breakdown_names,
            breakdown=True,
            xticks=xticks,
            xticklabelfontsize=16,
            xticklabelrotation=90,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.yaxis.set_label_coords(-0.075, 0)
    ax.set_ylabel(f"Multicast Usage Breakdown (%)", y=0.4)

    ax.legend(
            hdls[::-1],
            prepush_breakdown_names[::-1],
            loc="upper center",
            ncol=len(prepush_breakdown_names) // 2,
            # ncol=len(prepush_breakdown_names),
            #bbox_to_anchor=(0.47, 1.23),
            #bbox_to_anchor=(0.5, 1.35),
            bbox_to_anchor=(0.5, 1.43),
            frameon=False,
            fontsize=20,
            handletextpad=0.2,
            columnspacing=0.4,
            labelspacing=0.1)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.5, top=0.8)

    # xticks and labels
    ly = num_prepush_schemes
    scale = 1. / ly
    ypos = -.5
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, prepush_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    #scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    #for s, scheme in enumerate(prepush_schemes):
    #    for b, benchmark in enumerate(args.benchmark_list):
    #        if data_total[s][b] > 1e6:
    #            total = f"{data_total[s][b] / 1e6:.1f}M"
    #        elif data_total[s][b] > 1e3:
    #            total = f"{data_total[s][b] / 1e3:.1f}k"
    #        else:
    #            total = f"{data_total[s][b]}"
    #        xpos = (s * (num_benchmarks + 1) + b + 1) * scale
    #        ax.text(xpos, 1.02, total, ha='center', fontsize=12,
    #                transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_all_waits(args, results):
    colors = ['#8ECFC9', \
              '#FFBE7A', \
              '#82b0d2', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    software_prepush_breakdown_names = ["Satisfied", "Timeout", "Leader Switch"]

    software_prepush_components = ["hit", "timeout", "guest_to_host"]

    num_benchmarks = len(args.benchmark_list)
    num_prepush_schemes = 0
    prepush_schemes = []
    prepush_names = []

    for s, scheme in enumerate(args.scheme_list):
        if "softprepush" in scheme:
            num_prepush_schemes += 1
            prepush_schemes.append(scheme)
            prepush_names.append(args.scheme_names[s])

    data = np.zeros(
            (len(software_prepush_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)
    norm_data = np.zeros(
            (len(software_prepush_components), num_benchmarks * num_prepush_schemes),
            dtype=np.float64)

    group_names = []
    xticks = []
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_names):
            group_names.append(benchmark)
            xticks.append(s * (num_benchmarks + 1) + b)

    data_label_ypos = np.zeros((num_prepush_schemes, num_benchmarks))
    data_total = np.zeros((num_prepush_schemes, num_benchmarks), dtype=np.int32)
    ylim_max = 35
    scale = 1e6

    for s, scheme in enumerate(prepush_schemes):
        key = f"{scheme}-waits"
        for b, benchmark in enumerate(args.benchmark_list):
            total = results[key][benchmark]["total"]
            data_total[s][b] = total
            total /=  scale
            data_label_ypos[s][b] = total / ylim_max
            if total == 0:
                print(f"Warning: {benchmark} has no prepush in {scheme}")
                continue
            for c, component in enumerate(software_prepush_components):
                data[c][s * num_benchmarks + b] = float(results[key][benchmark][component]) / scale
                norm_data[c][s * num_benchmarks + b] = data[c][s * num_benchmarks + b] * 100.0 / total

    data = [list(i) for i in zip(*data)]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-prepush-breakdown.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(10, 6), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=group_names,
            entry_names=software_prepush_breakdown_names,
            breakdown=True,
            xticks=xticks,
            width=0.8,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, ylim_max)
    ax.set_ylabel("Push Usage Count Breakdown (million)")

    ax.legend(
            hdls[::-1],
            software_prepush_breakdown_names[::-1],
            loc="upper center",
            bbox_to_anchor=(0.5, 1.22),
            ncol=len(software_prepush_breakdown_names) // 2,
            frameon=False,
            handletextpad=0.5,
            columnspacing=1)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.3)

    # xticks and labels
    ly = num_prepush_schemes
    scale = 1. / ly
    ypos = -.41
    for pos in range(0, ly + 1):
        lxpos = (pos + 0.5) * scale
        if pos < ly:
            ax.text(lxpos, ypos, prepush_names[pos], ha='center',
                    transform=ax.transAxes)
        add_line(ax, pos * scale, 0, pos * scale, ypos)

    scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    for s, scheme in enumerate(prepush_schemes):
        for b, benchmark in enumerate(args.benchmark_list):
            if data_total[s][b] > 1e6:
                total = f"{data_total[s][b] / 1e6:.1f}M"
            elif data_total[s][b] > 1e3:
                total = f"{data_total[s][b] / 1e3:.1f}k"
            else:
                total = f"{data_total[s][b]}"
            xpos = (s * (num_benchmarks + 1) + b + 1) * scale
            ax.text(xpos, data_label_ypos[s][b], total, ha='center',
                    fontsize=18, transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    norm_data = [list(i) for i in zip(*norm_data)]
    norm_data = np.array(norm_data, dtype=np.float64)

    figname = f"{args.fig_dir}/all-wait-breakdown-percentage.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(7, 7), fontsize=22,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            norm_data,
            group_names=group_names,
            entry_names=software_prepush_breakdown_names,
            breakdown=True,
            xticks=xticks,
            xticklabelfontsize=22,
            xticklabelrotation=90,
            colors=colors)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.yaxis.set_label_coords(-0.095, 1)
    ax.set_ylabel(f"Wait Table Breakdown (%)", y=0.34)

    ax.legend(
            hdls[::-1],
            software_prepush_breakdown_names[::-1],
            loc="upper center",
            ncol=len(software_prepush_breakdown_names),
            # ncol=len(prepush_breakdown_names),
            #bbox_to_anchor=(0.47, 1.23),
            #bbox_to_anchor=(0.5, 1.35),
            bbox_to_anchor=(0.5, 1.26),
            frameon=False,
            fontsize=22,
            handletextpad=0.2,
            columnspacing=0.4,
            labelspacing=0.1)
    fig.subplots_adjust(left=0.12, right=0.98, bottom=0.5, top=0.8)

    # # xticks and labels
    # ly = num_prepush_schemes
    # scale = 1. / ly
    # ypos = -.5
    # for pos in range(0, ly + 1):
    #     lxpos = (pos + 0.5) * scale
    #     if pos < ly:
    #         ax.text(lxpos, ypos, prepush_names[pos], ha='center',
    #                 transform=ax.transAxes)
    #     add_line(ax, pos * scale, 0, pos * scale, ypos)

    #scale = 1. / ((num_benchmarks + 1) * num_prepush_schemes)
    #for s, scheme in enumerate(prepush_schemes):
    #    for b, benchmark in enumerate(args.benchmark_list):
    #        if data_total[s][b] > 1e6:
    #            total = f"{data_total[s][b] / 1e6:.1f}M"
    #        elif data_total[s][b] > 1e3:
    #            total = f"{data_total[s][b] / 1e3:.1f}k"
    #        else:
    #            total = f"{data_total[s][b]}"
    #        xpos = (s * (num_benchmarks + 1) + b + 1) * scale
    #        ax.text(xpos, 1.02, total, ha='center', fontsize=12,
    #                transform=ax.transAxes)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()


def plot_misses(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    # miss mkpi
    # filename = f"{args.fig_dir}/miss-rate-mpki.txt"
    # with open(filename, 'w') as f:
    #     for b, benchmark in enumerate(args.benchmark_list):
    #         for s, scheme in enumerate(args.scheme_list):
    #             # f.write("miss-rate-mpki in " + scheme + " " + benchmark + " = " + str(results["miss-rate-mpki"][s][b] / results["miss-rate-mpki"][s][0]) + "\n")
    #             f.write("miss-rate-mpki in " + scheme + " " + benchmark + " = " + str(results["miss-rate-mpki"][s][b]) + "\n")

    # f.close()

    # filename = f"{args.fig_dir}/miss-rate-mpki-l0.txt"
    # with open(filename, 'w') as f:
    #     for b, benchmark in enumerate(args.benchmark_list):
    #         for s, scheme in enumerate(args.scheme_list):
    #             # f.write("miss-rate-mpki in " + scheme + " " + benchmark + " = " + str(results["miss-rate-mpki"][s][b] / results["miss-rate-mpki"][s][0]) + "\n")
    #             f.write("miss-rate-mpki in " + scheme + " " + benchmark + " = " + str(results["miss-rate-mpki-l0"][s][b]) + "\n")

    # f.close()

    data = [list(i) for i in zip(*results["miss-rate-mpki"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/miss-rate-mpki.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(16, 10), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 200)
    ax.set_ylabel("Private L2 Cache Miss MKPI")

    if len(args.scheme_names) == 1:
        ax.get_legend().remove()
    else:
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.2,
                columnspacing=0.4)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    data = [list(i) for i in zip(*results["normalized-miss-rate-mpki"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-miss-rate-mpki.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(16, 10), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 20)
    ax.set_ylabel("Private L2 Cache Miss MKPI Change Reverse")

    if len(args.scheme_names) == 1:
        ax.get_legend().remove()
    else:
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.2,
                columnspacing=0.4)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # miss rate
    data = [list(i) for i in zip(*results["miss-rate"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/miss-rate.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(8, 5), fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(0, 100)
    ax.set_ylabel("Private L2 Cache Miss Ratio (%)")

    if len(args.scheme_names) == 1:
        ax.get_legend().remove()
    else:
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list)/3,
                frameon=False,
                handletextpad=0.2,
                columnspacing=0.4)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    # miss rate change
    data = [list(i) for i in zip(*results["miss-rate-change"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/miss-rate-change.pdf"
    pdfpage, fig = pdf.plot_setup(figname, figsize=(20, 5), fontsize=20,
                    font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    fig.autofmt_xdate()
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylim(-20, 10)
    ax.set_ylabel("L2 Miss Ratio Change w.r.t. Baseline (%)")

    ax.legend(
            hdls,
            args.scheme_names,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.18),
            ncol=len(args.scheme_list),
            frameon=False)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_writeinvalidation_interval(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names)

    # normalized writeinvalidation-interval
    data = [list(i) for i in zip(*results["normalized-writeinvalidation-interval"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-writeinvalidation-interval.pdf"
    if num_benchmarks == 1:
        figsize = (8, 5)
    else:
        figsize = (16, 10)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Average Write Invalidation Interval")

    if num_benchmarks == 1:
        add_label(ax, len(args.scheme_names),
                results[f"normalized-writeinvalidation-interval"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

def plot_load_interval(args, results):
    colors = ['#386cb0', '#fdc086', '#f0027f', '#beaed4', \
              '#7fc97f', '#bf5b17', '#666666', '#ffff99', "#FFBE7A", "#8ECFC9", "#FA7F6F", "#82B0D2", "#BEB8DC", "#E7DAD2"]

    num_benchmarks = len(args.benchmark_list)
    num_schemes = len(args.scheme_names)

    # normalized load-interval
    data = [list(i) for i in zip(*results["normalized-load-interval"])]
    data = np.array(data, dtype=np.float64)

    figname = f"{args.fig_dir}/normalized-load-interval.pdf"
    if num_benchmarks == 1:
        figsize = (8, 5)
    else:
        figsize = (16, 10)
    pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=20,
            font=("family", "Tw Cen MT"))

    ax = fig.gca()
    hdls = barchart.draw(
            ax,
            data,
            group_names=args.benchmark_names,
            entry_names=args.scheme_names,
            colors=colors,
            breakdown=False)
    ax.yaxis.grid(True, linestyle="--")
    ax.set_ylabel("Average Load Interval")

    if num_benchmarks == 1:
        add_label(ax, len(args.scheme_names),
                results[f"normalized-load-interval"][4][0]) #[4][0]
        fig.subplots_adjust(left=0.1, right=0.5)
        ax.legend(
                hdls,
                args.scheme_names,
                loc="right",
                bbox_to_anchor=(1.9, 0.5),
                ncol=1,
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)
    else:
        fig.autofmt_xdate()
        ax.legend(
                hdls,
                args.scheme_names,
                loc="upper center",
                bbox_to_anchor=(0.5, 1.18),
                ncol=len(args.scheme_list),
                frameon=False,
                handletextpad=0.6,
                columnspacing=1)

    if not args.disable_pdf:
        pdf.plot_teardown(pdfpage, fig)

    if args.show:
        plt.show()

if __name__ == "__main__":
    main()