#!/bin/bash
set -xe

wget https://raw.githubusercontent.com/kaueraal/run_scaled/master/run_scaled -O ~/.local/bin/run_scaled
chmod +x ~/.local/bin/run_scaled
sudo apt-get install xpra xvfb
sudo python3 -m pip install PyOpenGL==3.1.6 PyOpenGL-accelerate==3.1.6


