# load zgen
source ~/.zgen/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load zdharma-continuum/fast-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

  # generate the init script from plugins above
  zgen save
fi
