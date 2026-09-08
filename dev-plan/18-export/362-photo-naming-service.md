# 362 — Photo naming service

**Phase** 18 · Export  |  **Depends on** [117](../05-file-storage/117-path-sanitizer.md), [232](../12-capture/232-photo-type-assign.md), [136](../07-operator-and-settings/136-settings-store.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Build meaningful file names from the configured pattern and available tokens.

## Files

- `frontend/lib/core/export/photo_naming.dart` (new)

## Steps

1. Support the tokens from the specification, including context levels; sanitise and de-duplicate.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Names match the specification examples exactly.
- [ ] Tests written and passing: Unit tests over the token set and collisions.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
