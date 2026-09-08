# 405 — Post-merge duplicate scan

**Phase** 19 · Bundles and merge  |  **Depends on** [402](402-merge-apply.md), [325](../16-data-quality/325-duplicate-detection.md)

## Goal

Catch records that are the same thing captured independently on two devices.

## Files

- `lib/features/merge/domain/post_merge_scan.dart` (new)

## Acceptance

- [ ] The scan runs automatically after every merge and lists pairs for review.
