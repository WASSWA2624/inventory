# 111 — Storage root resolution

**Phase** 05 · File storage  |  **Depends on** [035](../02-foundation/035-permissions-service.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

Resolve and create the visible Tapture root folder on the device.

## Files

- `lib/core/files/storage_root.dart` (new)

## Steps

1. Resolve the documents directory, create Tapture/, and expose it as a single provider.
2. Handle a missing or unwritable location with a recoverable failure.

## Acceptance

- [ ] The folder is visible over a cable and in a file manager.

## Tests

- Unit test with a temporary directory.
