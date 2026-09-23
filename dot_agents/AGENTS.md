# Global agent settings

The shared rules in `~/.agents/rules/` are the source of truth for every
repository. Apply every rule marked `applies_to: [all]`:

- `~/.agents/rules/general-workflow.md`
- `~/.agents/rules/git.md`
- `~/.agents/rules/task-management.md`
- `~/.agents/rules/python.md`

Common skills are maintained in `~/.agents/skills/` and rendered into the
Codex and Claude skill directories by chezmoi. Project-specific profiles and
the `flow` skill remain owned by the rules repository.
