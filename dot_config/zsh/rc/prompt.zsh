# timeコマンドの見た目を変更する
# https://dev.classmethod.jp/articles/zsh-time-command-formatting-like-bash/
TIMEFMT=$'\n\n========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n'

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
