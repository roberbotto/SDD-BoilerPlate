# Codex Installation Guide

This repository ships with a local Codex plugin and a repository-level `AGENTS.md`.

The plugin is stored at:

- `plugins/codex-sdd-governance/`

The repository marketplace file is stored at:

- `.agents/plugins/marketplace.json`

These locations follow the official Codex local-plugin convention for repository-scoped plugins.

## What You Get

After installation, Codex can load:

- repository instructions from `AGENTS.md`
- the local plugin `codex-sdd-governance`
- workflow skills such as `opsx-new`, `opsx-apply`, `opsx-verify`, `ai-specs-init-brownfield`, and `ai-specs-update-docs`

The legacy Claude commands remain available in `.claude/commands/` and are not removed.

## Prerequisites

- A recent Codex build with plugin support
- This repository checked out locally
- A restartable Codex surface: App, CLI session, or IDE extension session

## Repository-Local Installation

No file copying is required if you use this repository as the plugin host.

1. Open the repository root.
2. Confirm these files exist:
   - `AGENTS.md`
   - `.agents/plugins/marketplace.json`
   - `plugins/codex-sdd-governance/.codex-plugin/plugin.json`
3. Restart Codex so it reloads the repository marketplace and plugin definitions.

Official reference:

- Codex local plugin installation uses `$REPO_ROOT/.agents/plugins/marketplace.json` and `$REPO_ROOT/plugins/` for repository-local plugins.

## Command Mapping

Use the surface that matches the runtime you are in:

| Surface | Invocation style | Example |
| --- | --- | --- |
| Claude Code | Legacy slash commands | `/opsx:new` |
| Codex | Skills in the composer | `@opsx-new` |
| Claude Code | Legacy slash commands | `/ai-specs:init-brownfield` |
| Codex | Skills in the composer | `@ai-specs-init-brownfield` |

The workflow logic stays the same; only the operator surface changes.

## Codex App

1. Quit and reopen the Codex app after pulling the latest repository changes.
2. Open this repository in the app.
3. Start a new thread in the repository.
4. Invoke a skill explicitly from the composer, for example:

```text
@opsx-new for add-auth
```

Or:

```text
@ai-specs-init-brownfield on this codebase
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
Use the @opsx-new skill for add-auth
```

Or:

```text
Use the @ai-specs-update-docs skill after these API changes
```

If you changed plugin files and the update does not appear, restart the session.

## Codex IDE Extension

1. Close the current Codex chat session for this workspace.
2. Reopen the workspace rooted at this repository.
3. Start a new Codex chat.
4. Invoke a repository workflow by skill name, for example:

```text
Use the @opsx-apply skill for the active change
```

Or:

```text
Use the @ai-specs-user-story skill to enrich this story
```

## Verification

Use one of these quick checks:

- Ask Codex which instruction files it loaded. It should report `AGENTS.md`.
- Ask Codex to use `@opsx-new` or `@ai-specs-init-brownfield`.
- In the Codex app, type `@` in the composer and verify that the relevant skills are available.
- In Claude, confirm the legacy `/opsx:new` and `/ai-specs:init-brownfield` commands are still present.

## Troubleshooting

### The plugin does not appear

- Confirm the repository root contains `.agents/plugins/marketplace.json`.
- Confirm the plugin manifest exists at `plugins/codex-sdd-governance/.codex-plugin/plugin.json`.
- Restart the Codex surface completely.

### The instructions load but the skills do not

- Confirm the plugin path in `.agents/plugins/marketplace.json` is exactly `./plugins/codex-sdd-governance`.
- Confirm the skill files exist under `plugins/codex-sdd-governance/skills/`.
- Restart Codex after editing plugin or skill files.

### Codex still follows old workflow wording

- That is expected in some places. The `.claude/commands/` files are still the canonical workflow definitions while this fork completes the interface migration to Codex.

## Official References

- Plugin installation and repo marketplace layout: `https://developers.openai.com/codex/plugins/build`
- Repository instruction loading with `AGENTS.md`: `https://developers.openai.com/codex/guides/agents-md`
- Skill discovery and repository skill locations: `https://developers.openai.com/codex/skills`
- Codex app commands and skill invocation in the composer: `https://developers.openai.com/codex/app/commands`
- Codex CLI slash commands: `https://developers.openai.com/codex/cli/slash-commands`
- Codex IDE slash commands: `https://developers.openai.com/codex/ide/slash-commands`
