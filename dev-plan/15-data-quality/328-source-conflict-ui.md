# 328 — Resolve a source conflict

**Phase** 15 · Data quality  |  **Depends on** [327](327-source-conflict-detection.md), [170](../09-templates/170-field-editor-inline.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Present each candidate with its source and let the user choose or type another.

## Files

- `frontend/lib/features/quality/presentation/conflict_resolution_row.dart` (new)

## Steps

1. Show the evidence behind each candidate; record the chosen value and the reason.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/07-consistency.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record cannot be approved with an unresolved conflict.
- [ ] Tests written and passing: Widget test of `conflict_resolution_row.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
