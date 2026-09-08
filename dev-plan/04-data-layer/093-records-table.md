# 093 — Records table

**Phase** 04 · Local database  |  **Depends on** [089](089-templates-table.md), [082](082-column-mixins.md)

## Goal

The central record row with status, context snapshot and identity hash.

## Files

- `lib/core/db/tables/records.dart` (new)

## Steps

1. Columns per the specification including processingMode, contextJson, identityHash, source, capturedAt, capturedBy, gps, approvedAt.
2. Indexes on projectId plus status, identityHash, capturedAt and templateId.

## Tests

- DAO test for paged listing by project and status.
