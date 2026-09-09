# 195 — Configure a lookup field

**Phase** 10 · Reference data  |  **Depends on** [186](186-dataset-model.md), [164](../09-templates/164-field-advanced-attributes.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Bind a field to a dataset and map which columns fill which fields.

## Files

- `frontend/lib/features/templates/presentation/lookup_binding_screen.dart` (new)

## Steps

1. Choose dataset, match columns, fill mapping, fuzzy on or off, and no-match behaviour.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The configuration matches the specification example exactly.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
