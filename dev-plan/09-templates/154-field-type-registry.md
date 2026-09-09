# 154 — Field type registry

**Phase** 09 · Templates  |  **Depends on** [153](153-template-model.md), [011](../01-orchestration/011-naming-checker.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One registry describing each field type: its editor widget, validator, normaliser, storage form and export form.

## Files

- `frontend/lib/features/templates/domain/field_type_registry.dart` (new)

## Steps

1. Register every type of §12.1 with its four behaviours in one place, naming them explicitly so the registry
   test can assert the set is complete: text, long text, number, decimal, currency, percentage, date, time,
   date-time, boolean, choice, multi-choice, lookup, barcode, photo reference, document reference, GPS
   location, signature and computed.
2. Most types reuse an existing design-system field (053-062). Three do not and must be named as such:
   signature draws on screen and stores the result as an image beside the record's evidence, computed is
   read-only and evaluated by task 316, and GPS location is filled by task 251.
3. Rule: adding a field type later means one registry entry, not edits across ten files.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Capture, review, validation and export all read behaviour from this registry.
- [ ] Every type of §12.1 is present; a type missing any of its four behaviours fails the registry test.
- [ ] Tests written and passing: Unit test that every declared type has all four behaviours.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
