# 451 — Localisation scaffolding

**Phase** 23 · Hardening  |  **Depends on** [081](../03-design-system/081-copy-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Prepare for translation without translating yet.

## Files

- `frontend/lib/l10n/` (new)

## Steps

1. Extract every string into ARB files; verify layouts with a pseudo-locale.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Adding a language later requires no code change.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
