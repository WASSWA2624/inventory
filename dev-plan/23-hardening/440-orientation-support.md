# 440 — Landscape and foldables

**Phase** 23 · Hardening  |  **Depends on** [439](439-responsive-audit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Support landscape capture and review, and hinge-aware layouts.

## Files

- `frontend/lib/app/nav_shell.dart` (edit)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Rotating during capture never loses the session.
- [ ] Tests written and passing: Unit tests of `nav_shell.dart`.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
