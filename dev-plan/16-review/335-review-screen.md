# 335 — Review screen

**Phase** 16 · Review  |  **Depends on** [278](../13-processing/278-proposal-application.md), [052](../03-design-system/052-app-page.md), [071](../03-design-system/071-async-value-view.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Assemble the review screen from the specification, sorted so attention goes where it is needed.

## Files

- `frontend/lib/features/review/presentation/review_screen.dart` (new)

## Steps

1. Show photos, fields with confidence, context and automatic values, and the caption toggle.
2. Two-pane on expanded: evidence on the left, fields on the right.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A confident record is approvable in one tap.
- [ ] Tests written and passing: Widget test at three widths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
