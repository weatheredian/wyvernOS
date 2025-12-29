#!/usr/bin/env bash

set -euo pipefail

apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  g++ \
  qt5ct \
  qt5-qmake \
  git

git clone https://github.com/collin80/SavvyCAN.git
mkdir -p /src/ && cp -r SavvyCAN/ /src/
cd /src/SavvyCAN
qmake && make
