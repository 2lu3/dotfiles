#!/bin/bash
set -xe

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O /tmp/kraken.deb
sudo apt-get install -y /tmp/kraken.deb
