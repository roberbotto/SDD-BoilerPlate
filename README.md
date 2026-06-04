# OpenSpecs SDD System

## What This Is

This repository is a governed Spec-Driven Development framework for Codex.
It is workflow infrastructure, not an application scaffold.

It provides:

- OpenSpecs workflow orchestration
- Native Codex skills under `.agents/skills/`
- Repository operating instructions in `AGENTS.md`
- Technical standards under `ai-specs/specs/`
- Deterministic documentation templates
- Guardrails for verification, documentation, and archive

The goal is to reduce architectural drift and documentation entropy by making
specs the source of truth.

## Development Model

Specifications are the source of truth. Code is an implementation artifact.

The expected lifecycle is:

1. Define or update specs.
2. Create or continue a governed change.
3. Apply the change.
4. Verify artifacts and tasks.
5. Update affected technical documentation.
6. Archive the completed change.

Do not bypass the workflow for product changes.

## Project Architecture

- `AGENTS.md` - Codex repository-level operating instructions
- `.agents/skills/` - native Codex workflow skills
- `ai-specs/` - standards, templates, and technical documentation
- `openspec/` - OpenSpecs workflow state and capability specs
- `docs/` - repository-level usage documentation
- `scripts/` - validation and bootstrap helpers

## Codex Operating Model

Codex workflows are native skills. They are self-contained and do not require
any external command surface.

Core router skills:

- `$opsx-workflow`
- `$ai-specs-governance`

OpenSpecs workflow skills:

- `$opsx-new`
- `$opsx-ff`
- `$opsx-continue`
- `$opsx-apply`
- `$opsx-verify`
- `$opsx-sync`
- `$opsx-archive`
- `$opsx-bulk-archive`
- `$opsx-explore`
- `$opsx-onboard`

AI Specs governance skills:

- `$ai-specs-init-greenfield`
- `$ai-specs-init-brownfield`
- `$ai-specs-new-us`
- `$ai-specs-enrich-us`
- `$ai-specs-handoff-us`
- `$ai-specs-update-docs`
- `$ai-specs-commit`
- `$ai-specs-explain`
- `$ai-specs-meta-prompt`
- `$ai-specs-user-story`

Use the granular skill when the workflow is clear. Use the router skill when
the user intent needs routing.

## Command Domains

The workflow namespaces remain as logical identifiers:

- `opsx:*` - OpenSpecs change lifecycle workflows
- `ai-specs:*` - standards, documentation, user story, and commit governance

In Codex, invoke them through skills, for example:

- `$opsx-new for add-auth`
- `$opsx-apply for the active change`
- `$opsx-archive after verification`
- `$ai-specs-init-brownfield on this codebase`
- `$ai-specs-update-docs after these API changes`
- `$ai-specs-user-story to create and enrich a story`

## Standards

Authoritative technical standards live under:

```text
ai-specs/specs/
```

If standards do not exist yet, initialize them with:

```text
$ai-specs-init-greenfield
```

For an existing system, use:

```text
$ai-specs-init-brownfield
```

## Templates

Templates live under:

```text
ai-specs/specs/templates/
```

Templates define structure only. Generated standards must reflect the actual
project, not generic sample content.

## Quick Start

1. Clone the repository.

```bash
git clone <repo>
cd <repo>
```

2. Open the repository in Codex.

Codex loads `AGENTS.md` from the repository root and discovers skills under
`.agents/skills/`.

3. Run the bootstrap check.

```bash
bash scripts/bootstrap.sh
```

4. Initialize standards.

For a new project:

```text
$ai-specs-init-greenfield
```

For an existing codebase:

```text
$ai-specs-init-brownfield
```

5. Start a governed change.

```text
$opsx-new
```

Then continue through the lifecycle with `$opsx-continue`, `$opsx-apply`,
`$opsx-verify`, and `$opsx-archive`.

## Archive Flow

Archive includes:

1. Artifact verification
2. Task verification
3. Spec sync validation
4. Documentation update
5. API blocking rule
6. Archive execution

This prevents undocumented API changes and unsynced capability specs.

## Final Principle

Standards first. Specs first. Code second.

## License

This project is distributed under the terms of the MIT License.

Copyright (c) 2026 Jonathan Castro Miguel.

See [LICENSE](./LICENSE) for details.
