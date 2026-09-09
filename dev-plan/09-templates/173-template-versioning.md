# 173 — Template version bump

**Phase** 09 · Templates  |  **Depends on** [153](153-template-model.md), [085](../04-data-layer/085-migration-strategy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Editing a template creates a new version, leaving captured records on theirs.

## Files

- `frontend/lib/features/templates/domain/template_versioning.dart` (new)

## Steps

1. Bump on any structural change; record what changed between versions.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Old records still render and export correctly after an edit.
- [ ] Tests written and passing: Test that a record keeps its captured version.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
