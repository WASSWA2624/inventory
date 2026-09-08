# 291 — Automatic processing when connected

**Phase** 13 · Processing pipeline  |  **Depends on** [255](255-job-queue.md), [034](../02-foundation/034-connectivity-service.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Optional, off by default, with a Wi-Fi-only restriction.

## Files

- `lib/features/processing/domain/auto_process.dart` (new)

## Steps

1. Trigger on connectivity gain when enabled; respect the metered restriction and the cost guard.

## Acceptance

- [ ] With the setting off, nothing processes without a tap.
