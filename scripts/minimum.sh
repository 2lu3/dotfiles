#!/bin/bash
set -xe

pushd $(dirname $0)

sudo apt-get update
sudo apt-get upgrade -y

# bashrc
./lib/bash.sh

# git
./lib/git.sh

# devbox
./lib/devbox.sh

# zsh
./lib/zsh.sh

# nodejs
./lib/nodejs.sh

# neovim
./lib/neovim.sh
./lib/deno.sh
./lib/ripgrep.sh
./lib/xclip.sh
./lib/fzf.sh
./lib/germanium.sh

# useful tools
./lib/bat.sh
./lib/exa.sh
./lib/direnv.sh
./lib/peco.sh
./lib/ghq.sh

# gcm
./lib/gcm.sh

# gnupg
./lib/gnome.sh

popd
