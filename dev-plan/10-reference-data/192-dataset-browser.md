# 192 — Browse and search dataset rows

**Phase** 10 · Reference data  |  **Depends on** [191](191-dataset-list.md), [062](../03-design-system/062-app-search-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A paged, searchable table of rows.

## Files

- `frontend/lib/features/reference/presentation/dataset_browser_screen.dart` (new)

## Steps

1. Virtualised list with column selection for narrow screens.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Ten thousand rows scroll smoothly.
- [ ] Tests written and passing: Widget test of `dataset_browser_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
