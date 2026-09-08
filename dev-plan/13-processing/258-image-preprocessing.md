# 258 — Image preprocessing

**Phase** 13 · Processing pipeline  |  **Depends on** [118](../05-file-storage/118-compressed-copy.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Prepare images for extraction without touching originals.

## Files

- `lib/features/processing/domain/image_preprocess.dart` (new)

## Steps

1. Resize, correct orientation, deskew, improve contrast and detect boundaries into derived copies.

## Acceptance

- [ ] Originals are byte-identical after preprocessing.

## Tests

- Hash comparison test.
