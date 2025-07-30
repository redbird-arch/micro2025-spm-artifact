# Makefile for parallel simulated annealer

CXX=g++
PREFIX=${PARSECDIR}/pkgs/kernels/canneal/inst/${PARSECPLAT}
TARGET=canneal-serial
LIBS:=$(LIBS) -lm

ifdef version
  ifeq "$(version)" "pthreads"
    CXXFLAGS += -DENABLE_THREADS -pthread -march=native
    TARGET=canneal
  endif
  
  ifeq "$(version)" "ompss"
    CXX=mcxx
    CXXFLAGS += -march=native -DENABLE_OMPSS --ompss --no-copy-deps
    TARGET=canneal-ompss
  endif
 
  ifeq "$(version)" "ompss_instr"
    CXX=mcxx
    CXXFLAGS += -march=native -DENABLE_OMPSS --ompss --no-copy-deps --instrument
    TARGET=canneal-ompss_instr
  endif
 
  ifeq "$(version)" "omp2"
    MCXX=g++
    CXXFLAGS += -DENABLE_OMP2 -fopenmp -DSCHED_POLICY=static -march=native
    TARGET=canneal
  endif
 
  ifeq "$(version)" "omp4"
    MCXX=g++
    CXXFLAGS += -DENABLE_OMP4 -fopenmp
    TARGET=canneal
  endif
endif

all: $(TARGET)

$(TARGET):
	$(CXX) $(CXXFLAGS) annealer_thread.cpp -c -o annealer_thread.o
	$(CXX) $(CXXFLAGS) rng.cpp -c -o rng.o
	$(CXX) $(CXXFLAGS) netlist.cpp -c -o netlist.o
	$(CXX) $(CXXFLAGS) main.cpp -c -o main.o
	$(CXX) $(CXXFLAGS) netlist_elem.cpp -c -o netlist_elem.o
	$(CXX)  *.o $(LIBS) $(CXXFLAGS) $(LDFLAGS) -o $(TARGET)

clean:
	rm -f *.o $(TARGET)

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(TARGET) $(PREFIX)/bin/$(TARGET)

