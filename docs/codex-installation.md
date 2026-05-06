# Codex Installation Guide

This repository ships with a repository-level `AGENTS.md` and repo-local
skills under `.agents/skills/`.

Those Codex-facing artifacts bridge back to the canonical workflow
documents under `.claude/commands/`.

## What You Get

After installation, Codex can load:

- repository instructions from `AGENTS.md`
- repo-local skills from `.agents/skills/`
- workflow skills such as `opsx-new`, `opsx-apply`, `opsx-verify`, `ai-specs-init-brownfield`, and `ai-specs-update-docs`

The legacy Claude commands remain available in `.claude/commands/` and are not removed.

## Packaging Model

The Codex adaptation is implemented through:

- `AGENTS.md`
- `.agents/skills/`

These are the files Codex loads directly.

However, the skills do not duplicate the workflow logic. They route Codex to
the canonical command documents under `.claude/commands/`.

If you want to reuse this adaptation in another repository, copy at least:

- `AGENTS.md`
- `.agents/skills/`
- `.claude/commands/`

Copying only `AGENTS.md` and `.agents/skills/` is not enough with the
current design, because the skills reference `.claude/commands/` as the
source of truth.

## Prerequisites

- A recent Codex build
- This repository checked out locally
- A restartable Codex surface: App, CLI session, or IDE extension session

## Repository-Local Installation

No file copying is required if you use this repository directly.

1. Open the repository root.
2. Confirm these files exist:
   - `AGENTS.md`
   - `.agents/skills/`
3. Restart Codex so it reloads the repository instructions and skills.

## Reusing in Another Repository

If you are transplanting the Codex operator layer into another project:

1. Copy `AGENTS.md` into the target repository root.
2. Copy `.agents/skills/` into the target repository.
3. Copy `.claude/commands/` into the target repository.
4. Restart Codex in that repository so it reloads the instructions and skills.

The bridge is portable, but the skills require the canonical `.claude`
workflow documents to remain available.

## Command Mapping

Use the surface that matches the runtime you are in:

| Surface | Invocation style | Example |
| --- | --- | --- |
| Claude Code | Legacy slash commands | `/opsx:new` |
| Codex | Skills in the composer | `$opsx-new` |
| Claude Code | Legacy slash commands | `/ai-specs:init-brownfield` |
| Codex | Skills in the composer | `$ai-specs-init-brownfield` |

The workflow logic stays the same; only the operator surface changes.

## Codex App

1. Quit and reopen the Codex app after pulling the latest repository changes.
2. Open this repository in the app.
3. Start a new thread in the repository.
4. Invoke a skill explicitly from the composer, for example:

```text
$opsx-new for add-auth
```

Or:

```text
$ai-specs-init-brownfield on this codebase
```

Or:

```text
Use the $ai-specs-user-story skill to enrich this story
```

If you are following the legacy Claude docs, the equivalent command strings are `/opsx:new` and `/ai-specs:init-brownfield`.

## Codex CLI

1. Close any existing interactive Codex session in this repository.
2. Start a new session from the repository root:

```bash
cd /path/to/this/repository
codex
```

3. Ask Codex to use one of the installed skills by name, for example:

```text
Use the $opsx-new skill for add-auth
```

Or:

```text
Use the $ai-specs-update-docs skill after these API changes
```

If you changed skill files and the update does not appear, restart the session.

## Codex IDE Extension

1. Close the current Codex chat session for this workspace.
2. Reopen the workspace rooted at this repository.
3. Start a new Codex chat.
4. Invoke a repository workflow by skill name, for example:

```text
Use the $opsx-apply skill for the active change
```

Or:

```text
Use the $ai-specs-user-story skill to enrich this story
```

## Verification

Use one of these quick checks:

- Ask Codex which instruction files it loaded. It should report `AGENTS.md`.
- Ask Codex to use `$opsx-new`, `$ai-specs-init-brownfield`, or `$ai-specs-user-story`.
- In the Codex app, type `$` in the composer and verify that the relevant skills are available.
- In Claude, confirm the legacy `/opsx:new` and `/ai-specs:init-brownfield` commands are still present.

## Troubleshooting

### Codex still follows old workflow wording

- That is expected in some places. The `.claude/commands/` files are still the canonical workflow definitions while this fork completes the interface migration to Codex.

### Skills appear but the workflow does not behave correctly

- Confirm that `.claude/commands/` is present in the repository.
- The Codex skills under `.agents/skills/` depend on those files as the canonical source.

## Official References

- Repository instruction loading with `AGENTS.md`: `https://developers.openai.com/codex/guides/agents-md`
- Skill discovery and repository skill locations: `https://developers.openai.com/codex/skills`
- Codex app commands and skill invocation in the composer: `https://developers.openai.com/codex/app/commands`
- Codex CLI slash commands: `https://developers.openai.com/codex/cli/slash-commands`
- Codex IDE slash commands: `https://developers.openai.com/codex/ide/slash-commands`
