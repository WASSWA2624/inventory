# 208 — Wire context into the folder path

**Phase** 11 · Context fields  |  **Depends on** [201](201-context-apply-to-record.md), [114](../05-file-storage/114-photo-path-builder.md)

## Goal

Photos land in the folder tree that matches their context.

## Files

- `lib/features/context/domain/context_folder_link.dart` (new)

## Acceptance

- [ ] The on-disk tree mirrors the specification example exactly.

## Tests

- Integration test capturing into a three-level context.
