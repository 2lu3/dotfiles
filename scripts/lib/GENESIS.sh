# https://www.r-ccs.riken.jp/labs/cbrt/wp-content/uploads/2022/07/GENESIS-2.0.0.pdf
#!/bin/bash
set -xe


# gcc & gfortran
sudo apt-get install -y gfortran gcc g++ build-essential

# openmpi
wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz -O /tmp/openmpi.tar.gz

mkdir /tmp/openmpi
tar -xvf /tmp/openmpi.tar.gz -C /tmp/openmpi --strip-components 1

mkdir -p ~/.local/
pushd /tmp/openmpi/
./configure --prefix=${HOME}/.local CC=gcc CXX=g++ F77=gfortran FC=gfortran
make -j
make install
popd

# lapack
sudo apt-get install -y liblapack-dev libblas-dev
#sudo apt-get install -y cmake
#
#wget https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.10.1.tar.gz -O /tmp/lapack.tar.gz
#mkdir /tmp/lapack
#tar -xvf /tmp/lapack.tar.gz -C /tmp/lapack --strip-components 1
#
#mkdir /tmp/lapack/build
#pushd /tmp/lapack/build
#cmake .. -DCMAKE_INSTALL_LIBDIR=${HOME}/.local/lapack ..
#cmake --build . -j --target install
#popd

# GENESIS
curl -fsSL "https://www.r-ccs.riken.jp/labs/cbrt/?smd_process_download=1&download_id=25561" -o /tmp/genesis.tar.gz2
mkdir /tmp/genesis
tar xvfj /tmp/genesis.tar.gz2 -C /tmp/genesis --strip-components 1
pushd /tmp/genesis
#./configure --prefix=${HOME}/.local --enable-mixed --enable-gpu
./configure --prefix=${HOME}/.local --enable-mixed 
make install
popd
