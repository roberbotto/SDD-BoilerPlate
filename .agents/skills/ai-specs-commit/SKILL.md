---
name: ai-specs-commit
description: Native Codex workflow for `ai-specs:commit`. Create a structured commit and optionally open/update a PR
---

# AI-SPECS Commit

This is a Codex-native skill. It is self-contained and does not require any legacy command files at runtime.

Create a structured commit following project standards.

Codex skill: `$ai-specs-commit`

## Steps

1.  Review changes

    -   Run `git status`
    -   Run `git diff`
    -   Ensure only relevant files are included

2.  Write commit message

    -   Use clear, descriptive English
    -   Follow project language rules defined in `CLAUDE.md`
    -   Prefer small, focused commits
    -   Use conventional commit style if applicable

    Example:

    feat(auth): add JWT validation middleware

    -   Implement token verification
    -   Add unit tests
    -   Update api-spec.yml

3.  Create commit

    ``` bash
    git add <files>
    git commit -m "<message>"
    ```

4.  (Optional) Open or update Pull Request

    -   Use GitHub CLI (`gh`) when available:

    ``` bash
    gh pr create --fill
    ```

    or update existing PR:

    ``` bash
    gh pr status
    ```

## Guardrails

-   Do not include unrelated changes
-   Ensure documentation is up to date before committing
-   Keep commits atomic and reversible
-   Never reference non-existent standards files
