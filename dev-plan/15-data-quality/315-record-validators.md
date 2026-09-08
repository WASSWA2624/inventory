# 315 — Record validators

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [314](314-field-validators.md), [169](../09-templates/169-identity-fields.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Whole-record rules: required fields present, identity present, evidence present when demanded.

## Files

- `lib/core/validation/record_validators.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record cannot be approved with an empty identity field when the template demands one.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
