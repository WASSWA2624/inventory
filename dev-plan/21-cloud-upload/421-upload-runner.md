# 421 — Upload with progress and resume

**Phase** 21 · Manual cloud upload  |  **Depends on** [420](420-upload-confirm.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Upload large archives reliably, with progress, cancel and resume.

## Files

- `lib/features/cloud/domain/upload_runner.dart` (new)

## Steps

1. Chunk large files where the provider supports it; retry transient failures with backoff.

## Acceptance

- [ ] A failed upload changes nothing locally and can be retried.
