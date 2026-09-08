# 336 — Evidence viewer

**Phase** 16 · Review and approval  |  **Depends on** [285](../13-processing/285-evidence-linking.md), [226](../12-capture/226-photo-viewer.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Tap a value to see the photo region, page or transcript behind it.

## Files

- `frontend/lib/features/review/presentation/evidence_viewer.dart` (new)

## Steps

1. Highlight the region on the photo; show the OCR snippet and the source label.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every value with evidence can be checked in two taps.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
