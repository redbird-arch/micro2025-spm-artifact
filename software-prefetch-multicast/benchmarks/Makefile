BENCH_TOP=$(shell pwd)

GEM_FORGE_BENCH=omp_conv3d2 omp_conv3d2_no_unroll omp_conv3d2_unroll \
				omp_conv3d2_unroll_xy \
				omp_dense_mv omp_dense_mv_blk omp_dense_mv_out \
				pathfinder_kernel

BENCHDIR=${GEM_FORGE_TOP}/transform/benchmark/GemForgeMicroSuite
LLVM_CFLAGS=-O3 -DGEM_FORGE -mavx512f -fopenmp -std=c11 -gline-tables-only

LLVM_RELEASE=${GEM_FORGE_TOP}/llvm/install-release/bin
LLVM_CC=${LLVM_RELEASE}/clang

GEM_FORGE_TRANSFORM_SO=${GEM_FORGE_TOP}/transform/build/src/libLLVMTDGPass.so

# We use debug version to enable the debug flags.
LLVM_DEBUG=${GEM_FORGE_TOP}/llvm/install-debug/bin

GF_GEM5_INC=${GEM_FORGE_TOP}/gem5/include
GF_GEM5_OPS=${GEM_FORGE_TOP}/gem5/util/m5/m5op_x86.S

GEM_FORGE_BIN_DIR=${BENCH_TOP}/bin/gem-forge

GEM5_INC=${BENCH_TOP}/../gem5/include
GEM5_OPS=${BENCH_TOP}/../gem5/util/m5/src/abi/x86/m5op.S

CACHEBW_DIR=${BENCH_TOP}/ArchBenchSuite/level0/cachebw

READBW_MULTILEVEL_DIR=${BENCH_TOP}/ArchBenchSuite/level0/readbw_multilevel

.PHONY: all clean cachebw rodinia gem-forge parsec $(GEM_FORGE_BENCH) $(RODINIA_OMP_DIRS)

all: cachebw cachebw-prefetch-16core cachebw-prefetch-64core cachebw-prefetch-small-llc\
	 readbw_multilevel readbw_multilevel-prefetch-16core readbw_multilevel-prefetch-64core readbw_multilevel-prefetch-small-llc \
	 omp_mlp.exe omp_mlp-prefetch-16core.exe omp_mlp-prefetch-64core.exe \
	 omp_conv3d2_unroll_xy.exe omp_conv3d2_unroll_xy-prefetch-16core.exe omp_conv3d2_unroll_xy-prefetch-64core.exe \
	 omp_dense_mv_blk.exe omp_dense_mv_blk-prefetch-16core.exe omp_dense_mv_blk-prefetch-64core.exe \
	 rodinia

cachebw:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -fstrict-aliasing -static -mavx2 -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${CACHEBW_DIR}/../common/perf_counter_markers.c ${CACHEBW_DIR}/cachebw.c -o cachebw.exe
	mv cachebw.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/cachebw.exe > ${BENCH_TOP}/bin/cachebw.s

cachebw-prefetch-16core:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -fstrict-aliasing -static -mavx2 -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${CACHEBW_DIR}/../common/perf_counter_markers.c ${CACHEBW_DIR}/cachebw-prefetch-16core.c -o cachebw-prefetch-16core.exe
	mv cachebw-prefetch-16core.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/cachebw-prefetch-16core.exe > ${BENCH_TOP}/bin/cachebw-prefetch-16core.s

cachebw-prefetch-64core:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -fstrict-aliasing -static -mavx2 -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${CACHEBW_DIR}/../common/perf_counter_markers.c ${CACHEBW_DIR}/cachebw-prefetch-64core.c -o cachebw-prefetch-64core.exe
	mv cachebw-prefetch-64core.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/cachebw-prefetch-64core.exe > ${BENCH_TOP}/bin/cachebw-prefetch-64core.s

cachebw-prefetch-small-llc:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -fstrict-aliasing -static -mavx2 -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${CACHEBW_DIR}/../common/perf_counter_markers.c ${CACHEBW_DIR}/cachebw-prefetch-small-llc.c -o cachebw-prefetch-small-llc.exe
	mv cachebw-prefetch-small-llc.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/cachebw-prefetch-small-llc.exe > ${BENCH_TOP}/bin/cachebw-prefetch-small-llc.s

