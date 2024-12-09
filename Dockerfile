FROM ubuntu:20.04

ENV TZ=Asia/Hong_Kong

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt update && \
    apt -y install gcc-8 g++-8 \
    cmake \
    build-essential \
    autoconf \
    libtool \
    zlib1g \
    zlib1g-dev \
    git \
    m4 \
    scons \
    libprotobuf-dev \
    protobuf-compiler \
    libprotoc-dev \
    libgoogle-perftools-dev \
    python3-dev \
    pkg-config \
    python3-pip \
    doxygen \
    libboost-all-dev \
    libhdf5-serial-dev \
    python3-pydot \
    libpng-dev \
    libelf-dev \
    curl \
    wget \
    sudo \
    vim \
    htop && \
    pip3 install six numpy scipy matplotlib pandas seaborn easypyplot
