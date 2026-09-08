# 340 — Approve and next

**Phase** 16 · Review and approval  |  **Depends on** [333](333-review-screen.md), [313](../15-data-quality/313-validation-engine.md), [299](../14-records/299-record-lifecycle.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The primary action: validate, approve, and jump to the next record needing review.

## Files

- `lib/features/review/domain/approve_record.dart` (new)

## Steps

1. Block approval on failed validation, unresolved duplicates and unresolved conflicts, naming what to fix.

## Constraints

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
