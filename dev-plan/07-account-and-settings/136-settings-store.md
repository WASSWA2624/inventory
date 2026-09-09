# 136 — Settings store

**Phase** 07 · Account and settings  |  **Depends on** [025](../02-foundation/025-app-constants.md), [091](../04-data-layer/091-device-profile-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One typed store for app-wide preferences with defaults and migration.

## Files

- `frontend/lib/features/settings/data/settings_store.dart` (new)

## Steps

1. Typed keys with defaults; a change stream so screens react immediately.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No feature reads preferences by raw string key.
- [ ] Tests written and passing: Unit test of defaults and change notification.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
