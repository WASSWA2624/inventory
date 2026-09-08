# 119 — Cache cleanup

**Phase** 05 · File storage  |  **Depends on** [117](117-thumbnail-cache.md), [118](118-compressed-copy.md)

## Goal

Keep .cache bounded and disposable.

## Files

- `lib/core/files/cache_cleanup.dart` (new)

## Steps

1. Delete entries by age and by total size; run on launch and on demand from settings.

## Acceptance

- [ ] Deleting the whole cache loses nothing but speed.
