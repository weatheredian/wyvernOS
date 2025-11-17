#!/usr/bin/env bash

set -euo pipefail

apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  cmake \
  autoconf \
  libtool \
  pkg-config \
  build-essential \
  libcppunit-dev \
  swig \
  doxygen \
  liblog4cpp5-dev \
  python3-docutils \
  python3-scipy \
  gnuradio-dev \
  liborc-dev \
  libosmocore-dev \
  gr-osmosdr \
  git
git clone https://github.com/ptrkrysik/gr-gsm.git
cd gr-gsm
pwd
cp -r ./ /src/
mkdir -p /src/build
cd /src/build
pwd

cmake .. &&
  # The parallel build sometimes fails when the .grc_gnuradio
  # and .gnuradio directories do not exist
  mkdir $HOME/.grc_gnuradio/ $HOME/.gnuradio/ &&
  make -j $(nproc) &&
  make install &&
  ldconfig &&
  make CTEST_OUTPUT_ON_FAILURE=1 test
