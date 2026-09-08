# 434 — Treat imported text as data

**Phase** 22 · Privacy and security  |  **Depends on** [022](../01-orchestration/022-security-policy.md), [272](../13-processing/272-extraction-request.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Ensure OCR, transcripts, imported files and bundle content can never act as instructions.

## Files

- `lib/core/security/untrusted_text.dart` (new)

## Steps

1. Pass such text only as delimited data in requests; never interpolate it into instructions.
2. Escape it wherever it is rendered, and never build a query by concatenation.

## Constraints

- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A crafted caption cannot change what the provider is asked to do.
- [ ] Tests written and passing: Test with an injection-shaped fixture caption.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
