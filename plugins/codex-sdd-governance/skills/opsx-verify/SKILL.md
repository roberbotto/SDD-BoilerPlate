---
name: opsx-verify
description: Use when the user wants to verify that an implementation matches the change artifacts before archiving, equivalent to the legacy `opsx:verify` workflow.
---

# OPSX Verify

Canonical source:
- `.claude/commands/opsx/verify.md`

Use this skill to review completeness, correctness, and coherence before archive.

## Rules

- Findings come first.
- Preserve critical versus warning distinctions from the canonical workflow.
- Do not archive as part of verification unless the user explicitly asks to continue into archive.
