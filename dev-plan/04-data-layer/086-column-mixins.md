# 086 — Shared column mixins

**Phase** 04 · Local database  |  **Depends on** [084](084-drift-setup.md), [031](../02-foundation/031-uuid-service.md), [030](../02-foundation/030-clock-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The identity and change-tracking columns every table shares, defined once.

## Files

- `frontend/lib/core/db/columns.dart` (new)

## Steps

1. Provide id (UUIDv7 text), createdAt, updatedAt, updatedByDevice and rev.
2. Provide a helper that bumps rev and updatedAt on every write.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No table declares these columns by hand.
- [ ] Tests written and passing: Unit test that the write helper always bumps rev.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
