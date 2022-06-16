#!/bin/zsh

#--------------------------------------------------------------
#               History Configuration
#--------------------------------------------------------------

HISTFILE="${Z_DATA_DIR}/zsh_history"    # 履歴を保存するファイル
HISTSIZE=1000                           # メモリ内の履歴の数
SAVEHIST=100000                         # 保存される履歴の数
HISTORY_IGNORE="(ls|l|s|la|ll|cd|pwd|zsh|exit|cd *)"

#--------------------------------------------------------------
#               Uncategorized
#--------------------------------------------------------------


autoload -Uz compinit; compinit
