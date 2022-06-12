#!/bin/bash
set -xe

if ! type deno > /dev/null 2>&1; then
    export DENO_INSTALL=~/.local/
    curl -fsSL https://deno.land/install.sh | sh
fi
