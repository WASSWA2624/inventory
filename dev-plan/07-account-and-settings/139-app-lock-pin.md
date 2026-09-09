# 139 — App lock with PIN

**Phase** 07 · Account and settings  |  **Depends on** [037](../02-foundation/037-secure-storage-service.md), [135](135-settings-shell.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Optional PIN gate on launch and resume.

## Files

- `frontend/lib/features/settings/presentation/app_lock_screen.dart` (new)

## Steps

1. Set, change and remove a PIN; rate-limit attempts; never store the PIN in plain form.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Forgetting the PIN cannot silently wipe data; the recovery path is explained.
- [ ] Tests written and passing: Unit test of hashing and attempt limiting.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
