# 410 — Import entry point

**Phase** 20 · Importing existing data  |  **Depends on** [126](../05-file-storage/126-file-validation.md), [073](../03-design-system/073-app-bottom-sheet.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One place to bring anything in: bundle, spreadsheet, dataset or template.

## Files

- `frontend/lib/features/import/presentation/import_screen.dart` (new)

## Steps

1. Detect the file kind and route to the right flow; explain each choice in one line.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A user never has to know which importer to pick.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
