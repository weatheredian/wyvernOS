#!/usr/bin/env bash

set -euo pipefail

DEBIAN_FRONTEND=noninteractive
apt update
apt install -y \
  gnuradio-dev \
  gr-osmosdr \
  cmake \
  libsndfile1-dev \
  git
apt install -y uhd-host
uhd_images_downloader
git clone https://github.com/muccc/gr-iridium

mkdir -p /src/gr-iridium && mv gr-iridium/ /src/gr-iridium
cd /src/gr-iridium
cmake -B build
cmake --build build -j 2
cmake --install build
ldconfig
