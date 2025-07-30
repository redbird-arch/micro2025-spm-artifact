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
    if [ -d "install-release/bin" ]; then
        echo "# LLVM installed already"
    else
        bash setup.sh
    fi
    cd $GEM_FORGE_TOP/..
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
fi
