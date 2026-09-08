# 120 — Storage headroom guard

**Phase** 05 · File storage  |  **Depends on** [111](111-storage-root.md)

## Goal

Warn before the device fills and stop capture before data is lost.

## Files

- `lib/core/files/storage_guard.dart` (new)

## Steps

1. Warn below 500 MB, block new capture below 100 MB with an explanation and a link to export.

## Acceptance

- [ ] A full device produces a clear message, never a corrupt record.

## Tests

- Unit test with a fake free-space source.
