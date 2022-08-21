#!/bin/bash
set -xe

sudo apt-get install -y fontconfig fonts-ipaexfont

mkdir -p ~/.fonts/
wget https://github.com/mzyy94/RictyDiminished-for-Powerline/raw/master/RictyDiminished-Regular.ttf -O ~/.fonts/RictyDiminished-Regular.ttf
