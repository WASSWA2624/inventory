# 238 — Long-form audio recording

**Phase** 12 · Capture  |  **Depends on** [234](234-voice-permission.md), [115](../05-file-storage/115-file-writer.md), [096](../04-data-layer/096-documents-table.md)

## Goal

Record a walkthrough or a meeting to a file for later transcription.

## Files

- `lib/features/capture/presentation/audio_recorder.dart` (new)

## Steps

1. Show duration and level; write incrementally so a crash keeps what was recorded.

## Acceptance

- [ ] A thirty-minute recording survives an app kill.
