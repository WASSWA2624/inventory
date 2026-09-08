# 305 — Record domain model and repository

**Phase** 15 · Records  |  **Depends on** [093](../04-data-layer/093-records-table.md), [094](../04-data-layer/094-record-fields-table.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

Models and repository for records and their field values.

## Files

- `lib/features/records/domain/record_entry.dart` (new)
- `lib/features/records/data/record_repository_impl.dart` (new)

## Steps

1. Expose a record with its values, photos, status flags and context snapshot in one read.

## Tests

- Round-trip mapper test.
