# 171 — Identity field selection

**Phase** 09 · Templates  |  **Depends on** [162](162-field-list-editor.md), [153](153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose which fields identify a record for duplicate detection.

## Files

- `frontend/lib/features/templates/presentation/identity_fields_screen.dart` (new)

## Steps

1. Multi-select from existing fields; explain the effect in one sentence.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Duplicate detection has an explicit, visible configuration.
- [ ] Tests written and passing: Widget test of `identity_fields_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
