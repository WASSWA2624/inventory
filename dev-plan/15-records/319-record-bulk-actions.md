# 319 — Bulk actions on records

**Phase** 15 · Records  |  **Depends on** [307](307-records-list.md), [228](../12-capture/228-photo-multi-select.md)

## Goal

Select several records and approve, archive, delete, export or re-process them together.

## Files

- `lib/features/records/presentation/record_bulk_actions.dart` (new)

## Steps

1. Show the count in the action bar; confirm destructive bulk actions with the count named.

## Acceptance

- [ ] A bulk action reports how many succeeded and how many failed.
