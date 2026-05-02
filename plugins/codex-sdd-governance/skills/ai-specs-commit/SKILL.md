---
name: ai-specs-commit
description: Use when the user wants a governed commit workflow from Codex, equivalent to the legacy `ai-specs:commit` workflow.
---

# AI Specs Commit

Canonical source:
- `.claude/commands/ai-specs/commit.md`

Use this skill when the user wants to prepare a commit under this repository's governance rules.

## Rules

- Review the working tree before composing the commit.
- Keep commits atomic and documentation-aware.
- Only include related files and do not sweep in unrelated changes.
