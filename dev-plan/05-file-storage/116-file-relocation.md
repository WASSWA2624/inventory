# 116 — Relocate files when context changes

**Phase** 05 · File storage  |  **Depends on** [114](114-photo-path-builder.md), [115](115-file-writer.md)

## Goal

Move a record's photos when its context is set or corrected, keeping the database in step.

## Files

- `lib/core/files/file_relocation.dart` (new)

## Steps

1. Move files inside one transaction with the path update; on failure, roll back both.
2. Handle the unfiled case when a context is applied after capture.

## Acceptance

- [ ] Correcting a facility name moves the folder and no reference breaks.

## Tests

- Test that paths and files agree after relocation.
