# 134 — Operator profile

**Phase** 07 · Account and settings  |  **Depends on** [091](../04-data-layer/091-device-profile-table.md), [078](../03-design-system/078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The local operator identity used for attribution and merge before enrolment, shaped so that signing in later
adopts it rather than replacing it (§71.2).

## Files

- `frontend/lib/features/settings/presentation/operator_profile_screen.dart` (new)

## Steps

1. Fields: name, initials, optional contact. No password and no credential live here — authentication belongs
   to the backend (§70.1), and this task must not grow one.
2. Carry a nullable account identifier beside the local fields from the first migration, so enrolment (498)
   fills it in without a schema change and without rewriting attribution already recorded.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every record captured afterwards carries this name.
- [ ] The profile has room for an account identity it does not yet have, and nothing here authenticates anyone.
- [ ] Tests written and passing: Widget test of validation and save.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
