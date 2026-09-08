# 249 — Crash recovery for an unsaved session

**Phase** 12 · Capture  |  **Depends on** [210](210-capture-session-controller.md)

## Goal

Offer to resume a session that was interrupted.

## Files

- `lib/features/capture/presentation/capture_recovery_prompt.dart` (new)

## Steps

1. On launch, detect an unfinished session and offer resume or discard, showing its photo count.

## Acceptance

- [ ] A crash during capture never silently discards photos.

## Tests

- Test simulating an interrupted session.
