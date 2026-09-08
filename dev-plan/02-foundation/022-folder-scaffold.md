# 022 — Create the folder skeleton

**Phase** 02 · Project foundation  |  **Depends on** [004](../01-orchestration/004-architecture-rules.md), [019](019-flutter-project-init.md)

## Goal

Lay out lib/ exactly as the architecture rules describe, so no task has to invent a location.

## Files

- `lib/app/` (new)
- `lib/core/` (new)
- `lib/features/` (new)

## Steps

1. Create app/, core/ (db, files, ai, export, import, merge, validation, normalise, security, errors, utils, widgets) and features/ with a placeholder barrel in each.
2. Add a README in lib/ pointing at the architecture document.

## Acceptance

- [ ] Every directory named in the architecture rules exists and is empty of stray code.
