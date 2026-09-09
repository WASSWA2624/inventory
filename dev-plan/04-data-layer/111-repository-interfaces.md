# 111 — Repository interfaces

**Phase** 04 · Local database  |  **Depends on** [010](../01-orchestration/010-layering-test.md), [087](087-dao-conventions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Declare the domain-facing contracts so features never see Drift types.

## Files

- `frontend/lib/features/*/domain/*_repository.dart` (new)

## Steps

1. Define interfaces for project, template, record, photo, reference, processing, export and merge repositories.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Presentation code compiles without importing the database package.
- [ ] Tests written and passing: Unit tests of `*_repository.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
