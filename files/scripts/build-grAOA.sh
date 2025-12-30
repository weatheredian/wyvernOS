#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  git

git clone https://github.com/MarcinWachowiak/gr-aoa.git
mkdir -p /src/ && cp -r gr-aoa/ /src/
cd /src/gr-aoa

mkdir build
cd build
cmake ..
make -j$(nproc)

make install
ldconfig
