# 342 — Approve and next

**Phase** 16 · Review  |  **Depends on** [335](335-review-screen.md), [315](../15-data-quality/315-validation-engine.md), [301](../14-records/301-record-lifecycle.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The primary action: validate, approve, and jump to the next record needing review.

## Files

- `frontend/lib/features/review/domain/approve_record.dart` (new)

## Steps

1. Block approval on failed validation, unresolved duplicates and unresolved conflicts, naming what to fix.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Approving moves straight to the next unreviewed record.
- [ ] Tests written and passing: Test of the block conditions.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