readbw_multilevel:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -static -g -mavx2 -fstrict-aliasing -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${READBW_MULTILEVEL_DIR}/readbw_multilevel.c ${READBW_MULTILEVEL_DIR}/../common/perf_counter_markers.c -o readbw_multilevel.exe
	mv readbw_multilevel.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/readbw_multilevel.exe > ${BENCH_TOP}/bin/readbw_multilevel.s

readbw_multilevel-prefetch-16core:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -static -g -mavx2 -fstrict-aliasing -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${READBW_MULTILEVEL_DIR}/readbw_multilevel-prefetch-16core.c ${READBW_MULTILEVEL_DIR}/../common/perf_counter_markers.c -o readbw_multilevel-prefetch-16core.exe
	mv readbw_multilevel-prefetch-16core.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/readbw_multilevel-prefetch-16core.exe > ${BENCH_TOP}/bin/readbw_multilevel-prefetch-16core.s

readbw_multilevel-prefetch-64core:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -static -g -mavx2 -fstrict-aliasing -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${READBW_MULTILEVEL_DIR}/readbw_multilevel-prefetch-64core.c ${READBW_MULTILEVEL_DIR}/../common/perf_counter_markers.c -o readbw_multilevel-prefetch-64core.exe
	mv readbw_multilevel-prefetch-64core.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/readbw_multilevel-prefetch-64core.exe > ${BENCH_TOP}/bin/readbw_multilevel-prefetch-64core.s

readbw_multilevel-prefetch-small-llc:
	mkdir -p ${BENCH_TOP}/bin
	gcc -g -O2 -fopenmp -static -g -mavx2 -fstrict-aliasing -DGEM5 -I${GEM5_INC} ${GEM5_OPS} ${READBW_MULTILEVEL_DIR}/readbw_multilevel-prefetch-small-llc.c ${READBW_MULTILEVEL_DIR}/../common/perf_counter_markers.c -o readbw_multilevel-prefetch-small-llc.exe
	mv readbw_multilevel-prefetch-small-llc.exe ${BENCH_TOP}/bin/
	objdump -S ${BENCH_TOP}/bin/readbw_multilevel-prefetch-small-llc.exe > ${BENCH_TOP}/bin/readbw_multilevel-prefetch-small-llc.s

gem-forge: ${GEM_FORGE_BIN_DIR} $(GEM_FORGE_BENCH)

${GEM_FORGE_BIN_DIR}:
	mkdir -p $@

$(GEM_FORGE_BENCH):
	${LLVM_CC} -static -o ${GEM_FORGE_BIN_DIR}/$@.exe ${BENCHDIR}/$@/$@.c ${LLVM_CFLAGS} -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}

omp_mlp.exe: ${BENCHDIR}/omp_mlp/omp_mlp.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_mlp.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_mlp.exe >| ${GEM_FORGE_BIN_DIR}/omp_mlp.s

omp_mlp-prefetch-16core.exe: ${BENCHDIR}/omp_mlp/omp_mlp.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch16Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_mlp-prefetch-16core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_mlp-prefetch-16core.exe >| ${GEM_FORGE_BIN_DIR}/omp_mlp-prefetch-16core.s

omp_mlp-prefetch-64core.exe: ${BENCHDIR}/omp_mlp/omp_mlp.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch64Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_mlp-prefetch-64core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_mlp-prefetch-64core.exe >| ${GEM_FORGE_BIN_DIR}/omp_mlp-prefetch-64core.s

omp_conv3d2_unroll_xy.exe: ${BENCHDIR}/omp_conv3d2_unroll_xy/omp_conv3d2_unroll_xy.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_conv3d2_unroll_xy.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy.exe > ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy.s

omp_conv3d2_unroll_xy-prefetch-16core.exe: ${BENCHDIR}/omp_conv3d2_unroll_xy/omp_conv3d2_unroll_xy.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch16Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_conv3d2_unroll_xy-prefetch-16core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy-prefetch-16core.exe > ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy-prefetch-16core.s

omp_conv3d2_unroll_xy-prefetch-64core.exe: ${BENCHDIR}/omp_conv3d2_unroll_xy/omp_conv3d2_unroll_xy.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -g -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch64Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_conv3d2_unroll_xy-prefetch-64core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy-prefetch-64core.exe > ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy-prefetch-64core.s

clean_omp_conv3d2_unroll_xy:
	rm ${GEM_FORGE_BIN_DIR}/omp_conv3d2_unroll_xy.exe

