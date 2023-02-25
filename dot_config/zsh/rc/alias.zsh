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

if type docker > /dev/null 2>&1; then
    alias dc='docker compose'
fi

alias pycreate='python3 -m venv .venv && echo "source .venv/bin/activate\nunset PS1" >> .envrc && direnv allow && .venv/bin/pip install -U pip'

alias remoup='systemctl --user start remotessh.service'
alias remodown='systemctl --user stop remotessh.service'
alias rds='sudo du -m / | sort -n | tail -10'

if type xsel > /dev/null 2>&1; then
    alias pbcopy='xsel --clipboard --input'
fi
