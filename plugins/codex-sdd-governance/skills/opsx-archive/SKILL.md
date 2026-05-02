---
name: opsx-archive
description: Use when the user wants to archive a completed OpenSpec change from Codex, equivalent to the legacy `opsx:archive` workflow.
---

# OPSX Archive

Canonical source:
- `.claude/commands/opsx/archive.md`

Use this skill after implementation and verification are complete.

## Rules

- Preserve documentation-update and spec-sync checks from the canonical workflow.
- Do not bypass warnings silently; surface them and confirm when the workflow requires it.
- Move the change into archive only after the documented checks are satisfied or explicitly acknowledged.
