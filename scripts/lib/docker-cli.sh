#!/bin/bash
set -xe


if [[ "$is_init" = true ]]; then
  sudo apt-get remove docker docker-engine docker.io containerd runc
fi


if ! type docker > /dev/null 2>&1; then

  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  
  sudo mkdir -p /etc/apt/keyrings
  
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  
  #if [[ -e "/etc/linuxmint" ]]; then
  #  echo "OS: linuxmint"
  #  echo \
  #  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu\
  #  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #else
  #  echo "OS: ubuntu"
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #fi

  sudo apt-get update

  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # dockerをsudoなしで実行できるようにする
  sudo gpasswd -a ${USER} docker
  sudo systemctl restart docker
fi
