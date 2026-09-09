# 369 — Raw and refined column pairs

**Phase** 18 · Export  |  **Depends on** [366](366-xlsx-writer.md), [337](../16-review/337-raw-refined-toggle.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Emit paired columns for refined fields, as the specification describes.

## Files

- `frontend/lib/core/export/xlsx_refined_columns.dart` (new)

## Steps

1. Insert the companion column with a clear header suffix without disturbing existing mappings.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Both versions appear side by side and neither is lost.
- [ ] Tests written and passing: Test asserting both columns and their headers.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
