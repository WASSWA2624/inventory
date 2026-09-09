# 179 — Infer field types from columns

**Phase** 09 · Templates  |  **Depends on** [178](178-xlsx-header-detection.md), [154](154-field-type-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Suggest a type, unit and option list per column from its sample values.

## Files

- `frontend/lib/core/import/type_inference.dart` (new)

## Steps

1. Detect numbers, dates, booleans, small option sets and identifier patterns.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Suggestions are visibly suggestions, always editable.
- [ ] Tests written and passing: Unit tests over mixed sample columns.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
