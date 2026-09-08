# 179 — Create a template from the mapping

**Phase** 09 · Templates  |  **Depends on** [178](178-xlsx-mapping-screen.md), [153](153-template-model.md), [116](../05-file-storage/116-project-folder-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Persist the template and copy the original workbook, unmodified, into templates/.

## Files

- `frontend/lib/features/templates/data/xlsx_template_import.dart` (new)

## Steps

1. Store sheet name, header row and column letters for export fidelity.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The original file on disk is byte-identical to the one the user chose.
- [ ] Tests written and passing: Hash comparison test before and after import.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
