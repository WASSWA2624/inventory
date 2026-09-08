# 372 — JSON writer

**Phase** 18 · Export  |  **Depends on** [361](361-value-formatter.md), [286](../13-processing/286-provenance-recording.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Full-fidelity export: values raw, refined and final, provenance, confidence, evidence, context and templates.

## Files

- `frontend/lib/core/export/json_writer.dart` (new)

## Steps

1. Stream to file rather than building the whole document in memory.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A ten-thousand-record project exports without exhausting memory.
- [ ] Tests written and passing: Schema validation test of the output.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
