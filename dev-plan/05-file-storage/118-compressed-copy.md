# 118 — Compressed upload copy

**Phase** 05 · File storage  |  **Depends on** [115](115-file-writer.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Produce the reduced copy used for online analysis, leaving the original untouched.

## Files

- `lib/core/files/compressed_copy.dart` (new)

## Steps

1. Resize to the configured long edge and quality; write into .cache; return path and size.

## Acceptance

- [ ] The original file is byte-identical before and after.

## Tests

- Test comparing the original hash before and after compression.
