# 345 — Meeting template and model

**Phase** 17 · Meetings  |  **Depends on** [155](../09-templates/155-shipped-templates-assets.md), [107](../04-data-layer/107-meetings-tables.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The shipped meeting template plus its domain model.

## Files

- `frontend/lib/features/meetings/domain/meeting.dart` (new)

## Steps

1. Fields per the specification, with date and time automatic and location from context.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Round-trip mapper test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
