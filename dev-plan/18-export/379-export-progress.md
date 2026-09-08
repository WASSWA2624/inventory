# 379 — Export progress and cancellation

**Phase** 18 · Export  |  **Depends on** [378](378-export-screen.md), [072](../03-design-system/072-app-progress-steps.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Show per-stage progress and allow cancellation without leaving partial files.

## Files

- `lib/features/exports/presentation/export_progress.dart` (new)

## Acceptance

- [ ] A cancelled export leaves no half-written archive.
