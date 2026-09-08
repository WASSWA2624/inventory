# 388 — Bundle reader and validation

**Phase** 19 · Bundles and merge  |  **Depends on** [383](383-bundle-format.md), [122](../05-file-storage/122-file-validation.md)

## Goal

Open a bundle, verify its checksums and format version, and refuse anything suspicious.

## Files

- `lib/core/bundle/bundle_reader.dart` (new)

## Steps

1. Reject traversal paths, mismatched checksums and unknown format versions with clear messages.

## Acceptance

- [ ] A corrupted bundle is refused before any row is written.

## Tests

- Tests over tampered fixtures.
