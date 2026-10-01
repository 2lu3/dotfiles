---
applies_to: [all]
---

# Git Operations

- Normal Git state changes, including `git commit`, `git push`, and `git merge`, MAY be performed when they are within the user's explicit request or an invoked lifecycle phase's authorization boundary. Do not request redundant confirmation for an operation that boundary explicitly authorizes.
- Before destructive or history-rewriting operations, MUST obtain explicit user confirmation unless the exact operation was explicitly authorized. This includes `git push --force*`, deleting remote branches or tags, directly pushing to a default or protected branch, `git reset --hard`, `git clean`, and rewriting published or shared history.
- NEVER delete untracked files.
- When merging a PR, MUST use a merge commit (`--merge`); NEVER use squash merge.
- Read-only operations (`git status`, `git diff`, `git log`) MAY be run freely.
- SHOULD commit after each meaningful change (for example, after completing a schema or utility function).
- When not using a skill, MUST work in the current checkout without creating or switching worktrees unless the user explicitly requests it.
