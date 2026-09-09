# 352 — Record the meeting

**Phase** 17 · Meetings  |  **Depends on** [245](../12-capture/245-audio-recording.md), [346](346-meeting-create.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Attach a long-form recording to the meeting record.

## Files

- `frontend/lib/features/meetings/presentation/meeting_audio_section.dart` (new)

## Steps

1. Show elapsed time and remaining storage; keep partial recordings on interruption.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
