# 233 — Append or replace

**Phase** 12 · Capture  |  **Depends on** [232](232-caption-scope-selector.md)

## Goal

Choose whether the new text replaces or is appended to existing captions.

## Files

- `lib/features/capture/domain/caption_apply.dart` (new)

## Steps

1. Append adds on a new line; replace keeps the previous text recoverable from history.

## Acceptance

- [ ] Applying to seven photos writes seven independent caption rows.

## Tests

- Unit test that each photo can afterwards be edited alone.
