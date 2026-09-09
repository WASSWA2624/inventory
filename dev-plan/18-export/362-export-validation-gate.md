# 362 — Pre-export validation

**Phase** 18 · Export  |  **Depends on** [315](../15-data-quality/315-validation-engine.md), [360](360-export-scope.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

List incomplete or unapproved records and offer the three choices.

## Files

- `frontend/lib/features/exports/domain/export_validation.dart` (new)

## Steps

1. Offer Fix now, Exclude them, or Export anyway marked incomplete.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An export marked incomplete says so inside the file itself.
- [ ] Tests written and passing: Test of all three paths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
