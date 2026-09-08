#!/bin/zsh

# Ignore case while completing, without lower-casing typed uppercase letters.
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# Reuse GNU ls color definitions for completion candidates.
zstyle ':completion:*' list-colors "${LS_COLORS}"
