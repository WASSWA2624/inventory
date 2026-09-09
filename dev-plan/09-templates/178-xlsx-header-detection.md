# 178 — Detect the header row

**Phase** 09 · Templates  |  **Depends on** [177](177-xlsx-read-workbook.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Find the header row automatically and let the user correct it.

## Files

- `frontend/lib/core/import/header_detection.dart` (new)

## Steps

1. Score candidate rows by text density and uniqueness; show the chosen row for confirmation.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A workbook with a title block above the header still maps correctly.
- [ ] Tests written and passing: Unit tests over fixtures with and without title rows.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
