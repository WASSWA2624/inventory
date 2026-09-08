# 439 — Accessibility audit

**Phase** 23 · Hardening  |  **Depends on** [019](../01-orchestration/019-accessibility-matchers.md), [082](../03-design-system/082-widget-gallery.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Verify semantics, focus order, labels and contrast across the app.

## Files

- `frontend/test/accessibility/` (new)

## Steps

1. Run the accessibility guidelines checks in widget tests for every primary screen.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every interactive element has a label and meets the tap target minimum.
- [ ] Tests written and passing: Automated accessibility assertions in the suite.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
