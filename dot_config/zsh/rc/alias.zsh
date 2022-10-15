#!/bin/zsh

if type nvim > /dev/null 2>&1; then
    alias v='nvim'
    alias vi='nvim'
fi

if type exa > /dev/null 2>&1; then
    alias l='exa --icons --git --group-directories-first --color=auto'
    alias ls=l
    alias la='ls -a'
    alias ll='ls -aahl'
    alias lc='clear && ls'
fi

alias pycreate='python3 -m venv .venv && echo "source .venv/bin/activate" >> .envrc && direnv allow && .venv/bin/pip install -U pip'

if type docker > /dev/null 2>&1; then
    alias dc='docker compose'
fi


alias remoup='systemctl --user start remotessh.service'
alias remodown='systemctl --user stop remotessh.service'
