# 170 — Field editor widget

**Phase** 09 · Templates  |  **Depends on** [154](154-field-type-registry.md), [056](../03-design-system/056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the one widget that edits any field value using the editor its type declares in the registry, reused by review, records, capture and duplicate resolution.

## Files

- `frontend/lib/core/widgets/fields/field_editor.dart` (new)

## Contract

```dart
class FieldEditor extends ConsumerWidget { final FieldDef field; final FieldValue value; final ValueChanged<FieldValue> onChanged; }
```

## Steps

1. On edit, set source MANUAL, mark verified, and write an audit entry with the previous value.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every correction is recorded with what it replaced.
- [ ] Tests written and passing: Test asserting the audit row.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
