#!/bin/bash

# require: nodejs, pyenv

if should_install nvim; then
    # ========== neovim ==========
    # https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

    sudo snap install --beta nvim --classic

    # ========== dependencies ==========

    # required for telescope
    apt_install fd-find fdfind

    # nodejs
    if ! npm ls --location=global | grep neovim >/dev/null; then
        sudo npm install --location=global neovim
    fi
    if [[ "$is_init" = true ]]; then
        sudo npm update -g
    fi

    # python
    if [[ "$is_init" = true ]]; then
        rm ~/.pynvim/ -rf
    fi
    if [[ ! -e "$HOME/.pynvim" ]]; then
        python3 -m venv ~/.pynvim
        ~/.pynvim/bin/pip install -U pip
        ~/.pynvim/bin/pip install pynvim doq
    fi

    # trach-cli
    apt_install trash-cli trash

    # deno
    if [[ "$is_init" = true ]]; then
        rm ~/.local/bin/deno -f
    fi

    if should_install deno; then
        export DENO_INSTALL=~/.local/
        curl -fsSL https://deno.land/install.sh | sh
    fi

    # ripgrep
    apt_install ripgrep rg

    # xclip
    apt_install xclip xclip

    # fzf
    if [[ "$is_init" = true ]]; then
        rm ~/.fzf -rf
    fi

    if [[ ! -e "$HOME/.fzf" ]]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --no-completion --no-key-bindings --no-update-rc
    fi

    # germanium
    if [[ "$is_init" = true ]]; then
        rm ~/.local/bin/germanium -f
    fi

    if should_install germanium; then
        wget https://github.com/matsuyoshi30/germanium/releases/download/v1.2.2/germanium_1.2.2_linux_x86_64.tar.gz -O /tmp/germanium.tar.gz
        tar -xvf /tmp/germanium.tar.gz -C /tmp/
        mv /tmp/germanium ~/.local/bin
    fi
fi

