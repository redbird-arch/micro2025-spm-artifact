#!/bin/bash
mkdir figures
mkdir figures/reproduce

mkdir figures/motivation
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs blackscholes-large bodytrack-large fluidanimate-large freqmine-large swaptions-large --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs blackscholes bodytrack fluidanimate freqmine swaptions --scheme-list baseline --scheme-names Baseline --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir figures/motivation --plot --print-csv --action motivation --ncpu 16
cp figures/motivation/motivation-miss-mpki-noline.pdf ./figures/reproduce/Fig_2.pdf
cp figures/motivation/motivation-traffic-breakdown.pdf ./figures/reproduce/Fig_3.pdf

mkdir figures/violin
python3 ./utils/process-stats.py --benchmark-list mv --benchmark-names mv --scheme-list baseline --scheme-names Baseline --link-widths 128 --m5out-dir ./m5out/AE-result/violin/link-128bits --fig-dir ./figures/violin --logfile ./m5out/AE-result/violin/link-128bits/baseline/mv-16cpus/sim.log --plot --print-csv --action interval-dist --ncpu 16
cp figures/violin/mv-access-interval-violin.pdf ./figures/reproduce/Fig_4.pdf

mkdir figures/speedup
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs blackscholes-large bodytrack-large fluidanimate-large freqmine-large swaptions-large --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs blackscholes bodytrack fluidanimate freqmine swaptions --scheme-list baseline bingo coalescing-multicast prepush-only prepush-ack-multicast-feedback-restart-ratio prepush-multicast-feedback-restart-ratio --scheme-names Baseline L1Bingo-L2Stride Coalescing MSP PushAck OrdPush --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/speedup --plot --print-csv --action runtime --num-cpus 16 64
cp figures/speedup/all-cpus-speedup-mpki-categories-overBingo.pdf ./figures/reproduce/Fig_11.pdf

mkdir figures/prepush_usage
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs --scheme-list baseline prepush-only prepush-ack-multicast-feedback-restart-ratio prepush-multicast-feedback-restart-ratio --scheme-names Baseline MSP PushAck OrdPush --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/prepush_usage --plot --print-csv --action prepush --num-cpus 16 64
cp figures/prepush_usage/all-prepush-breakdown-percentage.pdf ./figures/reproduce/Fig_12.pdf

mkdir figures/traffic
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs --scheme-list bingo coalescing-multicast prepush-ack-multicast-feedback-restart-ratio prepush-multicast-feedback-restart-ratio --scheme-names L1Bingo-L2Stride Coalescing PushAck OrdPush --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/traffic --plot --print-csv --action traffic --num-cpus 16 64
cp figures/traffic/concise-normalized-traffic-breakdown.pdf ./figures/reproduce/Fig_13.pdf
cp figures/traffic/normalized-l2-in-eject-traffic-breakdown.pdf ./figures/reproduce/Fig_15.pdf
cp figures/traffic/normalized-llc-in-eject-traffic-breakdown.pdf ./figures/reproduce/Fig_16.pdf

mkdir figures/TPC
python3 ./utils/process-stats.py --benchmark-list conv3dfoowarm bfs --benchmark-names conv3d bfs --scheme-list bingo prepush-multicast-ratio-4-2000 prepush-multicast-ratio-16-2000 prepush-multicast-ratio-64-2000 prepush-multicast-ratio-256-2000 prepush-multicast-ratio-512-2000 prepush-multicast-ratio-1024-2000 --scheme-names Baseline 16 64 256 512 1024 8192 --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/TPC --plot --print-csv --action sensitivity --ncpu 16
cp figures/TPC/speedup-overPrefetcher.pdf ./figures/reproduce/Fig_17_a.pdf

mkdir figures/TimeWindow
python3 ./utils/process-stats.py --benchmark-list conv3dfoowarm bfs --benchmark-names conv3d bfs --scheme-list bingo prepush-multicast-ratio-16-300 prepush-multicast-ratio-16-400 prepush-multicast-ratio-16-1000 prepush-multicast-ratio-16-1500 prepush-multicast-ratio-16-2000 prepush-multicast-ratio-16-2500 --scheme-names Baseline 300 400 1000 1500 2000 2500 --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/TimeWindow --plot --print-csv --action sensitivity --ncpu 16
cp figures/TimeWindow/speedup-overPrefetcher.pdf ./figures/reproduce/Fig_17_b.pdf

mkdir figures/linkstudy
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs --scheme-list baseline prepush-ack-multicast-feedback-restart-ratio prepush-multicast-feedback-restart-ratio --scheme-names Baseline PushAck OrdPush --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB --fig-dir ./figures/linkstudy --plot --print-csv --action runtime-link-widths --ncpu 16
cp figures/linkstudy/all-speedup-link-widths.pdf ./figures/reproduce/Fig_18.pdf

mkdir figures/cachesize-study
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs --scheme-list baseline bingo prepush-ack-multicast-feedback-restart-ratio prepush-multicast-feedback-restart-ratio --scheme-names Baseline L1Bingo-L2Stride PushAck OrdPush --link-widths 64 128 256 512 --cache-sizes 256 512 1024 --m5out-dir ./m5out/AE-result --fig-dir ./figures/cachesize-study --plot --print-csv --action runtime-cache-size --ncpu 16
cp figures/cachesize-study/all-cachesize-speedup-overBingo.pdf ./figures/reproduce/Fig_19.pdf

mkdir figures/ablation
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop particlefilter-2fr conv3dfoowarm mlp mv lud pathfinder bfs --benchmark-names cachebw multilevel backprop particlefilter conv3d mlp mv lud pathfinder bfs --scheme-list baseline bingo prepush-only prepush-multicast prepush-multicast-filter prepush-multicast-feedback-restart-ratio --scheme-names No-Opt Bingo Push Push+Multicast Push+Multicast+Filter Push+Multicast+Filter+Knob --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/ablation --plot --print-csv --action runtime --num-cpus 16 64
cp figures/ablation/all-cpus-speedup-nomiss-overBingo.pdf ./figures/reproduce/Fig_20.pdf
