#!/bin/bash
set -xe

wget https://raw.githubusercontent.com/kaueraal/run_scaled/master/run_scaled -O ~/.local/bin/
chmod +x ~/.local/bin/run_scaled
sudo apt-get install xpra xvfb
