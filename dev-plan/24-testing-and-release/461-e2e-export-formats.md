# 461 — End-to-end: every export format

**Phase** 24 · Testing and release  |  **Depends on** [453](453-e2e-capture-to-export.md), [376](../18-export/376-zip-package.md)

## Goal

Produce XLSX, CSV, JSON, PDF and ZIP offline and validate each output.

## Files

- `integration_test/export_formats_test.dart` (new)

## Acceptance

- [ ] Every format opens correctly in a reader and matches the record count.
