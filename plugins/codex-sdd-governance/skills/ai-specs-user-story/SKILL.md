---
name: ai-specs-user-story
description: Use when the user wants to create, enrich, validate, or hand off a governed user story from Codex, covering the legacy `ai-specs:new-us`, `ai-specs:enrich-us`, and `ai-specs:handoff-us` workflows.
---

# AI Specs User Story

Canonical sources:
- `.claude/commands/ai-specs/new-us.md`
- `.claude/commands/ai-specs/enrich-us.md`
- `.claude/commands/ai-specs/handoff-us.md`

Use this skill for the full governed user-story pipeline.

## Rules

- Preserve the canonical enriched snapshot markers exactly when enrichment is required.
- Save deterministic local draft snapshots before any external-system update that depends on them.
- If the user only asks for one stage, run only that stage and stop at its documented boundary.
