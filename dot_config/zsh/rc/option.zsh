#!/bin/zsh

# setopt や unsetopt でzshのオプションを設定している


setopt share_history        # 履歴を他のzshシェルとリアルタイム共有する

setopt no_flow_control      # C-s/C-q によるフロー制御を使わない
setopt extended_glob        # 拡張グロブを有効にする


setopt print_eight_bit      # 補完候補リストの日本語を適正表示

setopt notify               # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる
setopt auto_param_keys      # カッコの対応などを自動的に補完

setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加


setopt list_packed          # コンパクトに補完リストを表示

setopt auto_cd              # ディレクトリのみで移動
setopt auto_pushd           # 普通に cd するときにもディレクトリスタックにそのディレクトリを入れる
setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除
