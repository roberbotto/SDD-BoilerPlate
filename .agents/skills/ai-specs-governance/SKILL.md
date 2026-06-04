---
name: ai-specs-governance
description: Use when the user wants to run any native `ai-specs:*` governance workflow from Codex, including `init-greenfield`, `init-brownfield`, `new-us`, `enrich-us`, `handoff-us`, `update-docs`, `commit`, `explain`, and `meta-prompt`.
---

# AI Specs Governance

This is the Codex-native router for AI Specs governance workflows. Use the granular native skill matching the user's requested operation. These skills are self-contained and do not require any legacy command files at runtime.

## Routing

- `ai-specs:init-greenfield` -> [ai-specs-init-greenfield](../ai-specs-init-greenfield/SKILL.md)
- `ai-specs:init-brownfield` -> [ai-specs-init-brownfield](../ai-specs-init-brownfield/SKILL.md)
- `ai-specs:new-us` -> [ai-specs-new-us](../ai-specs-new-us/SKILL.md)
- `ai-specs:enrich-us` -> [ai-specs-enrich-us](../ai-specs-enrich-us/SKILL.md)
- `ai-specs:handoff-us` -> [ai-specs-handoff-us](../ai-specs-handoff-us/SKILL.md)
- `ai-specs:update-docs` -> [ai-specs-update-docs](../ai-specs-update-docs/SKILL.md)
- `ai-specs:commit` -> [ai-specs-commit](../ai-specs-commit/SKILL.md)
- `ai-specs:explain` -> [ai-specs-explain](../ai-specs-explain/SKILL.md)
- `ai-specs:meta-prompt` -> [ai-specs-meta-prompt](../ai-specs-meta-prompt/SKILL.md)

If the user describes the objective instead of the command name, infer the closest native workflow and announce it.

## Governance Rules

- Always enforce `ai-specs/specs/documentation-standards.mdc`.
- Treat templates under `ai-specs/specs/templates/` as structure-only sources.
- Enforce documentation updates before governed archive or commit workflows.
- Keep generated technical documentation in English unless repository rules explicitly change.
- Separate detected facts from assumptions.

## Codex Interaction Rules

- Ask the user directly and briefly when selection or confirmation is required.
- Use Codex MCP/apps equivalents for external systems such as Notion, Jira, Figma, Drive, or browser automation.
- Preserve deterministic artifacts and canonical saved snapshots when the workflow requires them.
