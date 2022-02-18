#! /bin/sh


# linuxbrewはインストール済みとする

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

brew update

# python関係
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
brew install pyenv pipenv
pyenv install -f 3.8.10
pyenv global 3.8.10

# nodejs
sudo apt-get instal -y nodejs npm
sudo npm install -g n
sudo n stable
sudo apt-get remove -y --purge nodejs npm

# git
sudo apt-get remove -y --purge git
brew install git

# direnv
brew install direnv

# neovim環境構築
brew install neovim 

sudo npm install -g neovim
mkdir -p ~/python_envs/nvim/
cd ~/python_envs/nvim/
pipenv install pynvim

brew install deno fzf xclip

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

# starship
brew install starship exa bat
