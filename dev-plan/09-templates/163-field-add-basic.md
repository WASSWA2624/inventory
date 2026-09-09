# 163 — Add a field: label, type, required

**Phase** 09 · Templates  |  **Depends on** [162](162-field-list-editor.md), [154](154-field-type-registry.md), [059](../03-design-system/059-app-choice-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The three-question add flow of §12.3 — **Label**, **Type**, **Required?** — with every other attribute
defaulted and tucked under Advanced.

## Files

- `frontend/lib/features/templates/presentation/field_add_sheet.dart` (new)

## Steps

1. Generate the field key from the label, guaranteeing uniqueness and stability, and hold it to the atomicity
   conventions of §13.1: `snake_case`, one fact, unit in the key where the value is measured.
2. Offer REQUIRED, RECOMMENDED and OPTIONAL as three equal choices, defaulting to OPTIONAL. Requiredness is
   the user's decision at every point, never the app's (§13.2).
3. Warn, without blocking, when a label packs two facts (`Make / Model`, `Address`) and offer to split it.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A field can be added in under ten seconds, and lands OPTIONAL unless the user says otherwise.
- [ ] A two-fact label is questioned once, and the user can still insist.
- [ ] Tests written and passing: Test of key generation and collision handling.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
