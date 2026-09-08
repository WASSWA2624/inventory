# 309 — Filter records

**Phase** 15 · Records  |  **Depends on** [307](307-records-list.md), [059](../03-design-system/059-app-chip.md)

## Goal

Filter by context, template, status, date, operator, condition and the quality flags.

## Files

- `lib/features/records/presentation/records_filter_sheet.dart` (new)

## Steps

1. Show active filters as removable chips; persist the last filter per project.

## Acceptance

- [ ] Filters combine and are clearable in one tap.
