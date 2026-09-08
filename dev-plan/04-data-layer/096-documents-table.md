# 096 — Documents and audio tables

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

Store attached documents and audio clips with the same identity rules as photos.

## Files

- `lib/core/db/tables/attachments.dart` (new)

## Steps

1. Columns mirror photos: path, mime, size, hash, duration for audio, page count for documents.
