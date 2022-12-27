#!/bin/bash
set -xe


if [[ "$is_init" = true ]]; then
  sudo apt-get purge remove docker docker-engine docker.io containerd runc docker-deksotp
fi


if ! type docker > /dev/null 2>&1; then
  sudo apt-get install gnome-terminal
  rm -fr "${HOME}/.docker/desktop"
  sudo rm -f /usr/local/bin/com.docker.cli

  sudo apt-get update
  sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  

  sudo apt-get update

  wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.15.0-amd64.deb -O /tmp/docker-dekstop.deb
  sudo apt install -y /tmp/docker-desktop.deb

  systemctl --user start docker-desktop
fi
