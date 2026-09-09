# 341 — Mark a field verified

**Phase** 16 · Review  |  **Depends on** [170](../09-templates/170-field-editor-inline.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

An explicit verification action for critical fields, separate from editing.

## Files

- `frontend/lib/features/review/presentation/verify_action.dart` (new)

## Steps

1. Allow bulk verify for all confident fields in one action.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Verified values are protected from later automatic overwrite.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
