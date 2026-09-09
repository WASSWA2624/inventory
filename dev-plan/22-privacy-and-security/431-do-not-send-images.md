# 431 — Do not send images

**Phase** 22 · Privacy and security  |  **Depends on** [430](430-ai-disable-per-project.md), [266](../13-processing/266-ocr-on-device.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Force on-device OCR only, sending no image anywhere.

## Files

- `frontend/lib/features/projects/presentation/image_egress_switch.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] With the switch on, extraction uses text only and says so.
- [ ] Tests written and passing: Widget test of `image_egress_switch.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