omp_dense_mv_blk.exe: ${BENCHDIR}/omp_dense_mv_blk/omp_dense_mv_blk.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -static -o $@ $^ ${LLVM_CFLAGS} -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_dense_mv_blk.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk.exe > ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk.s

omp_dense_mv_blk-prefetch-16core.exe: ${BENCHDIR}/omp_dense_mv_blk/omp_dense_mv_blk.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch16Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_dense_mv_blk-prefetch-16core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk-prefetch-16core.exe > ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk-prefetch-16core.s

omp_dense_mv_blk-prefetch-64core.exe: ${BENCHDIR}/omp_dense_mv_blk/omp_dense_mv_blk.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -static -o $@ $^ ${LLVM_CFLAGS} -DPrefetch64Core -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv omp_dense_mv_blk-prefetch-64core.exe ${GEM_FORGE_BIN_DIR}
	objdump -S ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk-prefetch-64core.exe > ${GEM_FORGE_BIN_DIR}/omp_dense_mv_blk-prefetch-64core.s

pathfinder.exe: ${BENCHDIR}/pathfinder_kernel/pathfinder_kernel.c
	mkdir -p ${GEM_FORGE_BIN_DIR}
	${LLVM_CC} -static -o $@ $^ ${LLVM_CFLAGS} -lomp -lpthread -Wl,--no-as-needed -ffp-contract=off -ldl -I${GF_GEM5_INC} ${GF_GEM5_OPS}
	mv pathfinder.exe ${GEM_FORGE_BIN_DIR}

clean_pathfinder:
	rm ${GEM_FORGE_BIN_DIR}/pathfinder.exe

clean-gem-forge:
	rm -rf ${GEM_FORGE_BIN_DIR}


RODINIA_BASE_DIR=$(BENCH_TOP)/rodinia

RODINIA_BIN_DIR=$(BENCH_TOP)/bin/rodinia

#RODINIA_OMP_DIRS := b+tree backprop bfs cfd heartwall hotspot kmeans lavaMD leukocyte lud nn nw srad streamcluster particlefilter pathfinder mummergpu
RODINIA_OMP_DIRS := backprop bfs lud particlefilter pathfinder-avx512

rodinia:
	mkdir -p $(RODINIA_BIN_DIR)
	cd $(RODINIA_BASE_DIR)/openmp/backprop;             $(MAKE) -f Makefile.gem5; mv backprop.exe $(RODINIA_BIN_DIR); mv backprop-prefetch-16core.exe $(RODINIA_BIN_DIR); mv backprop-prefetch-64core.exe $(RODINIA_BIN_DIR)
	objdump -S ${RODINIA_BIN_DIR}/backprop.exe > ${RODINIA_BIN_DIR}/backprop.s
	objdump -S ${RODINIA_BIN_DIR}/backprop-prefetch-16core.exe > ${RODINIA_BIN_DIR}/backprop-prefetch-16core.s
	objdump -S ${RODINIA_BIN_DIR}/backprop-prefetch-64core.exe > ${RODINIA_BIN_DIR}/backprop-prefetch-64core.s
	cd $(RODINIA_BASE_DIR)/openmp/particlefilter;       $(MAKE) -f Makefile.gem5;  mv ./particlefilter.exe $(RODINIA_BIN_DIR); mv ./particlefilter-prefetch-16core.exe $(RODINIA_BIN_DIR); mv ./particlefilter-prefetch-64core.exe $(RODINIA_BIN_DIR)
	objdump -S ${RODINIA_BIN_DIR}/particlefilter.exe > ${RODINIA_BIN_DIR}/particlefilter.s
	objdump -S ${RODINIA_BIN_DIR}/particlefilter-prefetch-16core.exe > ${RODINIA_BIN_DIR}/particlefilter-prefetch-16core.s
	objdump -S ${RODINIA_BIN_DIR}/particlefilter-prefetch-64core.exe > ${RODINIA_BIN_DIR}/particlefilter-prefetch-64core.s

clean-rodinia:
	rm -rf $(RODINIA_BIN_DIR)
	for dir in $(RODINIA_OMP_DIRS) ; do cd $(RODINIA_BASE_DIR)/openmp/$$dir; $(MAKE) clean -f Makefile.gem5; cd ../.. ; done

clean-cachebw:
	rm -f ${BENCH_TOP}/bin/cachebw.exe

clean:
	rm -rf ${BENCH_TOP}/bin
