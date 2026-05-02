---
name: opsx-sync
description: Use when the user wants to merge delta specs from a change into the main OpenSpec capability specs, equivalent to the legacy `opsx:sync` workflow.
---

# OPSX Sync

Canonical source:
- `.claude/commands/opsx/sync.md`

Use this skill when a change contains delta specs that must be merged into `openspec/specs/`.

## Rules

- Apply delta requirements intelligently instead of copying full files blindly.
- Preserve unaffected scenarios and requirements in the main specs.
- Create missing main capability specs only when required by the delta.
