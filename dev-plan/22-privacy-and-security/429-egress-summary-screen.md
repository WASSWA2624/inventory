# 429 — What leaves this device

**Phase** 22 · Privacy and security  |  **Depends on** [270](../13-processing/270-provider-registry.md), [419](../21-cloud-upload/419-destination-list.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One screen listing every outbound path, its current state and what it sends.

## Files

- `frontend/lib/features/settings/presentation/egress_summary_screen.dart` (new)

## Steps

1. List AI extraction, OCR, speech, refinement and cloud upload, each with an on or off state.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A user can see and disable every outbound path from one place.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
