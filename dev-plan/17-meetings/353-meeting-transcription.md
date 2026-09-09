# 353 — Transcribe the recording

**Phase** 17 · Meetings  |  **Depends on** [352](352-meeting-audio.md), [242](../12-capture/242-stt-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Produce a transcript, stored verbatim, re-runnable with a better service later.

## Files

- `frontend/lib/features/meetings/domain/meeting_transcription.dart` (new)

## Steps

1. Chunk long audio; show progress; keep every version of the transcript.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The raw transcript is never replaced by refinement.
- [ ] Tests written and passing: Unit tests of `meeting_transcription.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
