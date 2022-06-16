#!/bin/zsh

# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# 補完候補を色分け (GNU ls の色定義を流用)
zstyle ':completion:*' list-colors "${LS_COLORS}"
