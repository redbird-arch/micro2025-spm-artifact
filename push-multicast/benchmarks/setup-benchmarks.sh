#!/bin/bash

if [ "$#" == 0 ]; then
    setup=all
else
    setup=${1}
fi

TOTAL_NUM_CORES=$(getconf _NPROCESSORS_ONLN)
CORES=$(($TOTAL_NUM_CORES))

PARSECDIR=${PWD}/parsec-3.0


if [ "${setup}" == "all" ] || [ "${setup}" = "rodinia" ] || [ "${setup}" = "gem-forge" ]; then
    # rodinia also uses the LLVM
    echo "#"
    echo "######################## Build LLVM #########################################"
    echo "#"
    cd $GEM_FORGE_TOP/llvm
    if [ -d "install-release" ]; then
        echo "# LLVM installed already"
    else
        bash setup.sh
    fi
    cd $GEM_FORGE_TOP/..
fi


#set up ArchBenchSuite
# if [ "${setup}" == "all" ] || [ "${setup}" = "cachebw" ]; then
#     echo "#"
#     echo "######################## Build cachebw #########################################"
#     echo "#"
#     cd $BENCH_TOP/ArchBenchSuite
#     git apply $BENCH_TOP/patches/cachebw.patch
#     cd $BENCH_TOP
#     make cachebw
# fi


set up MLP
if [ "${setup}" == "all" ] || [ "${setup}" = "mlp" ]; then
    echo "#"
    echo "######################## Build mlp #########################################"
    echo "#"
    cd $BENCH_TOP/libxsmm
    git apply $BENCH_TOP/patches/mlp.patch
    cd $BENCH_TOP
    # make mlp
fi


# set up gem-forge
if [ "${setup}" = "all" ] || [ "${setup}" = "gem-forge" ]; then
    echo "#"
    echo "######################## Build Protobuf #########################################"
    echo "#"
    cd $GEM_FORGE_TOP/lib/protobuf
    ./autogen.sh
    CPPFLAGS=-DGOOGLE_PROTOBUF_NO_RTTI \
        CXXFLAGS=-fPIC \
        ./configure \
        --prefix=$GEM_FORGE_TOP/build \
        --enable-shared=no \
        --with-zlib=yes
    make -j $CORES
    make install
    # Build python files.
    cd python
    python3 setup.py build
    cd $GEM_FORGE_TOP/..

    echo "#"
    echo "######################## Build GemForge Transforms ##############################"
    echo "#"
    cd $GEM_FORGE_TOP/transform
    # git apply $BENCH_TOP/patches/mv.patch
    mkdir -p build
    cd build
    cmake ..
    make -j $CORES
    cd $GEM_FORGE_TOP/..

    # echo "#"
    # echo "######################## Build Gem-Forge Micro-benchmarks ###########################"
    # echo "#"
    # make gem-forge
fi


# set up rodinia
# if [ "${setup}" = "all" ] || [ "${setup}" = "rodinia" ]; then
#     if [ ! -d "rodinia_3.1" ]; then
#         echo "#"
#         echo "######################## Download Rodinia 3.1 Benchmark Suite #########################################"
#         echo "#"
#         if [ ! -f "rodinia_3.1.tar.bz2" ]; then
#             wget http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_3.1.tar.bz2
#         fi
#         if [ ! -d "rodinia_3.1" ]; then
#             tar xjf rodinia_3.1.tar.bz2
#         fi
#         cp -nr rodinia_3.1/data/* rodinia/data/
#         #rm -rf rodinia_3.1 rodinia_3.1.tar.bz2
#     fi

#     echo "#"
#     echo "######################## Build Rodinia Benchmarks ###########################"
#     echo "#"
#     git apply $BENCH_TOP/patches/euler3d_cpu_double.patch
#     make rodinia
# fi


# set up PARSEC
# if [ "${setup}" = "all" ] || [ "${setup}" = "parsec" ]; then
#     echo "#"
#     echo "######################## Download PARSEC Benchmark Suite #########################################"
#     echo "#"
#     if [ ! -d "parsec-3.0" ]; then
#         git clone https://github.com/jyhuang91/parsec-3.0.git
#     fi
#     if [ ! -f "parsec-3.0/pkgs/apps/blackscholes/inputs/input_simlarge.tar" ]; then
#         if [ ! -f "parsec-3.0-input-sim.tar.gz" ]; then
#             wget http://parsec.cs.princeton.edu/download/3.0/parsec-3.0-input-sim.tar.gz
#         fi
#         tar -xzf parsec-3.0-input-sim.tar.gz
#     fi
#     for subdir in apps kernels
#     do
#         for bench in `ls $PARSECDIR/pkgs/$subdir`
#         do
#             # copy input files
#             mkdir -p inputs/parsec/$bench
#             mkdir -p runs/parsec/$bench
#             cd inputs/parsec/$bench
#             for size in test small medium large; do
#                 case "${size}" in
#                     "test")
#                         bminput=$PARSECDIR/pkgs/$subdir/$bench/inputs/input_$size.tar;;
#                     *)
#                         bminput=$PARSECDIR/pkgs/$subdir/$bench/inputs/input_sim$size.tar;;
#                 esac
#                 if [ -f "$bminput" ]; then
#                     tar -xvf $bminput
#                     if [ "${bench}" = "dedup" ] && [ "${size}" != "test" ]; then
#                         mv media.dat ${size}_media.dat
#                     fi
#                 fi
#             done
#             cd -
#         done
#     done
#     cd $BENCH_TOP
#     make parsec
# fi
