#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm -rf ${HOME}/anaconda3
fi

if [[ ! -e "$HOME/anaconda3" ]]; then
    curl https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh -o /tmp/conda.sh
    sh /tmp/conda.sh -b
    source ${HOME}/anaconda3/etc/profile.d/conda.sh

    conda update -y conda
    conda install -y anaconda
fi


