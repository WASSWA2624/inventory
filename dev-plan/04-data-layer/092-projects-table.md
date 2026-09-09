# 092 — Projects table

**Phase** 04 · Local database  |  **Depends on** [086](086-column-mixins.md), [087](087-dao-conventions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Store projects with status, dates, folder name and settings.

## Files

- `frontend/lib/core/db/tables/projects.dart` (new)

## Steps

1. Columns per the specification, with settings held as validated JSON.
2. Index on status and updatedAt for the project list.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: DAO test for create, list and update.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
