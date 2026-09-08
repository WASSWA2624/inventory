# 113 — Database integrity check

**Phase** 04 · Local database  |  **Depends on** [085](085-migration-strategy.md), [088](088-transaction-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A startup check that catches orphaned rows and missing files early.

## Files

- `lib/core/db/integrity_check.dart` (new)

## Steps

1. Detect record fields without a record, photos whose file is missing, and jobs referencing deleted records.
2. Report findings to a maintenance screen rather than deleting anything automatically.

## Constraints

- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A corrupted state is reported, never silently repaired.
- [ ] Tests written and passing: Unit test with deliberately orphaned rows.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
