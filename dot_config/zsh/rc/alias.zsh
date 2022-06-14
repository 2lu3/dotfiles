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
