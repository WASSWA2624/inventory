# 247 — Automatic field application

**Phase** 12 · Capture  |  **Depends on** [215](215-capture-session-controller.md), [030](../02-foundation/030-clock-service.md), [034](../02-foundation/034-device-identity.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Fill date, time, captured-at, record number, operator and device without user input.

## Files

- `lib/features/capture/domain/auto_fields.dart` (new)

## Steps

1. Apply on first save; mark values with source AUTO and the auto affordance.
2. Respect each template field's autoFill setting and the project date format.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record captured with no typing still carries a complete timestamp and operator.
- [ ] Tests written and passing: Test with a frozen clock asserting every automatic value.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
