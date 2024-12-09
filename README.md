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
│   ├── run-experiment.sh                 # script for running experiment and generating results in m5out/
│   ├── delete-m5out.sh                   # script for deleting results in m5out/
│   ├── plot-figure.sh                    # script for generating figures of results in figures/
│   └── delete-figures.sh                 # script for deleting figures in figures/
├── clean-all.sh                          # script for cleaning all compiled files and results
├── build-docker-image.sh                 # script for building docker image
├── enter-docker-container.sh             # script for entering docker container
├── remove-docker-container.sh            # script for removing docker container
└── run-all.sh                            # script for compilation, running experiment, and generating figures for results
```

# Click-to-run for all figures and result
Executing run-all.sh includes:
- Compile gem5
- Compile benchmarks
- Run experiment
- Generate figures

## Detailed Commands
To execute run-all.sh, you need to first enter the docker we provide, which includes building, setting up, and entering:
```shell
   bash build-docker-image.sh
   bash enter-docker-container.sh
```

Then you can run the run-all.sh:
```shell
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