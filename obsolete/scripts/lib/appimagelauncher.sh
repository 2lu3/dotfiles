#!/bin/bash
set -xe

if ! type appimagelauncherd > /dev/null 2>&1; then
    sudo add-apt-repository -y ppa:appimagelauncher-team/stable
    sudo apt-get update
    sudo apt-get install -y appimagelauncher
fi
