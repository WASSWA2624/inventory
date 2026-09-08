# 368 — CSV writer

**Phase** 18 · Export  |  **Depends on** [358](358-value-formatter.md)

## Goal

One file per template, UTF-8 with a byte-order mark and a configurable delimiter.

## Files

- `lib/core/export/csv_writer.dart` (new)

## Steps

1. Quote correctly, escape newlines, and zip when more than one file is produced.

## Tests

- Test round-tripping through a CSV reader.
