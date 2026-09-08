# 321 — Override an existing record

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [320](320-duplicate-compare.md), [090](../04-data-layer/090-audit-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Replace the existing values with the new ones, only after the comparison has been shown.

## Files

- `frontend/lib/features/quality/domain/duplicate_override.dart` (new)

## Steps

1. Preserve previous values in history; write an audit entry naming the override; attach the new photos.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Overriding is impossible without passing through human review.
- [ ] Tests written and passing: Test that history contains the replaced values.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
