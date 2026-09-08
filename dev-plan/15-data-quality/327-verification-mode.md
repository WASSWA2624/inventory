# 327 — Verification mode switch

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [149](../08-projects/149-project-settings.md), [246](../12-capture/246-identifier-lookup.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Switch a project or session into confirming existing data rather than creating it.

## Files

- `frontend/lib/features/quality/presentation/verification_mode_toggle.dart` (new)

## Steps

1. When on, capture starts from an identifier and prefilled record.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The mode is visible in the status line so no one forgets it is on.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
