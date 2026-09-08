# 003 — Coding standards and naming

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [001](001-how-to-use-this-plan.md)

## Goal

Settle naming, file layout and formatting so 400 tasks produce one codebase, not forty dialects.

## Files

- `dev-plan/01-orchestration/_standards.md` (new)

## Steps

1. Files snake_case; types PascalCase; providers camelCase ending in Provider; one public type per file.
2. Feature folder shape is fixed: data/, domain/, presentation/ with widgets/ under presentation.
3. Domain layer imports nothing from Flutter, Drift or any provider SDK.
4. Every user-facing string goes through the copy helper, never inline in a widget.

## Acceptance

- [ ] A reviewer can reject a file by pointing at a numbered rule in this document.
