# 325 — Duplicate detection service

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [324](324-identity-hash.md), [261](../13-processing/261-perceptual-hash.md)

## Goal

Detect duplicates on save, on table import and after merge, using the specification's signals.

## Files

- `lib/features/quality/domain/duplicate_detection.dart` (new)

## Steps

1. Signals: identity hash, identical photo hash, near-identical photo, same predefined row in the same context, same name plus context plus close time.
2. Score and rank candidates; never act automatically.

## Acceptance

- [ ] Detection runs in the background and never delays a save.

## Tests

- Unit tests per signal.
