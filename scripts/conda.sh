#!/bin/bash
set -xe

curl https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh -o /tmp/conda.sh
source ${HOME}/anaconda3/etc/profile.d/conda.sh

conda update conda
conda install anaconda
