#!/bin/bash
set -xe

pushd $(dirname $0)

# gnome
./lib/gnome.sh

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
./lib/spotify.sh

# typora
./lib/typora.sh

# biscuit
#./lib/biscuit.sh

# run_scaled
#./lib/run_scaled.sh

# slack
snap install slack

popd
