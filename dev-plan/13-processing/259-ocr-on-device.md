# 259 — On-device OCR

**Phase** 13 · Processing pipeline  |  **Depends on** [258](258-image-preprocessing.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Extract text and blocks locally, with no network.

## Files

- `lib/core/ai/ocr_service.dart` (new)

## Steps

1. Return text, blocks and bounding boxes; run in an isolate; work with the radio off.

## Acceptance

- [ ] A rating plate photo yields readable text offline.

## Tests

- Test against a fixture image with known text.
