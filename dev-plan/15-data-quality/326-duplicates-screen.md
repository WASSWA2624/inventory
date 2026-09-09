# 326 — Duplicates review screen

**Phase** 15 · Data quality  |  **Depends on** [322](322-duplicate-compare.md), [302](../14-records/302-records-list.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Project-level list of pending pairs with the same four actions and a bulk option.

## Files

- `frontend/lib/features/quality/presentation/duplicates_screen.dart` (new)

## Steps

1. Support applying one choice to all remaining pairs in a group.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A hundred pairs can be cleared without opening each record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
