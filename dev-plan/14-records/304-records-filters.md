# 304 — Filter records

**Phase** 14 · Records  |  **Depends on** [302](302-records-list.md), [063](../03-design-system/063-app-chip.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Filter by context, template, status, date, operator, condition and the quality flags.

## Files

- `frontend/lib/features/records/presentation/records_filter_sheet.dart` (new)

## Steps

1. Show active filters as removable chips; persist the last filter per project.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Filters combine and are clearable in one tap.
- [ ] Tests written and passing: Widget test of `records_filter_sheet.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
