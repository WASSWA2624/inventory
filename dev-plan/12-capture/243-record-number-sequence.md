# 243 — Per-project record numbering

**Phase** 12 · Capture  |  **Depends on** [242](242-auto-fields.md), [088](../04-data-layer/088-projects-table.md)

## Goal

Allocate the human-facing sequence safely, even with rapid capture.

## Files

- `lib/features/capture/domain/record_number.dart` (new)

## Steps

1. Allocate inside the same transaction as the record insert to avoid gaps and collisions.

## Acceptance

- [ ] Twenty rapid captures produce twenty consecutive numbers.

## Tests

- Concurrency test with parallel inserts.
