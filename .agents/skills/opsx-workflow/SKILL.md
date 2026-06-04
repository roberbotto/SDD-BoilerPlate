---
name: opsx-workflow
description: Use when the user wants to run or continue any native OpenSpec workflow from Codex, including `opsx:new`, `opsx:continue`, `opsx:ff`, `opsx:apply`, `opsx:verify`, `opsx:sync`, `opsx:archive`, `opsx:bulk-archive`, `opsx:explore`, and `opsx:onboard`.
---

# OPSX Workflow

This is the Codex-native router for OpenSpec workflows. Use the granular native skill matching the user's requested operation. These skills are self-contained and do not require any legacy command files at runtime.

## Routing

- `opsx:new` -> [opsx-new](../opsx-new/SKILL.md)
- `opsx:continue` -> [opsx-continue](../opsx-continue/SKILL.md)
- `opsx:ff` -> [opsx-ff](../opsx-ff/SKILL.md)
- `opsx:apply` -> [opsx-apply](../opsx-apply/SKILL.md)
- `opsx:verify` -> [opsx-verify](../opsx-verify/SKILL.md)
- `opsx:sync` -> [opsx-sync](../opsx-sync/SKILL.md)
- `opsx:archive` -> [opsx-archive](../opsx-archive/SKILL.md)
- `opsx:bulk-archive` -> [opsx-bulk-archive](../opsx-bulk-archive/SKILL.md)
- `opsx:explore` -> [opsx-explore](../opsx-explore/SKILL.md)
- `opsx:onboard` -> [opsx-onboard](../opsx-onboard/SKILL.md)

If the user describes intent without naming the command, infer the closest workflow and state which native skill you are using.

## Codex Interaction Rules

- Ask the user directly and briefly when selection or confirmation is required.
- Use Codex plan tracking when the workflow has multiple visible phases.
- Use Codex MCP/apps equivalents for external systems such as Notion, Jira, Figma, Drive, or browser automation.
- Preserve the governed SDD posture: standards first, specs first, code second.

## Scope Discipline

- `opsx:explore` is read-only unless the user explicitly asks to create artifacts.
- `opsx:new` stops after scaffolding and showing the first artifact instructions.
- `opsx:apply` is implementation mode.
- `opsx:verify` and `opsx:archive` must preserve documentation and spec-sync guardrails.
