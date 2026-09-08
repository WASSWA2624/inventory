# 161 — Field list editor

**Phase** 09 · Templates  |  **Depends on** [153](153-template-model.md), [065](../03-design-system/065-app-list-tile.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The editing screen: an ordered list of fields with add, edit, reorder and delete.

## Files

- `lib/features/templates/presentation/field_list_screen.dart` (new)

## Steps

1. Show each field's label, type and required badge; keep the list keyboard-navigable.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The list is the only place fields are managed.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
