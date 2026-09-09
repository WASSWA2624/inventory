# 325 — Keep both and link

**Phase** 15 · Data quality  |  **Depends on** [321](321-duplicate-prompt.md), [105](../04-data-layer/105-duplicates-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record the pair as related so a later reviewer sees it.

## Files

- `frontend/lib/features/quality/domain/duplicate_link.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Linked records show a badge and a link to their counterpart.
- [ ] Tests written and passing: Unit tests of `duplicate_link.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
