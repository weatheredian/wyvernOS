#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  git \
  swig \
  libboost-all-dev \
  libcppunit-dev \
  liblog4cpp5-dev \
  libsndfile1-dev \
  python3

git clone https://github.com/jcrona/gr-nfc.git
mkdir -p /src/ && cp -r gr-nfc /src/
cd /src/gr-nfc
mkdir build
cd build
cmake -Wno-dev -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
make
make install
ldconfig
