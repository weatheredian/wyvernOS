#!/usr/bin/env bash

set -euo pipefail

apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  libsndfile1-dev \
  git
apt install -y uhd-host
uhd_images_downloader
git clone https://github.com/muccc/gr-iridium

mkdir -p /src/gr-iridium && mv gr-iridium/ /src/
cd /src/gr-iridium
cmake -B build
cmake --build build -j 2
cmake --install build
ldconfig
