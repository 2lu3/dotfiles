# load zgen
source ~/.zgen/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then

  # ターミナルの見た目を変更
  zgen load romkatv/powerlevel10k powerlevel10k 
  # コマンドにコマンドにハイライト
  zgen load zdharma-continuum/fast-syntax-highlighting
  # 入力中のコマンドと一致するコマンドを履歴から探してsuggestしてくれる
  zgen load zsh-users/zsh-autosuggestions
  # 補完を強力にする
  zgen load zsh-users/zsh-completions

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit p10k.zsh.
source $Z_RC_DIR/plugin/p10k.zsh

# peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

