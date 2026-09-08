# 114 — Context-based photo path builder

**Phase** 05 · File storage  |  **Depends on** [113](113-path-sanitizer.md), [112](112-project-folder-service.md)

## Goal

Build the photo folder path from the context hierarchy in force.

## Files

- `lib/core/files/photo_path_builder.dart` (new)

## Steps

1. Compose photos/<level1>/<level2>/<level3>/ from sanitised context values, falling back to _unfiled.
2. Support the alternative folder strategies: by template, by capture date, flat.

## Acceptance

- [ ] The tree on disk matches the specification example exactly.

## Tests

- Unit tests for each strategy and for missing context.
