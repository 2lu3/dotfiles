#!/bin/bash
set -xe

wget https://github.com/matsuyoshi30/germanium/releases/download/v1.2.2/germanium_1.2.2_linux_x86_64.tar.gz
tar -xvf germanium_1.2.2_linux_x86_64.tar.gz
mv germanium ~/.local/bin
rm germanium_1.2.2_linux_x86_64.tar.gz
