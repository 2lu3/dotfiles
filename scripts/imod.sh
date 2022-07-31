#!/bin/bash
set -xe

wget https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.11.18_RHEL7-64_CUDA10.1.sh -O /tmp/imod.sh
sudo sh /tmp/imod.sh -yes
