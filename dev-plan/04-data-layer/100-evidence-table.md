# 100 — Field evidence table

**Phase** 04 · Local database  |  **Depends on** [094](094-record-fields-table.md), [095](095-photos-table.md)

## Goal

Link every extracted value to the photo region, document page or transcript segment behind it.

## Files

- `lib/core/db/tables/field_evidence.dart` (new)

## Steps

1. Columns: recordFieldId, sourceType, photoId, documentId, page, region, snippet, confidence.
