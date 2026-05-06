# 🚀 OpenSpecs SDD System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

### Spec-Driven Development + AI Governance Layer

This repository implements a customized OpenSpecs workflow enhanced with
an AI governance layer.

It enforces:

-   Explicit technical standards
-   Deterministic documentation structure
-   Controlled change lifecycle
-   Spec‑Driven Development (SDD)
-   AI‑governed architectural discipline

------------------------------------------------------------------------

# 🧠 What Is This?

This is not just an OpenSpecs setup.

It is a governed development environment composed of:

-   OpenSpecs (workflow orchestration)
-   Custom Claude commands
-   Explicit backend & frontend standards
-   Documentation enforcement rules
-   Structured templates
-   Blocking policies for incomplete work

The goal is to eliminate architectural drift and documentation entropy.

------------------------------------------------------------------------

# 📐 Development Model: Spec‑Driven Development (SDD)

Specifications are the source of truth.\
Code is an implementation artifact.

The order of operations:

1.  Define or update specs
2.  Apply change
3.  Verify artifacts & tasks
4.  Update documentation
5.  Archive change

No direct coding outside this flow.

------------------------------------------------------------------------

# 🏗 Project Architecture

- `AGENTS.md` → Codex repository-level operating instructions
- `plugins/codex-sdd-governance/` → Codex plugin that exposes bridge skills for this workflow
- `.claude/commands/opsx/` → OpenSpecs workflow commands
- `.claude/commands/ai-specs/` → Governance & standards commands
- `ai-specs/` → Specs, templates, standards, docs
- `openspec/` → OpenSpecs CLI workflow

------------------------------------------------------------------------

# 🤖 Codex Operating Model

This fork adds a Codex-native operator layer without removing the existing
workflow definitions.

## Design Principle

The legacy `.claude/commands/` files remain the **canonical workflow
documents**.

Codex consumes them through:

- `AGENTS.md` for repository-wide persistent instructions
- Codex skills bundled in `plugins/codex-sdd-governance/`
- Native Codex MCP, plugins, and apps where relevant

This avoids duplicating the workflow logic in multiple formats.

## Why Skills Instead of Custom Slash Commands

Codex does not share Claude Code's repository-local slash-command model
across all surfaces.

For this reason, the fork uses:

- **Skills** for workflow entrypoints
- **AGENTS.md** for always-on repository rules
- **Plugins** for portable packaging across Codex surfaces

This makes the workflow portable across:

- Codex desktop app
- Codex CLI
- Codex IDE extension

## Codex Entry Points

The local plugin provides:

- Two router skills:
  - `opsx-workflow`
  - `ai-specs-governance`
- Granular workflow skills:
  - `opsx-new`
  - `opsx-continue`
  - `opsx-apply`
  - `opsx-verify`
  - `opsx-sync`
  - `opsx-archive`
  - `ai-specs-init-brownfield`
  - `ai-specs-init-greenfield`
  - `ai-specs-update-docs`
  - `ai-specs-user-story`
  - `ai-specs-commit`
  - `ai-specs-explain`
  - `ai-specs-meta-prompt`

All of them route Codex to the matching file under `.claude/commands/` and
preserve the original guardrails.

Both operator surfaces are supported:

- Claude Code keeps using `/opsx:*` and `/ai-specs:*`
- Codex uses the matching skills, invoked as `@opsx-*` and `@ai-specs-*`

Examples:

- "`@opsx-new` for `add-auth`"
- "`@ai-specs-init-brownfield` on this codebase"
- "`@opsx-apply` for the active change"
- "`@ai-specs-update-docs` after these API changes"
- "Claude users can keep using `/opsx:new` and `/ai-specs:init-brownfield`"

------------------------------------------------------------------------

# 🔄 Command Domains

The workflow names are still organized by namespace.
In Codex, treat them as logical workflow identifiers exposed through skills,
not as repository-local slash commands.

## 🔄 /opsx:\* --- OpenSpecs Workflow

Lifecycle management commands:

-   /opsx:new --- Claude: start a new change | Codex: `@opsx-new`
-   /opsx:ff --- Claude: fast-forward creation of artifacts | Codex: `@opsx-ff`
-   /opsx:apply --- Claude: implement change artifacts | Codex: `@opsx-apply`
-   /opsx:verify --- Claude: verify implementation vs artifacts | Codex: `@opsx-verify`
-   /opsx:sync --- Claude: sync delta specs into main specs | Codex: `@opsx-sync`
-   /opsx:continue --- Claude: continue experimental workflow | Codex: `@opsx-continue`
-   /opsx:archive --- Claude: archive completed change | Codex: `@opsx-archive`
-   /opsx:bulk-archive --- Claude: archive multiple changes | Codex: `@opsx-bulk-archive`
-   /opsx:explore --- Claude: investigation mode (no implementation) | Codex: `@opsx-explore`
-   /opsx:onboard --- Claude: guided onboarding through workflow | Codex: `@opsx-onboard`

