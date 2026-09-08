# 322 — Merge fields between duplicates

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [320](320-duplicate-compare.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Per-field chooser: keep mine, take theirs, or keep both as a note.

## Files

- `lib/features/quality/presentation/duplicate_merge_sheet.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Photos from the discarded side can be kept on the surviving record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
