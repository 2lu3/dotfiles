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
assert_contains '- Each section MUST contain one to three concise bullet points.'
assert_contains '- `指示内容` MUST concisely reconstruct the user'\''s requested outcome so it stands alone. Do not include internal instructions or inferred requests.'
assert_contains '- `作業結果` MUST concisely summarize the work actually performed by the assistant and its outcome.'
assert_contains '- `提案` MUST list only recommended next actions when they would help. Do not add routine or generic suggestions; when no recommendation is useful, write `- なし`.'
