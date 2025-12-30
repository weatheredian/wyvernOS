#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  cmake \
  make \
  gcc \
  g++ \
  pkg-config \
  libfftw3-dev \
  libmbedtls-dev \
  libsctp-dev \
  libyaml-cpp-dev \
  git

git clone https://github.com/srsRAN/srsRAN_Project.git srsRAN/
mkdir -p /src/ && cp -r srsRAN/ /src/
cd /src/srsRAN
mkdir build
cd build
cmake ..
make -j $(nproc)
make install
