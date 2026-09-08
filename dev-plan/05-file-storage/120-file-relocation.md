# 120 — Relocate files when context changes

**Phase** 05 · File storage  |  **Depends on** [118](118-photo-path-builder.md), [119](119-file-writer.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Move a record's photos when its context is set or corrected, keeping the database in step.

## Files

- `lib/core/files/file_relocation.dart` (new)

## Steps

1. Move files inside one transaction with the path update; on failure, roll back both.
2. Handle the unfiled case when a context is applied after capture.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Correcting a facility name moves the folder and no reference breaks.
- [ ] Tests written and passing: Test that paths and files agree after relocation.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
