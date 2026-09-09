# 396 — Tombstone propagation

**Phase** 19 · Bundles and merge  |  **Depends on** [395](395-version-vector-service.md), [089](../04-data-layer/089-tombstones-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Apply and respect deletions across devices without resurrecting data.

## Files

- `frontend/lib/features/merge/domain/tombstone_merge.dart` (new)

## Steps

1. A delete wins over an older edit; an edit after the delete raises a conflict rather than resurrecting silently.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No merge ever brings back an entity deliberately deleted later.
- [ ] Tests written and passing: Unit tests over both orderings.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
