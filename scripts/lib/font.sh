#!/bin/bash
set -xe

#sudo apt-get install -y fontconfig fonts-ipaexfont
sudo apt-get install -y fontconfig

mkdir -p ~/.local/share/fonts
wget https://github.com/mzyy94/RictyDiminished-for-Powerline/raw/master/RictyDiminished-Regular.ttf -O ~/.local/share/fonts/RictyDiminished-Regular.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -O ~/.local/share/fonts/FiraCodeNF.ttf

fc-cache -f -v
