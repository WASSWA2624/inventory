# 439 — Responsive audit

**Phase** 23 · Hardening  |  **Depends on** [018](../01-orchestration/018-responsive-test.md), [128](../06-app-shell/128-nav-shell.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Walk every screen at compact, medium and expanded widths and fix what breaks.

## Files

- `frontend/test/responsive/` (new)

## Steps

1. Check overflow, truncation, two-pane behaviour and reachability of primary actions.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No screen overflows or hides its primary action at any supported width.
- [ ] Tests written and passing: Widget tests capturing each screen at three widths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
