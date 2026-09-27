#!/bin/zsh

# setopt や unsetopt でzshのオプションを設定している

setopt share_history        # 履歴を他のzshシェルとリアルタイム共有する
setopt no_flow_control      # C-s/C-q によるフロー制御を使わない
setopt extended_glob        # 拡張グロブを有効にする
setopt print_eight_bit      # 補完候補リストの日本語を適正表示
export REPORTTIME=5
