# 413 — Map spreadsheet columns to template fields

**Phase** 20 · Data import  |  **Depends on** [180](../09-templates/180-xlsx-mapping-screen.md), [153](../09-templates/153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Reuse the mapping screen to import rows as records rather than as a template.

## Files

- `frontend/lib/features/import/presentation/record_mapping_screen.dart` (new)

## Steps

1. Require identity fields to be mapped before continuing.

## Reuse

- Reuses the workbook reader, header detection and type inference from the template phase.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The same mapping interface serves both purposes.
- [ ] Tests written and passing: Widget test of `record_mapping_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
