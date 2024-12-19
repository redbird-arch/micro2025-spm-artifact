# Description:
This project includes the implementation of **Push Multicast** and other implementations for comparison.

It also includes the benchmarks for performance evaluation and scripts for compilation, running experiment, and generating figures for results.

# Structure:
```shell
push-multicast-artifact/
├── push-multicast/
│   ├── benchmarks                        # includes source codes and executable files of benchmarks
│   ├── gem5                              # includes source codes and executable files of gem5
│   ├── benchmark-compilation.sh          # script for compiling benchmarks
│   ├── delete-benchmark.sh               # script for deleting compiled benchmarks
│   ├── gem5-compilation.sh               # script for compiling gem5
│   ├── delete-gem5.sh                    # script for deleting compiled gem5
│   ├── run-experiment-violin.sh          # script for running quick experiment and generating results in m5out/
│   ├── run-experiment-remain.sh          # script for running remaining experiment and generating results in m5out/
│   ├── delete-m5out.sh                   # script for deleting results in m5out/
│   ├── plot-figure.sh                    # script for generating figures of results in figures/
│   └── delete-figures.sh                 # script for deleting figures in figures/
├── clean-all.sh                          # script for cleaning all compiled files and results
├── build-docker-image.sh                 # script for building docker image
├── enter-docker-container.sh             # script for entering docker container
├── remove-docker-container.sh            # script for removing docker container
├── run-all.sh                            # script for compilation, running all experiments, and generating figures for results
├── run-violin.sh                         # script for compilation, running quick experiment
└── run-remain.sh                         # script for running remaining experiment, and generating figures for results
```

# Click-to-run for all figures and result
We provide three scripts: `run-violin.sh`, `run-remain.sh`, and `run-all.sh`

`run-violin.sh` executes compilation and runs quick exeperiment of the result of the violin figure. It would take about 3 hours to finish. `run-violin.sh` includes:
- Compile gem5
- Compile benchmarks
- Run quick experiment

`run-remain.sh` runs the remaining experiments and generate the figures for results. It would take about 10 days to finish. `run-remain.sh` includes:
- Run remaining experiments
- Generate figures

We also provide a single script named `run-all.sh` for click-to-run the full artifact. Executing `run-all.sh` includes:
- Compile gem5
- Compile benchmarks
- Run experiment
- Generate figures

# Note
We default that the experiments run at a 64-core system with the configuration of `--sweep-thread-pool-size=64` in `./push-multicast/run-experiment-remain.sh`. If have sufficient/insufficient resources, we suggest to increase/decrease value of this configuration to perfectly make use of the resources and get the results as soon as possible.

## Detailed Commands
To execute run-all.sh, you need to first enter the docker we provide, which includes building, setting up, and entering:
```shell
   bash build-docker-image.sh
   bash enter-docker-container.sh
```

Then you can execute compilation and run the experiments using either of the following two options:
```shell
# Option 1
   bash run-violin.sh
   bash run-remain.sh 
# Option 2
   bash run-all.sh
```

The results locate in `./push-multicast/m5out/`, and the reproduce figures locate in `./push-multicast/figures/reproduce/`.

After you exitting the docker, you can stop and remove the docker:
```shell
   bash remove-docker-container.sh
```

If you want to delect all the compiled file, results and figures, please execute:
```shell
   bash clean-all.sh
```
