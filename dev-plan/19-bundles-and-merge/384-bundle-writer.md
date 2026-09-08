# 384 — Bundle writer

**Phase** 19 · Bundles and merge  |  **Depends on** [383](383-bundle-format.md), [376](../18-export/376-zip-package.md)

## Goal

Write a complete project bundle, streaming, with checksums.

## Files

- `lib/core/bundle/bundle_writer.dart` (new)

## Steps

1. Serialise every entity table plus files; write checksums for each entry.

## Acceptance

- [ ] A bundle of two thousand photos writes without exhausting memory.

## Tests

- Round-trip test writing then reading a seeded project.
