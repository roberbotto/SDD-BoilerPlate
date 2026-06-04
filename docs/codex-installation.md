# Codex Installation Guide

This repository ships with native Codex workflow support:

- `AGENTS.md` for repository instructions
- `.agents/skills/` for workflow skills
- `ai-specs/` for standards and documentation rules
- `openspec/` for change and capability specs

The skills are self-contained. No external command surface is required.

## What You Get

After opening the repository in Codex, Codex can load:

- repository instructions from `AGENTS.md`
- repo-local skills from `.agents/skills/`
- workflows such as `$opsx-new`, `$opsx-apply`, `$opsx-verify`,
  `$ai-specs-init-brownfield`, and `$ai-specs-update-docs`

## Packaging Model

For Codex reuse in another repository, copy:

- `AGENTS.md`
- `.agents/skills/`
- `ai-specs/`
- `openspec/`
- supporting documentation and scripts as needed

The executable workflow definitions live in `.agents/skills/`.

## Prerequisites

- A recent Codex build
- This repository checked out locally
- A restartable Codex surface: App, CLI, or IDE extension
- OpenSpec CLI installed for workflows that execute OpenSpec commands

## Repository-Local Installation

No file copying is required if you use this repository directly.

1. Open the repository root.
2. Confirm these paths exist:
   - `AGENTS.md`
   - `.agents/skills/`
   - `openspec/`
   - `ai-specs/`
3. Restart Codex so it reloads repository instructions and skills.

## Reusing in Another Repository

If you are transplanting the Codex operator layer into another project:

1. Copy `AGENTS.md` into the target repository root.
2. Copy `.agents/skills/` into the target repository.
3. Copy `ai-specs/` and `openspec/` if you want the full governed SDD system.
4. Restart Codex in that repository.

## Skill Invocation

Invoke skills directly in Codex:

```text
$opsx-new for add-auth
```

```text
$ai-specs-init-brownfield on this codebase
```

```text
Use $ai-specs-user-story to enrich this story
```

## Codex App

1. Quit and reopen the Codex app after pulling repository changes.
2. Open this repository in the app.
3. Start a new thread in the repository.
4. Invoke a skill explicitly from the composer.

## Codex CLI

Start a new session from the repository root:

```bash
cd /path/to/this/repository
codex
```

Then ask Codex to use one of the installed skills:

```text
Use $opsx-apply for the active change
```

If skill changes do not appear, restart the session.

## Codex IDE Extension

1. Close the current Codex chat session for this workspace.
2. Reopen the workspace rooted at this repository.
3. Start a new Codex chat.
4. Invoke a repository workflow by skill name.

## Verification

Use these checks:

- Ask Codex which instruction files it loaded. It should report `AGENTS.md`.
- Ask Codex to use `$opsx-new`, `$ai-specs-init-brownfield`, or
  `$ai-specs-user-story`.
- Type `$` in the Codex composer and verify that repository skills are
  available.
- Run `bash scripts/bootstrap.sh` from the repository root.

## Troubleshooting

### Skills are not visible

- Restart the Codex surface.
- Confirm the repository root contains `AGENTS.md`.
- Confirm `.agents/skills/` exists and contains `SKILL.md` files.
- Confirm the workspace is opened at the repository root.

### Workflow commands fail

- Confirm OpenSpec CLI is installed.
- Confirm `openspec/` exists.
- Run `bash scripts/bootstrap.sh`.
- Do not run `openspec init` inside this repository.

## Official References

- Repository instruction loading with `AGENTS.md`: `https://developers.openai.com/codex/guides/agents-md`
- Skill discovery and repository skill locations: `https://developers.openai.com/codex/skills`
- Codex app commands and skill invocation in the composer: `https://developers.openai.com/codex/app/commands`
- Codex CLI slash commands: `https://developers.openai.com/codex/cli/slash-commands`
- Codex IDE slash commands: `https://developers.openai.com/codex/ide/slash-commands`
