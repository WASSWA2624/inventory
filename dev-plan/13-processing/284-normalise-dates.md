# 284 — Normalise dates and numbers

**Phase** 13 · Processing  |  **Depends on** [282](282-normalise-units.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Parse the date formats field workers actually type, and keep identifiers as text.

## Files

- `frontend/lib/core/normalise/dates.dart` (new)

## Steps

1. Parse common day-month-year forms with the project locale; never coerce an identifier to a number.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Leading zeros in asset numbers are preserved.
- [ ] Tests written and passing: Unit tests including ambiguous dates and zero-prefixed identifiers.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
