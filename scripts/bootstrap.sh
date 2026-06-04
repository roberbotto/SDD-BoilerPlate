#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "   SDD Framework Bootstrap Check"
echo "======================================"
echo

# ------------------------------------------------------------
# 1. Ensure we are in repo root
# ------------------------------------------------------------
if [[ ! -f "AGENTS.md" ]]; then
  echo "ERROR: AGENTS.md not found."
  echo "Run this script from the repository root."
  exit 1
fi

if [[ ! -d ".agents/skills" ]]; then
  echo "ERROR: .agents/skills/ directory not found."
  echo "This repository is missing native Codex workflow skills."
  exit 1
fi

echo "Repository root detected."
echo

# ------------------------------------------------------------
# 2. Verify native Codex skills
# ------------------------------------------------------------
REQUIRED_SKILLS=(
  "opsx-workflow"
  "opsx-new"
  "opsx-ff"
  "opsx-continue"
  "opsx-apply"
  "opsx-verify"
  "opsx-sync"
  "opsx-archive"
  "opsx-bulk-archive"
  "opsx-explore"
  "opsx-onboard"
  "ai-specs-governance"
  "ai-specs-init-greenfield"
  "ai-specs-init-brownfield"
  "ai-specs-new-us"
  "ai-specs-enrich-us"
  "ai-specs-handoff-us"
  "ai-specs-update-docs"
  "ai-specs-commit"
  "ai-specs-explain"
  "ai-specs-meta-prompt"
  "ai-specs-user-story"
)

MISSING=()
for skill in "${REQUIRED_SKILLS[@]}"; do
  if [[ ! -f ".agents/skills/$skill/SKILL.md" ]]; then
    MISSING+=("$skill")
  fi
done

if [[ "${#MISSING[@]}" -gt 0 ]]; then
  echo "ERROR: Missing native Codex skills:"
  printf '  - %s\n' "${MISSING[@]}"
  exit 1
fi

SKILL_COUNT=$(find ".agents/skills" -mindepth 2 -maxdepth 2 -name "SKILL.md" | wc -l | tr -d ' ')
echo "Native Codex skills detected: $SKILL_COUNT"
echo

# ------------------------------------------------------------
# 3. Verify governed repository structure
# ------------------------------------------------------------
if [[ ! -d "openspec" ]]; then
  echo "WARNING: openspec/ directory not found."
  echo "This template normally includes OpenSpec workflow state."
else
  echo "OpenSpec directory detected."
fi

if [[ ! -d "ai-specs/specs" ]]; then
  echo "WARNING: ai-specs/specs/ directory not found."
  echo "Technical standards and documentation rules may be missing."
else
  echo "AI specs directory detected."
fi

if [[ ! -f "ai-specs/specs/documentation-standards.mdc" ]]; then
  echo "WARNING: documentation standards file is missing."
fi

echo

# ------------------------------------------------------------
# 4. Check OpenSpec CLI installation
# ------------------------------------------------------------
echo "Checking OpenSpec CLI..."

if command -v openspec >/dev/null 2>&1; then
  echo "OpenSpec CLI detected: $(openspec --version 2>/dev/null || echo 'version unknown')"
else
  echo "WARNING: OpenSpec CLI is not installed."
  echo
  echo "Install it using your preferred method:"
  echo "  npm install -g @fission-ai/openspec@latest"
  echo "  or"
  echo "  pnpm add -g @fission-ai/openspec@latest"
fi

echo

# ------------------------------------------------------------
# 5. Operator checks
# ------------------------------------------------------------
echo "Checking Codex tooling..."
if command -v codex >/dev/null 2>&1; then
  echo "Codex CLI detected: $(codex --version 2>/dev/null || echo 'version unknown')"
else
  echo "WARNING: Codex CLI is not installed or not in PATH."
fi

echo
echo "Next Steps:"
echo
echo "1) Open this folder in Codex App, Codex CLI, or the Codex IDE extension."
echo "2) Confirm Codex loads AGENTS.md."
echo "3) Invoke native skills such as \$ai-specs-init-greenfield or \$opsx-new."
echo "4) Keep using OpenSpec as the workflow engine."
echo
echo "IMPORTANT:"
echo "This repository is already initialized."
echo "Do not run: openspec init"
echo
echo "Bootstrap completed successfully."
echo "======================================"
