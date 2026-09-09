# 164 — Field advanced attributes

**Phase** 09 · Templates  |  **Depends on** [163](163-field-add-basic.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The Advanced section, carrying every attribute of §12.2 that the three-question add flow defaults:
default value, unit, help text, input mode, stickable, context level, auto fill, refine, identity — plus the
two that decide when a field applies at all: `required_when` and `hidden`.

## Files

- `frontend/lib/features/templates/presentation/field_advanced_section.dart` (new)

## Steps

1. Keep every advanced control collapsed by default; a simple template must never meet this complexity.
2. `required_when` takes a simple expression over other fields of the same template — `fault_present == true`
   — validated against the field list as it is typed, with a plain-language preview of what it means.
3. `hidden` keeps the field out of the capture screen and out of every export while preserving values already
   captured under it (§18); it is never a delete.
4. Changing anything here creates a new template version (§18).

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A simple template never exposes advanced complexity.
- [ ] `required_when` naming an unknown field is refused at edit time, not at capture time.
- [ ] Hiding a field removes it from capture and export, and a later unhide brings its old values back intact.
- [ ] Tests written and passing: unit tests over expression validation and the hide/unhide value round trip.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
