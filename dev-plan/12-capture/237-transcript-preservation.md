# 237 — Preserve the raw transcript

**Phase** 12 · Capture  |  **Depends on** [236](236-voice-input-button.md), [097](../04-data-layer/097-captions-table.md)

## Goal

The spoken words are stored verbatim and never overwritten by refinement.

## Files

- `lib/features/capture/domain/transcript_store.dart` (new)

## Steps

1. Store transcript, language and confidence alongside the caption row.

## Acceptance

- [ ] Refinement later writes a separate column, leaving this untouched.

## Tests

- Test that refining does not alter the raw row.
