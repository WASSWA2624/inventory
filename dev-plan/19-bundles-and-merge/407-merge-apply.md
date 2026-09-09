# 407 — Apply the merge atomically

**Phase** 19 · Bundles and merge  |  **Depends on** [404](404-merge-preview.md), [405](405-conflict-screen.md), [088](../04-data-layer/088-transaction-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write everything in one transaction, with a snapshot taken first.

## Files

- `frontend/lib/features/merge/domain/merge_apply.dart` (new)

## Steps

1. Take an undo snapshot before writing; roll back completely on any failure.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A failed merge leaves the project exactly as it was.
- [ ] Tests written and passing: Test simulating a mid-merge failure.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
