# 095 — Photos table

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

Photo metadata with the content hash that gives it merge identity.

## Files

- `lib/core/db/tables/photos.dart` (new)

## Steps

1. Columns: recordId nullable, captureSessionId, originalFilename, storedFilename, relativePath, photoType, sortOrder, width, height, fileSize, mimeType, sha256, capturedAt, gps.
2. Unique index on sha256 per project.
