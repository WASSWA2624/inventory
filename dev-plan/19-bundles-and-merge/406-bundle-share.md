# 406 — Share and receive bundles

**Phase** 19 · Bundles and merge  |  **Depends on** [384](384-bundle-writer.md), [382](../18-export/382-export-share.md)

## Goal

Export to the share sheet and accept bundles opened from other apps.

## Files

- `lib/features/merge/presentation/bundle_share_actions.dart` (new)

## Steps

1. Register the file association so a bundle opens the import flow directly.

## Acceptance

- [ ] Receiving a bundle by any transport lands in the same import screen.
