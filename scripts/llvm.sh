#!/bin/bash
set -xe

wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh
chmod +x /tmp/llvm.sh
/tmp/llvm.sh 14 all