These commands manage the change lifecycle only.

------------------------------------------------------------------------

## 🧠 /ai-specs:\* --- Governance & Execution Layer

These commands manage standards, documentation, planning, and execution.

-   /ai-specs:init-greenfield\
    Claude: generate backend and frontend standards from templates using your tech stack.
    Codex: `@ai-specs-init-greenfield`

-   /ai-specs:update-docs\
    Claude: enforce documentation-standards.mdc (update API spec, data model, development guide).
    Codex: `@ai-specs-update-docs`

-   /ai-specs:new-us\  
    Claude: create a new structured user story aligned with SDD standards.
    Codex: `@ai-specs-new-us`

-   /ai-specs:enrich-us\
    Claude: improve and refine user stories/tickets for clarity and completeness.
    Codex: `@ai-specs-enrich-us`

-   /ai-specs:handoff-us\
    Claude: prepare a validated user story for implementation (technical-ready state).
    Codex: `@ai-specs-handoff-us`

-   /ai-specs:plan-backend-ticket\
    Claude: generate an implementation plan for backend tickets.
    Codex: `@ai-specs-plan-backend-ticket`

-   /ai-specs:plan-frontend-ticket\
    Claude: generate an implementation plan for frontend tickets.
    Codex: `@ai-specs-plan-frontend-ticket`

-   /ai-specs:commit\  
    Claude: structured commit (and optional PR) workflow with governance checks.
    Codex: `@ai-specs-commit`

-   /ai-specs:explain\
    Claude: deep conceptual explanation mode.
    Codex: `@ai-specs-explain`

-   /ai-specs:meta-prompt\
    Claude: improve and structure prompts for better AI execution.
    Codex: `@ai-specs-meta-prompt`

------------------------------------------------------------------------

# 📘 Standards

All authoritative standards live under:

ai-specs/specs/

Standards may initially be empty in greenfield setups.

If backend-standards.mdc or frontend-standards.mdc do not exist, run:

Claude: `/ai-specs:init-greenfield`
Codex: `@ai-specs-init-greenfield`

This generates deterministic, stack‑specific standards from templates.

------------------------------------------------------------------------

# 📄 Templates

Templates live under:

ai-specs/specs/templates/

Templates define structure only (headings and section order).\
They are never copied verbatim.

This fork intentionally keeps the templates **domain-neutral** and
**stack-neutral**. The generated standards must reflect the actual project,
not the previous sample application that originally seeded this repository.

Templates prevent:

-   Documentation drift
-   Structural inconsistency
-   AI output randomness

------------------------------------------------------------------------

# ⚡ QuickStart (Greenfield Setup)

1.  Clone the repository

    git clone `<repo>`{=html} cd `<repo>`{=html}

2.  Open the repository in Codex

    Codex will load `AGENTS.md` automatically at the repository root.

    If you want the bridge skills available in Codex, this repository already
    includes the official local plugin layout:

    - `.agents/plugins/marketplace.json`
    - `plugins/codex-sdd-governance/`

    Installation guide:

    `docs/codex-installation.md`

3.  Initialize standards

    Claude: `/ai-specs:init-greenfield`
    Codex: `@ai-specs-init-greenfield`

    Provide:

    -   Backend stack
    -   Database & ORM
    -   API style
    -   Testing stack
    -   Frontend stack
    -   Tooling & CI

4.  Start a change

    Claude: `/opsx:new`
    Codex: `@opsx-new`

Follow the lifecycle strictly.

For Codex usage, invoke the equivalent workflow through the bridge skills and
plain-language requests instead of relying on Claude-specific slash commands.

------------------------------------------------------------------------

# 🔁 Enhanced Archive Flow

Archive includes:

1.  Artifact verification
2.  Task verification
3.  Spec sync validation
4.  Documentation update
5.  API blocking rule
6.  Archive execution

This ensures no undocumented API changes and no architectural drift.

------------------------------------------------------------------------

# 🎯 Final Principle

Standards first.\
Specs first.\
Code second.

This repository is a controlled development environment, not just a
project scaffold.

------------------------------------------------------------------------

# 📜 License

This project is distributed under the terms of the **MIT License**.

Copyright (c) 2026 Jonathan Castro Miguel.

See the [LICENSE](./LICENSE) file for the full license text.
