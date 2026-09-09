# 245 — Long-form audio recording

**Phase** 12 · Capture  |  **Depends on** [241](241-voice-permission.md), [119](../05-file-storage/119-file-writer.md), [100](../04-data-layer/100-documents-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record a walkthrough or a meeting to a file for later transcription.

## Files

- `frontend/lib/features/capture/presentation/audio_recorder.dart` (new)

## Steps

1. Show duration and level; write incrementally so a crash keeps what was recorded.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A thirty-minute recording survives an app kill.
- [ ] Tests written and passing: Widget test of `audio_recorder.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
