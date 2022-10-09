#!/bin/bash
set -xe

pushd $(dirname $0)

# bash
./lib/bash.sh

# linuxbrew
source ./lib/linuxbrew.sh

# git
./lib/git.sh

# japanese font
./lib/font.sh

# zsh
./lib/zsh.sh

# tmux
./lib/tmux.sh

# llvm
brew install llvm

# python
./lib/conda.sh

# nodejs
source ./lib/nodejs.sh

# neovim
./lib/neovim.sh
brew install deno ripgrep xclip
./lib/fzf.sh
./lib/germanium.sh

# 便利ツール
brew install bat exa direnv peco ghq

# gcm
./lib/gcm.sh

# ruby
brew install ruby

# gnupg
./lib/gnupg.sh

popd
