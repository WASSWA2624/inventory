# 235 — Speech-to-text service

**Phase** 12 · Capture  |  **Depends on** [234](234-voice-permission.md), [263](../13-processing/263-ai-service-interface.md)

## Goal

On-device dictation with the configured language, behind one interface.

## Files

- `lib/core/ai/stt_service.dart` (new)

## Steps

1. Expose partial and final results, cancellation, and the language actually used.
2. Fall back to the online service only when configured and online; otherwise say it is unavailable.

## Acceptance

- [ ] Dictation works with the network off where the platform supports the language.

## Tests

- Unit test with a fake recogniser.
