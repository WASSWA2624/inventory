# 348 — Transcribe the recording

**Phase** 17 · Meeting mode  |  **Depends on** [347](347-meeting-audio.md), [235](../12-capture/235-stt-service.md)

## Goal

Produce a transcript, stored verbatim, re-runnable with a better service later.

## Files

- `lib/features/meetings/domain/meeting_transcription.dart` (new)

## Steps

1. Chunk long audio; show progress; keep every version of the transcript.

## Acceptance

- [ ] The raw transcript is never replaced by refinement.
