# 373 — Data dictionary writer

**Phase** 18 · Export  |  **Depends on** [372](372-json-writer.md), [154](../09-templates/154-field-type-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Emit the self-describing field catalogue for downstream analysts.

## Files

- `lib/core/export/data_dictionary.dart` (new)

## Steps

1. Include key, label, type, unit, options with codes, required and description per field.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An analyst can interpret the export without the app.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
