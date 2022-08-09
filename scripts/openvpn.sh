#!/bin/bash
set -xe

wget https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.7.tar.gz -O /tmp/openvpn.tar.gz
mkdir /tmp/openvpn
tar -xvf /tmp/openvpn.tar.gz -C /tmp/openvpn --strip-components 1

pushd /tmp/openvpn/
./configure
make
sudo make install
popd
