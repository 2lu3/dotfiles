#!/bin/bash
set -xe

#brew install xsel

sudo apt-get install -y tmux

# hmm...
sudo apt-get install -y ncurses-term

sudo chsh -s $(which tmux)
