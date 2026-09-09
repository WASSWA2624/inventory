# 186 — Reference dataset model and repository

**Phase** 10 · Reference data  |  **Depends on** [102](../04-data-layer/102-reference-tables.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Models and repository for datasets and their rows.

## Files

- `frontend/lib/features/reference/domain/reference_dataset.dart` (new)
- `frontend/lib/features/reference/data/reference_repository_impl.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Round-trip mapper test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
