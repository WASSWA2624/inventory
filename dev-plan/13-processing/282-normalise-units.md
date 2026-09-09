# 282 — Normalise units and measures

**Phase** 13 · Processing  |  **Depends on** [154](../09-templates/154-field-type-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn "13 litre", "13L" and "13 Litre Capacity" into one stored value.

## Files

- `frontend/lib/core/normalise/units.dart` (new)

## Steps

1. Parse value plus unit, convert to the field's configured unit, keep the original text.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The original phrasing survives in the raw value.
- [ ] Tests written and passing: Unit tests over the specification examples.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
