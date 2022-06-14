#!/bin/zsh


if where nvim /dev/null; then
    alias v='nvim'
    alias vi='nvim'
fi

if where exa /dev/null; then
    alias l='exa --icons --git --group-directories-first --color=auto'
    alias ls=l
    alias la='ls -a'
    alias ll='ls -aahl'
    alias lc='clear && ls'
fi
