# 428 — Face blurring on export

**Phase** 22 · Privacy and security  |  **Depends on** [032](../02-foundation/032-isolate-runner.md), [376](../18-export/376-zip-package.md)

## Goal

Optionally blur detected faces in exported photos, keeping originals untouched.

## Files

- `lib/core/export/face_blur.dart` (new)

## Steps

1. Process copies only; report how many faces were found per photo.

## Acceptance

- [ ] The original photo on the device is never modified.

## Tests

- Test comparing original hashes before and after export.
