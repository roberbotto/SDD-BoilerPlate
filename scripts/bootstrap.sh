#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "   SDD Framework Bootstrap Check"
echo "======================================"
echo

ROOT="$(pwd)"

# ------------------------------------------------------------
# 1. Ensure we are in repo root
# ------------------------------------------------------------
if [[ ! -d ".claude" ]]; then
  echo "❌ ERROR: .claude/ directory not found."
  echo "You must run this script from the repository root."
  exit 1
fi

if [[ ! -d ".claude/commands" ]]; then
  echo "❌ ERROR: .claude/commands directory not found."
  echo "This repo may be incomplete."
  exit 1
fi

echo "✅ Repository root detected."
echo

# ------------------------------------------------------------
# 2. Verify custom command folders
# ------------------------------------------------------------
OPSX_DIR=".claude/commands/opsx"
AISPECS_DIR=".claude/commands/ai-specs"

if [[ ! -d "$OPSX_DIR" ]]; then
  echo "❌ ERROR: Missing $OPSX_DIR"
  exit 1
fi

if [[ ! -d "$AISPECS_DIR" ]]; then
  echo "❌ ERROR: Missing $AISPECS_DIR"
  exit 1
fi

OPSX_COUNT=$(find "$OPSX_DIR" -type f -name "*.md" | wc -l | tr -d ' ')
AISPECS_COUNT=$(find "$AISPECS_DIR" -type f -name "*.md" | wc -l | tr -d ' ')

if [[ "$OPSX_COUNT" -eq 0 ]]; then
  echo "❌ ERROR: No opsx command files found."
  exit 1
fi

if [[ "$AISPECS_COUNT" -eq 0 ]]; then
  echo "❌ ERROR: No ai-specs command files found."
  exit 1
fi

echo "✅ opsx commands detected: $OPSX_COUNT"
echo "✅ ai-specs commands detected: $AISPECS_COUNT"
echo

# ------------------------------------------------------------
# 2.1 Verify Codex bridge files
# ------------------------------------------------------------
CODEX_PLUGIN_DIR="plugins/codex-sdd-governance"
AGENTS_FILE="AGENTS.md"
MARKETPLACE_FILE=".agents/plugins/marketplace.json"

if [[ -f "$AGENTS_FILE" ]]; then
  echo "✅ Codex AGENTS.md detected."
else
  echo "⚠️  Codex AGENTS.md not found."
fi

if [[ -f "$CODEX_PLUGIN_DIR/.codex-plugin/plugin.json" ]]; then
  echo "✅ Codex plugin manifest detected."
else
  echo "⚠️  Codex plugin manifest not found at $CODEX_PLUGIN_DIR/.codex-plugin/plugin.json"
fi

if [[ -f "$MARKETPLACE_FILE" ]]; then
  echo "✅ Repo marketplace file detected."
else
  echo "⚠️  Repo marketplace file not found at $MARKETPLACE_FILE"
fi

echo

# ------------------------------------------------------------
# 3. Check OpenSpec CLI installation
# ------------------------------------------------------------
echo "Checking OpenSpec CLI..."

if command -v openspec >/dev/null 2>&1; then
  echo "✅ OpenSpec CLI detected: $(openspec --version 2>/dev/null || echo 'version unknown')"
else
  echo "⚠️  OpenSpec CLI is NOT installed."
  echo
  echo "Install it using your preferred method:"
  echo "  npm install -g @fission-ai/openspec@latest"
  echo "  or"
  echo "  pnpm add -g @fission-ai/openspec@latest"
  echo
fi

echo

# ------------------------------------------------------------
# 4. Detect potential misuse of 'openspec init'
# ------------------------------------------------------------
echo "Verifying repository integrity..."

if [[ ! -d "openspec" ]]; then
  echo "⚠️ WARNING: openspec/ directory not found."
  echo "This template should include it."
fi

# Optional heuristic check:
DEFAULT_MARKER=".claude/commands/default"

if [[ -d "$DEFAULT_MARKER" ]]; then
  echo
  echo "⚠️ It looks like default OpenSpec commands may have been generated."
  echo "If someone ran 'openspec init', custom commands might be overwritten."
  echo
  echo "DO NOT run 'openspec init' in this repository."
fi

echo "✅ Repository structure looks correct."
echo

# ------------------------------------------------------------
# 5. Operator checks
# ------------------------------------------------------------
echo "Checking Codex tooling..."
if command -v codex >/dev/null 2>&1; then
  echo "✅ Codex CLI detected: $(codex --version 2>/dev/null || echo 'version unknown')"
else
  echo "⚠️  Codex CLI is NOT installed or not in PATH."
fi

echo
echo "Next Steps:"
echo
echo "1) Open this folder in Codex App, Codex CLI, or the Codex IDE extension."
echo "2) Ensure the repository root includes AGENTS.md."
echo "3) Install or enable the local plugin at plugins/codex-sdd-governance if you want skill entrypoints."
echo "4) Keep using OpenSpec as the workflow engine."
echo "5) Preserve .claude/commands as the canonical workflow docs until the migration is complete."
echo
echo "IMPORTANT:"
echo "This repository is already initialized."
echo "DO NOT run: openspec init"
echo
echo "Bootstrap completed successfully."
echo "======================================"
