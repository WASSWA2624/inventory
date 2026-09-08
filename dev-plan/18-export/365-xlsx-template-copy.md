# 365 — Write into a copy of the original workbook

**Phase** 18 · Export  |  **Depends on** [364](364-xlsx-writer.md), [179](../09-templates/179-xlsx-template-create.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Preserve the client's formatting by writing into a copy, never the original.

## Files

- `lib/core/export/xlsx_template_copy.dart` (new)

## Steps

1. Copy the stored template file, then write rows into the mapped sheet and columns.
2. Report in the export summary anything the library could not preserve.

## Constraints

- Validate the chosen library against a real client workbook before committing to it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The stored template file is byte-identical after every export.
- [ ] Tests written and passing: Hash test of the template before and after.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
