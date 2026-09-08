# 089 — Tombstones table

**Phase** 04 · Local database  |  **Depends on** [086](086-column-mixins.md), [021](../01-orchestration/021-data-safety-rules.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record deletions so they survive merge instead of being resurrected.

## Files

- `frontend/lib/core/db/tables/tombstones.dart` (new)

## Steps

1. Columns: entityType, entityId, deletedAt, deletedByDevice, reason.
2. Provide a helper that writes a tombstone inside the same transaction as the delete.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Deleting any entity always produces exactly one tombstone.
- [ ] Tests written and passing: Unit test for delete plus tombstone atomicity.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
