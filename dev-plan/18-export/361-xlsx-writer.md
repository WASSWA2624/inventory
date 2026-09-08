# 361 — XLSX writer core

**Phase** 18 · Export  |  **Depends on** [018](../01-orchestration/018-dependency-allowlist.md), [358](358-value-formatter.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Write records into a workbook, off the UI thread, with progress.

## Files

- `lib/core/export/xlsx_writer.dart` (new)

## Steps

1. Map field keys to output columns; append after the last used row; write types correctly.

## Acceptance

- [ ] A five-thousand-record export completes without freezing the interface.

## Tests

- Test that output reopens in a spreadsheet reader with correct types.
