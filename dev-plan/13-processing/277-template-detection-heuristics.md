# 277 — Template detection: local signals

**Phase** 13 · Processing pipeline  |  **Depends on** [183](../09-templates/183-template-detection-profile.md), [267](267-identifier-extraction.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Score templates from OCR keywords, identifier patterns and reference matches, with no network.

## Files

- `frontend/lib/features/processing/domain/template_detection.dart` (new)

## Steps

1. Implement the selection order from the specification, stopping as soon as a rule decides.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A pinned template short-circuits detection entirely.
- [ ] Tests written and passing: Unit tests over the full decision table.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
