# 113 — Path and name sanitiser

**Phase** 05 · File storage  |  **Depends on** [111](111-storage-root.md)

## Goal

Turn arbitrary user text into safe folder and file names.

## Files

- `lib/core/files/path_sanitizer.dart` (new)

## Steps

1. Uppercase where required, strip accents, replace spaces with hyphens, remove reserved characters, cap length, resolve collisions with a numeric suffix.
2. Reject traversal sequences outright.

## Acceptance

- [ ] A facility named with slashes or emoji still produces a valid folder.

## Tests

- Unit tests over a table of hostile inputs.
