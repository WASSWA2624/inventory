# 175 — Read a spreadsheet workbook

**Phase** 09 · Templates  |  **Depends on** [005](../01-orchestration/005-dependency-allowlist.md), [126](../05-file-storage/126-file-validation.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Open an XLSX or CSV and list its sheets and dimensions, off the UI thread.

## Files

- `frontend/lib/core/import/workbook_reader.dart` (new)

## Steps

1. Read sheet names, used range, merged cells and existing rows.
2. Fail clearly on password-protected or corrupt files.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A twenty-sheet workbook opens without freezing the interface.
- [ ] Tests written and passing: Test against a fixture workbook.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
