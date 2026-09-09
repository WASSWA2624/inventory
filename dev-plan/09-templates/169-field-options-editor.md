# 169 — Choice options editor

**Phase** 09 · Templates  |  **Depends on** [164](164-field-advanced-attributes.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Manage option lists, with codes for export and aliases for AI mapping.

## Files

- `frontend/lib/features/templates/presentation/field_options_editor.dart` (new)

## Steps

1. Add, reorder, rename and retire options; renaming updates the label only, not stored codes.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Renaming an option does not silently rewrite historical records.
- [ ] Tests written and passing: Widget test of `field_options_editor.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
