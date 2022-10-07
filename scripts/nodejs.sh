#!/bin/bash
set -xe

brew install node@16
export PATH="$(brew --prefix)/opt/node@16/bin:${PATH}"
export LDFLAGS="-L$(brew --prefix)/opt/node@16/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/node@16/include"

# node@16 is keg-only, which means it was not symlinked into /home/linuxbrew/.linuxbrew,
# because this is an alternate version of another formula.
# 
# If you need to have node@16 first in your PATH, run:
#   echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@16/bin:$PATH"' >> ~/.profile
# 
# For compilers to find node@16 you may need to set:
#   export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/node@16/lib"
#   export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/node@16/include"
