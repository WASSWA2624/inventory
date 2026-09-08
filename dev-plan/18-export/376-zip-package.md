# 376 — ZIP data package

**Phase** 18 · Export  |  **Depends on** [361](361-xlsx-writer.md), [368](368-csv-writer.md), [369](369-json-writer.md), [372](372-pdf-record-report.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Bundle the chosen outputs with photos, documents and a manifest.

## Files

- `lib/core/export/zip_package.dart` (new)

## Steps

1. Lay the archive out exactly as the specification shows; stream entries to avoid loading files into memory.

## Acceptance

- [ ] A four-hundred-megabyte package builds without exhausting memory.

## Tests

- Test of archive layout and extraction.
