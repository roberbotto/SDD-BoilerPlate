# Codex Operating Instructions

This repository is a governed Spec-Driven Development framework. Treat it as workflow infrastructure, not as an application scaffold.

## Primary model

1. Specs are the source of truth.
2. Code changes follow specs, not the reverse.
3. Before archiving or committing, update the affected technical documentation.
4. Preserve the deterministic structure under `ai-specs/specs/` and `openspec/`.

## Canonical workflow sources

Until the migration is completed, the legacy command definitions under `.claude/commands/` remain the canonical workflow documents.

- `opsx:*` workflows live in `.claude/commands/opsx/*.md`
- `ai-specs:*` workflows live in `.claude/commands/ai-specs/*.md`

If a user asks to run one of those workflows from Codex, use the Codex bridge skills from `plugins/codex-sdd-governance/skills/` and follow the corresponding `.claude` command file as the source of truth.

## Codex compatibility rules

- In Codex App, CLI, and IDE, prefer skills plus `AGENTS.md` over product-specific custom slash commands.
- If a legacy workflow mentions `AskUserQuestion`, ask the user directly in a concise way when needed.
- If a legacy workflow mentions `TodoWrite`, use plan tracking only when it adds value.
- If a legacy workflow mentions Claude-specific MCP UX, translate it to Codex MCP/apps usage.
- Keep `.claude/` intact unless the user explicitly asks to remove Claude compatibility.

## Documentation rules

Always apply `ai-specs/specs/documentation-standards.mdc`.

Key requirements:

- Write technical documentation in English.
- Update `ai-specs/specs/api-spec.yml` for API changes.
- Update `ai-specs/specs/data-model.md` for data model changes.
- Create missing docs from the templates under `ai-specs/specs/templates/` when required.

## Fork objective

This fork is migrating the operator surface from Claude Code to Codex without losing workflow coverage. Prefer additive Codex-native layers such as:

- `AGENTS.md`
- Codex skills
- Codex plugins
- Codex MCP/app integrations

Do not collapse the governance model into generic coding assistance.
