#!/bin/zsh


# vim like or emacs like
bindkey -e

bindkey '^]' peco-src

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
