#!/usr/bin/env bash
set -euo pipefail

repository_root="$(git rev-parse --show-toplevel)"
options_file="$repository_root/dot_config/nvim/lua/config/options.lua"

if ! grep -Fqx 'vim.opt.number = true' "$options_file"; then
    echo "Expected absolute line numbers to be enabled in $options_file" >&2
    exit 1
fi
