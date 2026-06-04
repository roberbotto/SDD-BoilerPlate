# Codex Operating Instructions

This repository is a governed Spec-Driven Development framework. Treat it as workflow infrastructure, not as an application scaffold.

## Primary model

1. Specs are the source of truth.
2. Code changes follow specs, not the reverse.
3. Before archiving or committing, update the affected technical documentation.
4. Preserve the deterministic structure under `ai-specs/specs/` and `openspec/`.

## Canonical workflow sources

For Codex, the native workflow definitions live under `.agents/skills/`.
These skills are self-contained and do not require command files from another
operator surface at runtime.

- `opsx:*` workflows are executed through the matching `$opsx-*` skills.
- `ai-specs:*` workflows are executed through the matching `$ai-specs-*` skills.

Use the native skills as the executable source of truth when operating from
Codex. The aggregate router skills are:

- `.agents/skills/opsx-workflow/SKILL.md`
- `.agents/skills/ai-specs-governance/SKILL.md`

For reuse in another repository, copying `AGENTS.md` and `.agents/skills/` is
sufficient for Codex workflow execution.

## Codex compatibility rules

- In Codex App, CLI, and IDE, use skills plus `AGENTS.md` over product-specific custom slash commands.
- Ask the user directly in a concise way when a workflow requires confirmation or selection.
- Use plan tracking only when it adds operational value.
- Use Codex MCP/apps usage for external integrations.
- Codex workflows must depend only on repository-native Codex skills.

## Documentation rules

Always apply `ai-specs/specs/documentation-standards.mdc`.

Key requirements:

- Write technical documentation in English.
- Update `ai-specs/specs/api-spec.yml` for API changes.
- Update `ai-specs/specs/data-model.md` for data model changes.
- Create missing docs from the templates under `ai-specs/specs/templates/` when required.

## Fork objective

This fork provides a native Codex operator surface without losing workflow coverage. Prefer Codex-native layers such as:

- `AGENTS.md`
- Codex skills
- Codex MCP/app integrations

Do not collapse the governance model into generic coding assistance.
