# 359 — Photo naming service

**Phase** 18 · Export  |  **Depends on** [113](../05-file-storage/113-path-sanitizer.md), [227](../12-capture/227-photo-type-assign.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Build meaningful file names from the configured pattern and available tokens.

## Files

- `lib/core/export/photo_naming.dart` (new)

## Steps

1. Support the tokens from the specification, including context levels; sanitise and de-duplicate.

## Acceptance

- [ ] Names match the specification examples exactly.

## Tests

- Unit tests over the token set and collisions.
