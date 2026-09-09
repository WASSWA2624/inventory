# 368 — Write into predefined rows

**Phase** 18 · Export  |  **Depends on** [367](367-xlsx-template-copy.md), [285](../13-processing/285-row-matching.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Populate the matched row rather than appending, when the template has predefined rows.

## Files

- `frontend/lib/core/export/xlsx_row_targeting.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Rows never found remain visibly empty or marked not found.
- [ ] Tests written and passing: Unit tests of `xlsx_row_targeting.dart` against its fake.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
