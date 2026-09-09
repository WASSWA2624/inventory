# 371 — Photo reference modes

**Phase** 18 · Export  |  **Depends on** [366](366-xlsx-writer.md), [364](364-photo-naming-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Filename, relative path or embedded image, chosen per project.

## Files

- `frontend/lib/core/export/xlsx_photo_refs.dart` (new)

## Steps

1. Implement filename and relative path first; embedding adjusts row height and file size.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching mode changes only the photo column.
- [ ] Tests written and passing: Unit tests of `xlsx_photo_refs.dart` against its fake.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
