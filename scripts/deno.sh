#!/bin/bash
set -xe

sudo apt-get install -y unzip
export DENO_INSTALL=~/.local/
curl -fsSL https://deno.land/install.sh | sh
