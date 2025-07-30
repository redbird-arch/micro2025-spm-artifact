#!/bin/bash
TOTAL_NUM_CORES=$(getconf _NPROCESSORS_ONLN)
CORES=$(($TOTAL_NUM_CORES))
cd ./benchmarks
sudo apt-get install -y gcc-8 g++-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100

git clone https://github.com/PolyArch/gem-forge-framework.git
cd gem-forge-framework
git checkout 1359aee
cd ../
source source-env.sh
cd ./gem-forge-framework/transform
git apply ../../transform.patch
cd ../../

source setup-benchmarks.sh
make all