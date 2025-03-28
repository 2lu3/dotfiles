#!/bin/bash
set -xe

wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
sudo apt-get update
sudo apt-get install -y zotero
