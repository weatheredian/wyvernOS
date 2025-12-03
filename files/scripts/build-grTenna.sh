#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  git

git clone https://github.com/argilo/gr-tenna.git
mkdir -p /src/ && mv gr-tenna/ /src/
cd /src/gr-tenna
mkdir build
cd build
cmake ..
make
make install
