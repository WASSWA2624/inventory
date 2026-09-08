# 380 — Export history

**Phase** 18 · Export  |  **Depends on** [104](../04-data-layer/104-exports-table.md), [377](377-export-manifest.md)

## Goal

Record every export and allow re-share without regenerating.

## Files

- `lib/features/exports/presentation/export_history_screen.dart` (new)

## Steps

1. Store timestamp, operator, formats, filters, count, path and file hash; stamp records with exportedAt.

## Acceptance

- [ ] A user can explain, months later, exactly what a given file contained.
