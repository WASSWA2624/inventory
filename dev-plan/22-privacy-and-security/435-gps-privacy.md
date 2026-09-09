# 435 — GPS consent and control

**Phase** 22 · Privacy and security  |  **Depends on** [251](../12-capture/251-gps-capture.md), [429](429-egress-summary-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Keep location off by default and easy to strip.

## Files

- `frontend/lib/features/settings/presentation/gps_privacy_section.dart` (new)

## Steps

1. Offer removing coordinates from existing records and excluding them from exports.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A project can be delivered with no location data at all.
- [ ] Tests written and passing: Widget test of `gps_privacy_section.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
