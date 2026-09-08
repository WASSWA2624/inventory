# 318 — Retention purge job

**Phase** 15 · Records  |  **Depends on** [317](317-recycle-bin.md), [119](../05-file-storage/119-cache-cleanup.md)

## Goal

Permanently remove tombstoned rows and their files after the retention window.

## Files

- `lib/features/records/domain/purge_job.dart` (new)

## Steps

1. Run on launch; purge only past the window; log counts; never purge unmerged tombstones.

## Acceptance

- [ ] A tombstone still needed by merge is never purged.

## Tests

- Test that a recent deletion survives.
