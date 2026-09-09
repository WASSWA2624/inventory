# 198 — Multiple match picker

**Phase** 10 · Reference data  |  **Depends on** [197](197-lookup-fuzzy-match.md), [073](../03-design-system/073-app-bottom-sheet.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Ask the operator when several rows match.

## Files

- `frontend/lib/features/reference/presentation/lookup_picker_sheet.dart` (new)

## Steps

1. Show the distinguishing columns, not just the name.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
