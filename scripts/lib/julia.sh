#!/bin/bash

wget https://julialang-s3.julialang.org/bin/musl/x64/1.8/julia-1.8.2-musl-x86_64.tar.gz -O /tmp/julia.tar.gz
sudo tar xvf /tmp/julia.tar.gz -C /opt/

sudo ln -s /opt/julia-1.8.2/ /opt/julia
sudo ln -s /opt/julia/bin/julia /usr/local/bin/julia
