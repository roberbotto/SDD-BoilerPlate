---
name: ai-specs-init-brownfield
description: Use when the user wants to adopt an existing codebase into this governed workflow from Codex, equivalent to the legacy `ai-specs:init-brownfield` workflow.
---

# AI Specs Init Brownfield

Canonical source:
- `.claude/commands/ai-specs/init-brownfield.md`

This is the preferred entrypoint for bringing a real, existing system into the SDD workflow.

## Rules

- Discover the actual stack before asking the user for missing facts.
- Generate technical and functional baselines without modifying product source code.
- Preserve parity with the canonical workflow outputs: standards, data model, API spec, development guide, and OpenSpec baseline artifacts.
