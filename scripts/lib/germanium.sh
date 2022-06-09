#!/bin/bash
set -xe

wget https://github.com/matsuyoshi30/germanium/releases/download/v1.2.2/germanium_1.2.2_linux_x86_64.tar.gz -O /tmp/germanium.tar.gz
tar -xvf /tmp/germanium_1.2.2_linux_x86_64.tar.gz -C /tmp/
mv /tmp/germanium ~/.local/bin
