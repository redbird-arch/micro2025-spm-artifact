#!/bin/bash

cd push-multicast
bash gem5-compilation.sh
bash benchmark-compilation.sh
bash run-experiment-violin.sh