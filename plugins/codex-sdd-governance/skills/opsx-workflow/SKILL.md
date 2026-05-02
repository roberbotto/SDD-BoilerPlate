---
name: opsx-workflow
description: Use when the user wants to run, emulate, or continue any legacy `opsx:*` workflow from this repository in Codex, including `opsx:new`, `opsx:continue`, `opsx:ff`, `opsx:apply`, `opsx:verify`, `opsx:sync`, `opsx:archive`, `opsx:bulk-archive`, `opsx:explore`, and `opsx:onboard`.
---

# OPSX Workflow

This skill is the Codex bridge for the legacy OpenSpec workflow commands stored under `.claude/commands/opsx/`.

Do not re-invent the workflow from memory. Read the matching command file and use it as the canonical procedure for the requested action.

Prefer the granular sibling skills when the user's intent is specific:

- [opsx-new](../opsx-new/SKILL.md)
- [opsx-continue](../opsx-continue/SKILL.md)
- [opsx-apply](../opsx-apply/SKILL.md)
- [opsx-verify](../opsx-verify/SKILL.md)
- [opsx-sync](../opsx-sync/SKILL.md)
- [opsx-archive](../opsx-archive/SKILL.md)

## Routing

Map the requested workflow to the matching file:

- `opsx:new` -> `.claude/commands/opsx/new.md`
- `opsx:continue` -> `.claude/commands/opsx/continue.md`
- `opsx:ff` -> `.claude/commands/opsx/ff.md`
- `opsx:apply` -> `.claude/commands/opsx/apply.md`
- `opsx:verify` -> `.claude/commands/opsx/verify.md`
- `opsx:sync` -> `.claude/commands/opsx/sync.md`
- `opsx:archive` -> `.claude/commands/opsx/archive.md`
- `opsx:bulk-archive` -> `.claude/commands/opsx/bulk-archive.md`
- `opsx:explore` -> `.claude/commands/opsx/explore.md`
- `opsx:onboard` -> `.claude/commands/opsx/onboard.md`

If the user describes intent without naming the command, infer the closest workflow and state which one you are using.

## Codex translation rules

- Treat the `.claude` command document as the source of truth for steps, guardrails, and outputs.
- Replace Claude-only interaction patterns with Codex-native behavior:
  - `AskUserQuestion` -> ask the user directly, briefly, only when needed.
  - `TodoWrite` -> use plan tracking if it materially helps.
  - Claude `/mcp` references -> use Codex MCP/apps equivalents.
- Keep the workflow semantics intact even if the operator surface changes.

## Scope discipline

- `opsx:explore` is read-only thinking unless the user explicitly asks to create artifacts.
- `opsx:new` stops after scaffolding and showing the first artifact instructions.
- `opsx:apply` is implementation mode.
- `opsx:verify` and `opsx:archive` must preserve the documentation and sync guardrails from the original workflow.

## Output style

- Be explicit about which workflow you are running.
- Keep the user informed when you switch from artifact work to implementation or archive checks.
- Preserve the repository's governed SDD posture: standards first, specs first, code second.
