---
name: ai-specs-user-story
description: Use when the user wants to create, enrich, validate, or hand off a governed user story from Codex, covering `ai-specs:new-us`, `ai-specs:enrich-us`, and `ai-specs:handoff-us`.
---

# AI Specs User Story

This is the Codex-native router for governed user-story workflows. Use the granular native skill matching the requested stage. These skills are self-contained and do not require any legacy command files at runtime.

## Routing

- `ai-specs:new-us` -> [ai-specs-new-us](../ai-specs-new-us/SKILL.md)
- `ai-specs:enrich-us` -> [ai-specs-enrich-us](../ai-specs-enrich-us/SKILL.md)
- `ai-specs:handoff-us` -> [ai-specs-handoff-us](../ai-specs-handoff-us/SKILL.md)

## Rules

- Preserve canonical enriched snapshot markers exactly when enrichment is required.
- Save deterministic local draft snapshots before any external-system update that depends on them.
- If the user only asks for one stage, run only that stage and stop at its documented boundary.
- Ask the user directly and briefly when source selection, validation, or handoff confirmation is required.
- Use Codex MCP/apps equivalents for Notion, Jira, Figma, or any other external integration.
