#!/bin/bash
set -xe



if ! type docker > /dev/null 2>&1; then

  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  
  sudo mkdir -p /etc/apt/keyrings
  
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  
  if [[ -e "/etc/linuxmint" ]]; then
    echo "OS: linuxmint"
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu\
    focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  else
    echo "OS: ubuntu"
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  fi

  curl -fsSL "https://desktop.docker.com/linux/main/amd64/docker-desktop-4.11.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" -o /tmp/docker.deb
  sudo apt-get install  -y /tmp/docker.deb
  systemctl --user start docker-desktop
  systemctl --user enable docker-desktop
fi
