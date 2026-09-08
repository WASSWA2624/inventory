# 084 — Drift database bootstrap

**Phase** 04 · Local database  |  **Depends on** [004](../01-orchestration/004-folder-scaffold.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Create the database class, connection and code generation wiring.

## Files

- `frontend/lib/core/db/app_database.dart` (new)

## Steps

1. Open the database in the application support directory with write-ahead logging enabled.
2. Configure code generation and add the build command to the project README.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The database opens, closes cleanly and survives a hot restart.
- [ ] Tests written and passing: Test helper that opens an in-memory database.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
