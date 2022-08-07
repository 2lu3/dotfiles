#!/bin/zsh

if [[ $(command -v nvim) ]]; then
    alias v='nvim'
    alias vi='nvim'
fi

if [[ $(command -v exa) ]]; then
    alias l='exa --icons --git --group-directories-first --color=auto'
    alias ls=l
    alias la='ls -a'
    alias ll='ls -aahl'
    alias lc='clear && ls'
fi

alias pycreate='python3 -m venv .venv && echo "source .venv/bin/activate" > .envrc && direnv allow && pip install -U pip'
