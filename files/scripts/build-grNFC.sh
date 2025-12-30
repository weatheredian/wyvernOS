#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  git \
  swig

git clone https://github.com/jcrona/gr-nfc.git
mkdir -p /src/ && cp-r gr-nfc /src/
cd /src/gr-nfc
mkdir build
cd build
cmake ..
make
make install
ldconfig
