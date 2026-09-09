# 405 — Conflict resolution screen

**Phase** 19 · Bundles and merge  |  **Depends on** [399](399-merge-auto-rules.md), [338](../16-review/338-evidence-viewer.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Resolve conflicts one at a time, with both sides, their authors and their evidence.

## Files

- `frontend/lib/features/merge/presentation/conflict_screen.dart` (new)

## Steps

1. Offer Keep mine, Take theirs, Type a value and Decide later.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record with an unresolved conflict cannot be approved.
- [ ] Tests written and passing: Widget test of each choice.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
