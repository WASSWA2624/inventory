# 409 — Undo a merge

**Phase** 19 · Bundles and merge  |  **Depends on** [408](408-merge-history.md), [407](407-merge-apply.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Restore the pre-merge state from the snapshot.

## Files

- `frontend/lib/features/merge/domain/merge_undo.dart` (new)

## Steps

1. Available until the snapshot is purged; state the deadline in the interface.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Undo restores rows and files exactly, including deleted ones.
- [ ] Tests written and passing: Test comparing state before merge and after undo.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
