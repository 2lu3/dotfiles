#!/bin/bash
set -xe

if ! type clang-14 > /dev/null 2>&1; then
    wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh
    chmod +x /tmp/llvm.sh
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo /tmp/llvm.sh 14 all

    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-14 14
    sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-14 14
    sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-14 14
fi
