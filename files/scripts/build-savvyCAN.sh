#!/usr/bin/env bash

set -euo pipefail

apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  g++ \
  qt5ct \
  qt5-qmake \
  git
add-apt-repository universe && apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  libqt5gui5t64 \
  libqt5core5t64 \
  libqt5printsupport5t64 \
  libqt5qml5 \
  libqt5serialbus5-dev \
  libqt5serialport5-dev \
  libqt5widgets5t64 \
  libqt5help5 \
  libqt5network5t64 \
  libqt5opengl5-dev

git clone https://github.com/collin80/SavvyCAN.git
mkdir -p /src/ && cp -r SavvyCAN/ /src/
cd /src/SavvyCAN
qmake && make
