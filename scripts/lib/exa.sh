#!/bin/bash
set -xe

#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/exa -f
fi

if ! type exa > /dev/null 2>&1; then
    wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip -O /tmp/exa.zip
    unzip -o /tmp/exa.zip -d /tmp/
    mv /tmp/bin/exa ~/.local/bin/
fi
