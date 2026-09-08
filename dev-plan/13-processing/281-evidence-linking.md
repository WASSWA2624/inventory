# 281 — Link values to their evidence

**Phase** 13 · Processing pipeline  |  **Depends on** [100](../04-data-layer/100-evidence-table.md), [272](272-proposal-application.md), [259](259-ocr-on-device.md)

## Goal

Record which photo region, page or transcript produced each value.

## Files

- `lib/features/processing/domain/evidence_linking.dart` (new)

## Steps

1. Store photo id and bounding region when the provider supplies one; fall back to the whole photo.

## Acceptance

- [ ] Every extracted value can be traced to a source in the review screen.

## Tests

- Test that each applied value writes at least one evidence row.
