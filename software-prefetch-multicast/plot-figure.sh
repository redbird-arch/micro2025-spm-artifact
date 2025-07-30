# !/bin/bash
mkdir figures
mkdir figures/reproduce

mkdir figures/motivation
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline --scheme-names Baseline --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB --fig-dir ./figures/motivation --plot --print-csv --action motivation --num-cpus 16 64
cp figures/motivation/motivation_access_latency.pdf ./figures/reproduce/Fig_1.pdf

mkdir figures/speedup
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch bingo prepush-multicast-feedback-restart-ratio softprepush --scheme-names Baseline L1Bingo-L2Stride PushMulticast SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/speedup --plot --print-csv --action runtime --num-cpus 16 64
cp figures/speedup/all-cpus-speedup-mpki-categories.pdf ./figures/reproduce/Fig_13.pdf

mkdir figures/small-llc-speedup
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list prepush-multicast-feedback-restart-ratio-larger-than-llc softprepush-larger-than-llc --scheme-names PushMulticast SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/small-llc-speedup --plot --print-csv --action runtime --num-cpus 16 64
cp figures/small-llc-speedup/all-cpus-speedup-mpki-categories-nowarm.pdf ./figures/reproduce/Fig_14.pdf

mkdir figures/wait-usage
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch softprepush --scheme-names Baseline SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/wait-usage --plot --print-csv --action waits --num-cpus 16 64
cp figures/wait-usage/all-wait-breakdown-percentage.pdf ./figures/reproduce/Fig_15.pdf

mkdir figures/traffic
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch bingo prepush-multicast-feedback-restart-ratio softprepush --scheme-names Baseline L1Bingo-L2Stride PushMulticast SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/traffic --plot --print-csv --action traffic --num-cpus 16 64
cp figures/traffic/concise-normalized-traffic-breakdown.pdf ./figures/reproduce/Fig_16.pdf
cp figures/traffic/normalized-l2-in-eject-traffic-breakdown.pdf ./figures/reproduce/Fig_17.pdf
cp figures/traffic/normalized-llc-in-eject-traffic-breakdown.pdf ./figures/reproduce/Fig_18.pdf

mkdir ./figures/TimeoutThreshold
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch softprepush-128-16384 softprepush-256-16384 softprepush-512-16384 softprepush-1024-16384 softprepush-2048-16384 --scheme-names Baseline 128 256 512 1024 2048 --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/TimeoutThreshold --plot --print-csv --action sensitivity --num-cpus 16
cp figures/TimeoutThreshold/speedup.pdf ./figures/reproduce/Fig_19.pdf

mkdir ./figures/SwitchThreshold
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch softprepush-512-4096 softprepush-512-8192 softprepush-512-16384 softprepush-512-32768 softprepush-512-65536 --scheme-names Baseline 4096 8192 16384 32768 65536 --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/SwitchThreshold --plot --print-csv --action sensitivity --num-cpus 16
cp figures/SwitchThreshold/speedup.pdf ./figures/reproduce/Fig_20.pdf

mkdir figures/linkstudy
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch softprepush --scheme-names Baseline SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB --fig-dir ./figures/linkstudy --plot --print-csv --action runtime-link-widths --num-cpus 16 64
cp figures/linkstudy/Link-Width-Study.pdf ./figures/reproduce/Fig_21.pdf

mkdir figures/ablation
python3 ./utils/process-stats.py --benchmark-list cachebw readbw_multilevel backprop conv3dfoowarm mlp mv particlefilter-2fr --benchmark-names cachebw multilevel backprop conv3d mlp mv particlefilter --scheme-list baseline-software-prefetch softprepush_noTimeout_allmulticast softprepush_noSwitch_YesTimeoutMulticast softprepush_noSwitch_noTimeoutMulticast softprepush --scheme-names Baseline MulticastSoftwarePrefetch MulticastTimeout UnicastTimeout SPM --link-widths 64 128 256 512 --m5out-dir ./m5out/AE-result/256kB/link-128bits --fig-dir ./figures/ablation --plot --print-csv --action runtime --num-cpus 16 64
cp figures/ablation/ablation-speedup.pdf ./figures/reproduce/Fig_22.pdf

python3 ./utils/print_variation.py