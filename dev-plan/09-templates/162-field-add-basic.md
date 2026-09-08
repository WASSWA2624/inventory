# 162 — Add a field: label, type, required

**Phase** 09 · Templates  |  **Depends on** [161](161-field-list-editor.md), [154](154-field-type-registry.md), [059](../03-design-system/059-app-choice-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The three-question add flow, with everything else defaulted.

## Files

- `lib/features/templates/presentation/field_add_sheet.dart` (new)

## Steps

1. Generate the field key from the label, guaranteeing uniqueness and stability.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A field can be added in under ten seconds.
- [ ] Tests written and passing: Test of key generation and collision handling.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
