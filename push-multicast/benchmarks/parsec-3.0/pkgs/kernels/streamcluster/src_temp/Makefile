# Makefile for streamcluster

PREFIX=${PARSECDIR}/pkgs/kernels/streamcluster/inst/${PARSECPLAT}

TARGET=streamcluster
OBJS=streamcluster.o

BENCH_TOP= /home/cyh/cyh/Project_20230611/nuca-project/benchmark

GEM5_INC=/home/cyh/cyh/Project_20230611/nuca-project/nuca-gem5/include
GEM5_OPS=/home/cyh/cyh/Project_20230611/nuca-project/nuca-gem5/util/m5/src/abi/x86/m5op.S

# /hpc/home/huanglab/cyh/Project_20230611/nuca-project/nuca-gem5/util/m5/src/abi/x86/m5op.S

ifdef version
  ifeq "$(version)" "pthreads"
    # CXXFLAGS :=	$(CXXFLAGS) -DENABLE_THREADS -pthread -DGEM5 -I${GEM5_INC} ${GEM5_OPS}
    CXXFLAGS :=	$(CXXFLAGS) -DENABLE_THREADS -pthread
    OBJS += parsec_barrier.o
  endif
  ifeq "$(version)" "openmp"
    CXX := g++
    CXXFLAGS := $(CXXFLAGS) -DSCHED_POLICY=static -fopenmp
    OBJS = omp2_streamcluster.o
	TARGET = streamcluster
  endif
  ifeq "$(version)" "tbb"
    CXXFLAGS := $(CXXFLAGS) -DTBB_VERSION
    LIBS := $(LIBS) -ltbb
  endif
endif

all: $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $(TARGET)

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o $(TARGET)

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(TARGET) $(PREFIX)/bin/$(TARGET)

