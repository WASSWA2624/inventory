# 380 — Meeting minutes PDF

**Phase** 18 · Export  |  **Depends on** [376](376-pdf-engine.md), [354](../17-meetings/354-minutes-refinement.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Formatted minutes with attendance list and photo appendix.

## Files

- `frontend/lib/core/export/pdf/minutes_report.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Both raw and refined minutes can be included, clearly labelled.
- [ ] Tests written and passing: Unit tests of `minutes_report.dart` against its fake.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
