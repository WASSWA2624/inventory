# 170 — Read a spreadsheet workbook

**Phase** 09 · Templates  |  **Depends on** [018](../01-orchestration/018-dependency-allowlist.md), [122](../05-file-storage/122-file-validation.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Open an XLSX or CSV and list its sheets and dimensions, off the UI thread.

## Files

- `lib/core/import/workbook_reader.dart` (new)

## Steps

1. Read sheet names, used range, merged cells and existing rows.
2. Fail clearly on password-protected or corrupt files.

## Acceptance

- [ ] A twenty-sheet workbook opens without freezing the interface.

## Tests

- Test against a fixture workbook.
