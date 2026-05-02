---
name: ai-specs-update-docs
description: Use when the user wants Codex to update project documentation according to the governance rules, equivalent to the legacy `ai-specs:update-docs` workflow.
---

# AI Specs Update Docs

Canonical source:
- `.claude/commands/ai-specs/update-docs.md`
- `ai-specs/specs/documentation-standards.mdc`

Use this skill after code or spec changes that affect technical documentation.

## Rules

- Apply the documentation standards file as mandatory policy.
- Create missing docs from templates when required.
- Keep documentation updates in English unless the repository rule is explicitly changed.
