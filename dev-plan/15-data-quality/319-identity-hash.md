# 319 — Identity hash computation

**Phase** 15 · Data quality  |  **Depends on** [171](../09-templates/171-identity-fields.md), [032](../02-foundation/032-hashing-service.md), [097](../04-data-layer/097-records-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Compute and store a stable hash of a record's identity values for fast duplicate lookup.

## Files

- `frontend/lib/features/quality/domain/identity_hash.dart` (new)

## Steps

1. Normalise case, whitespace and punctuation before hashing; recompute on identity edits.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Two records with the same serial always collide, whatever the spacing.
- [ ] Tests written and passing: Unit tests over spacing and case variants.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
