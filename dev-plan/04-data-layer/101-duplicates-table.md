# 101 — Duplicates table

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

Store detected duplicate pairs and how a human resolved them.

## Files

- `lib/core/db/tables/duplicates.dart` (new)

## Steps

1. Columns: leftRecordId, rightRecordId, signal, score, status, resolution, resolvedBy, resolvedAt.
