# 383 — Bundle format and manifest model

**Phase** 19 · Bundles and merge  |  **Depends on** [354](../18-export/354-export-model.md), [106](../04-data-layer/106-sync-state-table.md)

## Goal

Define the archive layout and the manifest exactly as specified.

## Files

- `lib/core/bundle/bundle_format.dart` (new)

## Steps

1. Declare the file list, the manifest schema, the format version and the lineage record.

## Acceptance

- [ ] The layout matches the specification file for file.

## Tests

- Schema test of a written manifest.
