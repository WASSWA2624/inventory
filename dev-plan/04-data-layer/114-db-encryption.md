# 114 — Optional database encryption

**Phase** 04 · Local database  |  **Depends on** [084](084-drift-setup.md), [037](../02-foundation/037-secure-storage-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let a user turn on encryption at rest without changing any query.

## Files

- `frontend/lib/core/db/encryption.dart` (new)

## Steps

1. Swap the connection for an encrypted one, holding the key in secure storage.
2. Migrate an existing plain database on enable, with progress and a safety copy.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Enabling encryption never loses data; disabling requires explicit confirmation.
- [ ] Tests written and passing: Test that the encrypted database opens only with the key.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
