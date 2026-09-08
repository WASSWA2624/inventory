# 261 — Perceptual hash and duplicate image detection

**Phase** 13 · Processing pipeline  |  **Depends on** [031](../02-foundation/031-hashing-service.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Recognise the same or near-same photo to avoid paying twice.

## Files

- `lib/core/hash/perceptual_hash.dart` (new)

## Steps

1. Compute a difference hash; expose a distance function with a configurable threshold.

## Tests

- Unit tests over resized, recompressed and unrelated images.
