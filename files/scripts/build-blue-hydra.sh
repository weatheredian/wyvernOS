#!/usr/bin/env bash

set -euo pipefail

apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  bluez \
  bluez-test-scripts \
  python3-bluez \
  python3-dbus \
  ubertooth \
  sqlite3 \
  libsqlite3-dev \
  git

apt-get install -y ruby-dev bundler

git clone https://github.com/ZeroChaos-/blue_hydra.git
cp -r blue_hydra /src/blue_hydra
cd /src/blue_hydra
bundler install
