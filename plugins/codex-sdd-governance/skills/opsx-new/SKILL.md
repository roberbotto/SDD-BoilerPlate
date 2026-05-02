---
name: opsx-new
description: Use when the user wants to start a new governed OpenSpec change from Codex, equivalent to the legacy `opsx:new` workflow.
---

# OPSX New

This skill is the Codex-native entrypoint for the legacy `opsx:new` workflow.

Canonical source:
- `.claude/commands/opsx/new.md`

## Use this skill when

- The user wants to start a new change.
- The user has an idea, feature, fix, or refactor to turn into an OpenSpec change.
- The user wants the first artifact scaffolded but does not want implementation yet.

## Rules

- Follow `.claude/commands/opsx/new.md` as the source of truth.
- Stop after the change is created, status is shown, and the first artifact instructions are loaded.
- Do not create artifacts beyond the first instruction step unless the user explicitly continues.
