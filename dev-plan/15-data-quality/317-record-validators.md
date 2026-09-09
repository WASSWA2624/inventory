# 317 — Record validators

**Phase** 15 · Data quality  |  **Depends on** [316](316-field-validators.md), [171](../09-templates/171-identity-fields.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Whole-record rules: required fields present, identity present, evidence present when demanded.

## Files

- `frontend/lib/core/validation/record_validators.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record cannot be approved with an empty identity field when the template demands one.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
