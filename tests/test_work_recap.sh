#!/usr/bin/env bash
set -euo pipefail

repository_root="$(git rev-parse --show-toplevel)"
rules_file="$repository_root/dot_agents/rules/general-workflow.md"

assert_contains() {
    local expected="$1"

    if ! grep -Fqx -- "$expected" "$rules_file"; then
        echo "Expected line not found in $rules_file: $expected" >&2
        exit 1
    fi
}

assert_contains '  ### 指示内容'
assert_contains '  ### 作業結果'
assert_contains '  ### 提案'
assert_contains '- Each section MUST contain one to three concise bullet points. When there is no proposal, write `- なし` under `提案`.'
