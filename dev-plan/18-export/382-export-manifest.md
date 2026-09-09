# 382 — Export manifest

**Phase** 18 · Export  |  **Depends on** [381](381-zip-package.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The manifest that maps records to output rows and photo paths.

## Files

- `frontend/lib/core/export/export_manifest.dart` (new)

## Steps

1. Match the specification example field for field.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Schema test of the produced manifest.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
