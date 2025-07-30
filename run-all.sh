#!/bin/bash

cd software-prefetch-multicast
bash gem5-compilation.sh
bash benchmark-compilation.sh
bash run-experiment-all.sh
bash plot-figure.sh