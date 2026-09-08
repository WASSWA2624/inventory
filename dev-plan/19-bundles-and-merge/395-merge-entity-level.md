# 395 — Entity-level merge

**Phase** 19 · Bundles and merge  |  **Depends on** [393](393-version-vector-service.md), [088](../04-data-layer/088-transaction-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Apply the insert, fast-forward, ignore and concurrent decisions from the specification.

## Files

- `lib/features/merge/domain/merge_entities.dart` (new)

## Steps

1. Process in dependency order: project, templates, reference, records, fields, files.

## Constraints

- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Importing the same bundle twice changes nothing the second time.
- [ ] Tests written and passing: Idempotency test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
