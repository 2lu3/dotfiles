# Skills

このディレクトリは、ユーザー単位で共有する Codex / Claude Code スキルの正本です。

## 配置規約

1スキル1ディレクトリとし、直下に `SKILL.md` を置きます。

```
~/.agents/skills/<skill-name>/SKILL.md
```

各スキルは `<skill-name>/SKILL.md` に置きます。

chezmoi はこの内容を `~/.codex/skills/` と `~/.claude/skills/` に実体コピーします。既存の `.system`、Paseo 管理スキル、その他のユーザー設定は置き換えません。

プロジェクト固有のスキル（`flow` を含む）は rules リポジトリから必要なプロジェクトだけに導入します。
