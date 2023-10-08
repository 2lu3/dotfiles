#!/bin/bash
set -e

pushd $(dirname $0)

source lib/utils.sh

#------------------------------------
# japanese font
#------------------------------------


#------------------------------------
# fcitx5-mozc
#------------------------------------
if should_install fcitx5; then
    sudo apt-get install -y fcitx5-mozc
    im-config -n fcitx5
fi

#------------------------------------
# gnome settings
#------------------------------------

mkdir -p ~/.backup/gnome
dconf dump / > ~/.backup/gnome/$(date +%Y%m%d-%H%M%S)

dconf load / < ./data/gnome

#------------------------------------
# brave
#------------------------------------

if should_install brave-browser; then
    sudo apt-get install -y apt-transport-https curl
    
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt-get update

    sudo apt-get install -y brave-browser
fi

#------------------------------------
# 1password
#------------------------------------

if should_install 1password; then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    sudo apt-get update
    sudo apt-get install -y 1password
fi


#------------------------------------
# chrome
#------------------------------------

if should_install google-chrome; then
    rm /tmp/chrome-stable.deb -f
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome-stable.deb
    sudo apt-get install -y /tmp/chrome-stable.deb
fi

#------------------------------------
# discord
#------------------------------------

flatpak install --noninteractive flathub com.discordapp.Discord

#------------------------------------
# typora
#------------------------------------

if should_install typora; then
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository -y 'deb https://typora.io/linux ./'
    sudo apt-get update
    sudo apt-get install -y typora
fi

#------------------------------------
# zoom
#------------------------------------
flatpak install --noninteractive flathub us.zoom.Zoom

#------------------------------------
# gnome extension manager
#------------------------------------

apt_install gnome-shell-extension-manager extension-manager

#------------------------------------
# tweaks
#------------------------------------
apt_install gnome-tweaks gnome-tweaks

#------------------------------------
# slack
#------------------------------------

flatpak install --noninteractive flathub com.slack.Slack

#------------------------------------
# wezterm
#------------------------------------
flatpak install --noninteractive flathub org.wezfurlong.wezterm

#------------------------------------
# obs studio
#------------------------------------
flatpak install --noninteractive com.obsproject.Studio

#------------------------------------
# vlc
#------------------------------------
sudo snap install vlc

#------------------------------------
# xsel
#------------------------------------
apt_install xsel xsel

#------------------------------------
# code
#------------------------------------
if should_install code; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    sudo apt-get -y install apt-transport-https
    sudo apt-get -y update
    sudo apt-get -y install code 
fi

#------------------------------------
# gitkraken
#------------------------------------
flatpak install --noninteractive gitkraken


#------------------------------------
# zotero
#------------------------------------
if should_install zotero; then
    wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
    sudo apt-get update
    sudo apt-get install -y zotero
fi


#------------------------------------
# run_scaled
#------------------------------------
if should_install run_scaled; then
    wget https://raw.githubusercontent.com/kaueraal/run_scaled/master/run_scaled -O ~/.local/bin/run_scaled
    chmod +x ~/.local/bin/run_scaled
    sudo apt-get install -y xpra xvfb
    sudo python3 -m pip install PyOpenGL==3.1.6 PyOpenGL-accelerate==3.1.6
fi

popd
