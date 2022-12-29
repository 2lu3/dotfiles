#!/bin/bash
set -xe
 
wget "https://download.virtualbox.org/virtualbox/7.0.4/virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb" -O /tmp/virtualbox.deb
sudo apt-get install -y  /tmp/virtualbox.deb


