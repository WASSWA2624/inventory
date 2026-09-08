# 319 — Duplicate prompt on save

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [318](318-duplicate-detection.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Warn at the moment of saving, with the four choices from the specification.

## Files

- `frontend/lib/features/quality/presentation/duplicate_prompt.dart` (new)

## Steps

1. Offer Override existing, Keep both, Discard new and Merge fields.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The prompt never appears without showing the differing values.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
