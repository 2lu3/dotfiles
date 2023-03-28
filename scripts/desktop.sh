#!/bin/bash
set -xe

pushd $(dirname $0)

# japanese font
./lib/font.sh

# gnome
./lib/gnome.sh

# brave
./lib/brave.sh

# 1password
./lib/1password.sh

# docker-cli
./lib/docker-cli.sh

# appimagelauncher
#./lib/appimagelauncher.sh

# openssh server
./lib/server.sh

# chrome 
./lib/chrome.sh

# code
./lib/code.sh

# discord
./lib/discord.sh

# dropbox
#./lib/dropbox.sh

# firefox
#./lib/firefox.sh

# spotify
#./lib/spotify.sh

# typora
./lib/typora.sh

# biscuit
#./lib/biscuit.sh

# run_scaled
#./lib/run_scaled.sh

# zoom
wget https://zoom.us/client/5.12.2.4816/zoom_amd64.deb -O /tmp/zoom.deb
sudo apt-get install -y /tmp/zoom.deb

# genome extension manager
sudo apt-get install -y gnome-shell-extension-manager

# tweaks
sudo apt-get install -y gnome-tweaks

# slack
snap install slack

# flatpak
sudo add-apt-repository -y ppa:flatpak/stable
sudo apt-get update
sudo apt-get install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# macos
#sudo apt-get install -y dbus-x11

# gitcraken
./lib/gitkraken.sh

# obs studio
./lib/obsstadio.sh

# zotero
./lib/zotero.sh


# vlc
./lib/vlc.sh

# virtualbox
./lib/virtualbox.sh

# vagrant
./lib/vagrant.sh

# xsel
sudo apt-get install -y xsel

popd
