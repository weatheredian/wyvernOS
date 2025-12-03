#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  libliquid-dev \
  libhackrf-dev \
  libuhd-dev \
  libfftw3-dev \
  cmake \
  xxd \
  git

git clone https://github.com/mikeryan/ice9-bluetooth-sniffer.git
mkdir -p /src/ && mv ice9-bluetooth-sniffer/ /src/
cd /src/ice9-bluetooth-sniffer
mkdir build
cd build
cmake ..
make
make install
