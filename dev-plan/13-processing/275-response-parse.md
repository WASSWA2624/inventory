# 275 — Parse and validate the response

**Phase** 13 · Processing  |  **Depends on** [274](274-extraction-request.md), [154](../09-templates/154-field-type-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn the provider response into typed proposals, rejecting anything malformed.

## Files

- `frontend/lib/features/processing/domain/response_parser.dart` (new)

## Steps

1. Validate against the schema derived from the template; drop unknown keys; coerce types safely.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A malformed response never corrupts a record.
- [ ] Tests written and passing: Unit tests over valid, partial and hostile responses.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
