#!/bin/bash
set -xe

# https://go.dev/doc/install

wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
rm ./go1.18.3.linux-amd64.tar.gz
