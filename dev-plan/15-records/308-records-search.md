# 308 — Search records

**Phase** 15 · Records  |  **Depends on** [307](307-records-list.md), [058](../03-design-system/058-app-search-field.md)

## Goal

Search across field values, captions, transcripts and OCR text.

## Files

- `lib/features/records/data/record_search.dart` (new)

## Steps

1. Use an indexed search table kept in step by triggers or repository writes.

## Acceptance

- [ ] A search over ten thousand records returns in under 300 milliseconds.

## Tests

- Performance test with a seeded database.
