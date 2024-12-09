#!/bin/sh

dir=$(dirname -- "$(realpath $BASH_SOURCE)")

if [ "$(basename -- "$0")" == "$(basename -- "$BASH_SOURCE")" ]; then
    echo "Don't run $0, source it" >&2
    echo "source `basename $BASH_SOURCE` in directory $dir"
    exit 1
fi

if [ "$(dirname -- "$(realpath $BASH_SOURCE)")" != "$PWD" ]; then
    echo "FAIL: source `basename $BASH_SOURCE` in directory $dir"
    return
fi

export BENCH_TOP=$(pwd)

git submodule update --init
cd gem-forge-framework
git apply $BENCH_TOP/patches/gem-forge-gitmodule.patch
git submodule update --init --recursive
source envs.sh
cd ${BENCH_TOP}

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${BENCH_TOP}/gem-forge-framework/llvm/install-release/lib
