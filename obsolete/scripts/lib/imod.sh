#!/bin/bash
set -xe

wget https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.11.18_RHEL7-64_CUDA10.1.sh -O /tmp/imod.sh
mkdir -p ~/.local/share/
mkdir -p ~/.local/bin/
bash /tmp/imod.sh -yes -dir ~/.local/share -script ~/.local/bin/
chmod +x ~/.local/bin/IMOD-linux.sh

