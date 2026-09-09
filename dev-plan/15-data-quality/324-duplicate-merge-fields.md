# 324 — Merge fields between duplicates

**Phase** 15 · Data quality  |  **Depends on** [322](322-duplicate-compare.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Per-field chooser: keep mine, take theirs, or keep both as a note.

## Files

- `frontend/lib/features/quality/presentation/duplicate_merge_sheet.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Photos from the discarded side can be kept on the surviving record.
- [ ] Tests written and passing: Widget test of `duplicate_merge_sheet.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
