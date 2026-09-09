# 359 — Export request model

**Phase** 18 · Export  |  **Depends on** [108](../04-data-layer/108-exports-table.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Model an export: formats, scope, column options, extras and the resulting files.

## Files

- `frontend/lib/features/exports/domain/export_request.dart` (new)

## Steps

1. Make the request serialisable so an export can be repeated exactly.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Round-trip test of the request.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
