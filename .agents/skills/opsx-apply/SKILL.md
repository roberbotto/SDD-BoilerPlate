---
name: opsx-apply
description: Use when the user wants Codex to implement the tasks for an OpenSpec change, equivalent to the legacy `opsx:apply` workflow.
---

# OPSX Apply

Canonical source:
- `.claude/commands/opsx/apply.md`

Use this skill for implementation mode.

## Rules

- Treat the change artifacts as the implementation contract.
- Preserve frontend/backend scope detection and design-linked behavior from the canonical workflow.
- Keep code changes focused on pending tasks and mark completed tasks in the task artifact.
