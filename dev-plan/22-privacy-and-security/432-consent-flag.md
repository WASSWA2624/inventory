# 432 — Consent flag for personal data

**Phase** 22 · Privacy and security  |  **Depends on** [154](../09-templates/154-field-type-registry.md), [153](../09-templates/153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A standard consent field for projects that record people.

## Files

- `frontend/lib/features/quality/domain/consent_field.dart` (new)

## Steps

1. Block export of records lacking consent when the project requires it.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Consent is recorded per record, with who recorded it and when.
- [ ] Tests written and passing: Unit tests of `consent_field.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
