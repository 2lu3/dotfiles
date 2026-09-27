---
applies_to: [all]
---

# Git Operations

- Before running `git commit`, `git push`, `git merge`, `git rebase`, or similar state-changing commands, MUST ask for confirmation if explicit permission has not been given.
- NEVER delete untracked files.
- When merging a PR, MUST use a merge commit (`--merge`); NEVER use squash merge.
- Read-only operations (`git status`, `git diff`, `git log`) MAY be run freely.
- SHOULD commit after each meaningful change (for example, after completing a schema or utility function).
- When not using a skill, MUST work in the current checkout without creating or switching worktrees unless the user explicitly requests it.
