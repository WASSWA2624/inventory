# 117 — Thumbnail cache

**Phase** 05 · File storage  |  **Depends on** [115](115-file-writer.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Generate and cache thumbnails so lists never decode full images.

## Files

- `lib/core/files/thumbnail_cache.dart` (new)

## Steps

1. Generate on first request in an isolate; store under .cache keyed by hash and size.

## Acceptance

- [ ] A tray of thirty photos scrolls without jank on a mid-range device.

## Tests

- Test that a second request hits the cache.
