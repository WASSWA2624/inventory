# 155 — Shipped template assets

**Phase** 09 · Templates  |  **Depends on** [153](153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Author the shipped library as versioned JSON assets.

## Files

- `frontend/assets/templates/` (new)

## Steps

1. Write one JSON file per shipped template listed in the specification, using stable field keys.
2. Include a schema version so the loader can migrate old copies.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The library covers equipment, medical equipment, building, room, vehicle, furniture, ICT, stock, inspection, meeting, person, land, plant, livestock and generic item.
- [ ] Tests written and passing: Test that every asset parses and validates.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
