# 369 — Photo reference modes

**Phase** 18 · Export  |  **Depends on** [364](364-xlsx-writer.md), [362](362-photo-naming-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Filename, relative path or embedded image, chosen per project.

## Files

- `lib/core/export/xlsx_photo_refs.dart` (new)

## Steps

1. Implement filename and relative path first; embedding adjusts row height and file size.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching mode changes only the photo column.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
