---
name: opsx-continue
description: Use when the user wants to continue artifact creation for an existing OpenSpec change from Codex, equivalent to the legacy `opsx:continue` workflow.
---

# OPSX Continue

Canonical source:
- `.claude/commands/opsx/continue.md`

Use this skill to continue an active change by creating the next ready artifact in sequence.

## Rules

- Read the command file and follow it exactly.
- If the change is ambiguous, ask the user to choose instead of guessing.
- Preserve artifact ordering, dependency reads, and metadata extraction rules from the canonical workflow.
