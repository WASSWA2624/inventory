# 360 — Rename photos when identity is known

**Phase** 18 · Export  |  **Depends on** [359](359-photo-naming-service.md), [324](../16-data-quality/324-identity-hash.md), [116](../05-file-storage/116-file-relocation.md)

## Goal

Rename provisional file names once a serial or asset number is confirmed.

## Files

- `lib/core/export/photo_rename.dart` (new)

## Steps

1. Rename inside a transaction with the path update; keep the original filename in metadata and history.

## Acceptance

- [ ] A photo taken before identification ends up correctly named.

## Tests

- Test that references still resolve after renaming.
