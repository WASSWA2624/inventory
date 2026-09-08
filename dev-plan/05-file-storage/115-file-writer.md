# 115 — Safe file writer

**Phase** 05 · File storage  |  **Depends on** [111](111-storage-root.md), [031](../02-foundation/031-hashing-service.md)

## Goal

Write files atomically and record their hash and size.

## Files

- `lib/core/files/file_writer.dart` (new)

## Steps

1. Write to a temporary name then rename; compute the hash in the same pass.
2. Fail cleanly with a storage failure when space runs out, leaving no partial file.

## Acceptance

- [ ] An interrupted write never leaves a half-written photo.

## Tests

- Test that a simulated failure leaves the target absent.
