# 317 — Recycle bin

**Phase** 15 · Records  |  **Depends on** [316](316-record-delete.md)

## Goal

List deleted records and restore them within the retention window.

## Files

- `lib/features/records/presentation/recycle_bin_screen.dart` (new)

## Steps

1. Show remaining days per item and a restore action; support empty-now with a strong confirmation.

## Acceptance

- [ ] Nothing leaves the device's storage without an explicit action.
