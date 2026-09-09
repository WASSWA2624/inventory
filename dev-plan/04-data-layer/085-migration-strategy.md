# 085 — Migration strategy and schema version

**Phase** 04 · Local database  |  **Depends on** [084](084-drift-setup.md), [021](../01-orchestration/021-raw-data-test.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Establish how schema changes ship, so no later table task has to invent it.

## Files

- `frontend/lib/core/db/migrations.dart` (new)

## Steps

1. Implement the migration strategy with a version constant and per-version upgrade steps.
2. Rule: every schema change adds a step and a test; destructive changes require an export prompt first.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Upgrading from any earlier version preserves all rows.
- [ ] Tests written and passing: Migration test from version 1 to head using a seeded database.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
