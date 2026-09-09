# 307 — Edit a saved record's fields

**Phase** 14 · Records  |  **Depends on** [306](306-record-detail.md), [170](../09-templates/170-field-editor-inline.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Change values after saving, with history and status consequences.

## Files

- `frontend/lib/features/records/presentation/record_edit_screen.dart` (new)

## Steps

1. Editing an approved record returns it to NEEDS_REVIEW and writes an audit entry.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Nothing about a record is permanently frozen.
- [ ] Tests written and passing: Test of the status transition on edit.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
