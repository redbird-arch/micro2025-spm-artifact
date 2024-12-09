#!/bin/bash
cd ./benchmarks

rm -rf ./gem-forge-framework

rm -rf ./libxsmm

rm -rf ./bin

cd ./parsec-3.0/pkgs/apps

rm -rf blackscholes/inst
rm -rf blackscholes/obj
rm -rf bodytrack/inst
rm -rf bodytrack/obj
rm -rf fluidanimate/inst
rm -rf fluidanimate/obj
rm -rf freqmine/inst
rm -rf freqmine/obj
rm -rf swaptions/inst
rm -rf swaptions/obj

cd ../tools
rm -rf */inst
rm -rf */obj

cd ../libs
rm -rf */inst
rm -rf */obj