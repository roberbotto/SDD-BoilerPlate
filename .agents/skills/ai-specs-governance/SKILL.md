---
name: ai-specs-governance
description: Use when the user wants to run or emulate any legacy `ai-specs:*` workflow from this repository in Codex, including `init-greenfield`, `init-brownfield`, `new-us`, `enrich-us`, `handoff-us`, `update-docs`, `commit`, `explain`, and `meta-prompt`.
---

# AI Specs Governance

This skill is the Codex bridge for the governance and standards workflows stored under `.claude/commands/ai-specs/`.

Do not paraphrase the workflow from memory when the repository already defines it. Read the corresponding command file and follow it.

Legacy Claude form:
- `/ai-specs:*`

Codex form:
- `$ai-specs-*`

Prefer the granular sibling skills when the intent is specific:

- [ai-specs-init-brownfield](../ai-specs-init-brownfield/SKILL.md)
- [ai-specs-init-greenfield](../ai-specs-init-greenfield/SKILL.md)
- [ai-specs-update-docs](../ai-specs-update-docs/SKILL.md)
- [ai-specs-user-story](../ai-specs-user-story/SKILL.md)
- [ai-specs-commit](../ai-specs-commit/SKILL.md)
- [ai-specs-explain](../ai-specs-explain/SKILL.md)
- [ai-specs-meta-prompt](../ai-specs-meta-prompt/SKILL.md)

## Routing

Map the requested workflow to the matching file:

- `ai-specs:init-greenfield` -> `.claude/commands/ai-specs/init-greenfield.md`
- `ai-specs:init-brownfield` -> `.claude/commands/ai-specs/init-brownfield.md`
- `ai-specs:new-us` -> `.claude/commands/ai-specs/new-us.md`
- `ai-specs:enrich-us` -> `.claude/commands/ai-specs/enrich-us.md`
- `ai-specs:handoff-us` -> `.claude/commands/ai-specs/handoff-us.md`
- `ai-specs:update-docs` -> `.claude/commands/ai-specs/update-docs.md`
- `ai-specs:commit` -> `.claude/commands/ai-specs/commit.md`
- `ai-specs:explain` -> `.claude/commands/ai-specs/explain.md`
- `ai-specs:meta-prompt` -> `.claude/commands/ai-specs/meta-prompt.md`

If the user describes the objective instead of the command name, infer the closest workflow and announce it.

## Codex translation rules

- Keep `.claude/commands/ai-specs/*.md` as the canonical source until those workflows are fully rewritten for Codex.
- Replace Claude-only interaction patterns with Codex-native behavior:
  - direct user questions instead of `AskUserQuestion`
  - Codex MCP/apps instead of Claude-specific MCP UX
- Preserve all hard guardrails around deterministic snapshots, documentation updates, and standards generation.

## Governance rules

- Always enforce `ai-specs/specs/documentation-standards.mdc`.
- When generating or updating standards, treat templates under `ai-specs/specs/templates/` as structure-only sources.
- When the workflow says documentation is mandatory before archive or commit, enforce it.
- Keep generated technical documentation in English unless the repository rules are explicitly changed.

## Brownfield adoption

For existing systems, prefer `ai-specs:init-brownfield` as the entrypoint. It is the best match for adopting a real codebase into this workflow from Codex.

## Output style

- Be explicit about the selected governance workflow.
- Mention the legacy Claude form when the user is on Claude and the Codex form when the user is on Codex.
- Separate detected facts from assumptions.
- Preserve deterministic artifacts and canonical saved snapshots when the original workflow requires them.
