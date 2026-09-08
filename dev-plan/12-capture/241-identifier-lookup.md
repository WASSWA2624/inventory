# 241 — Identifier-first lookup

**Phase** 12 · Capture  |  **Depends on** [239](239-barcode-scanner.md), [192](../10-reference-data/192-lookup-prefill-apply.md), [093](../04-data-layer/093-records-table.md)

## Goal

Turn a scanned or typed identifier into an existing record or a prefilled new one.

## Files

- `lib/features/capture/domain/identifier_lookup.dart` (new)

## Steps

1. Search existing records first, then reference datasets, then offer a new record with the identifier filled.

## Acceptance

- [ ] All three outcomes from the specification are reachable in one tap each.

## Tests

- Unit tests for match, reference match and no match.
