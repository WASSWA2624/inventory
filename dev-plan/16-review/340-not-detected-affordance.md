# 340 — Not detected affordances

**Phase** 16 · Review  |  **Depends on** [290](../13-processing/290-no-invention-guard.md), [335](335-review-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Make a missing value actionable rather than merely empty.

## Files

- `frontend/lib/features/review/presentation/not_detected_row.dart` (new)

## Steps

1. Offer "type it" and "photograph the label" directly on the row.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The user is never left staring at a blank field with no next step.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
