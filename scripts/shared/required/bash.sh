#!/bin/bash

sed -i '/\.config\/bash\/bashrc/d' ~/.bashrc
echo "source ~/.config/bash/bashrc" >> ~/.bashrc
