# 283 — Refine captions

**Phase** 13 · Processing pipeline  |  **Depends on** [263](263-ai-service-interface.md), [097](../04-data-layer/097-captions-table.md), [237](../12-capture/237-transcript-preservation.md)

## Goal

Produce the cleaned caption, stored beside the raw one, never over it.

## Files

- `lib/features/processing/domain/caption_refinement.dart` (new)

## Steps

1. Refine only on request or when the project enables automatic refinement.
2. Forbid additions: the refiner may reword, not introduce facts.

## Acceptance

- [ ] Raw and refined are both retrievable and both exportable.

## Tests

- Test asserting the raw row is unchanged.
