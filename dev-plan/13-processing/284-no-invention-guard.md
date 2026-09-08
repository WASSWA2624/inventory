# 284 — No-invention enforcement

**Phase** 13 · Processing pipeline  |  **Depends on** [269](269-response-parse.md), [281](281-evidence-linking.md)

## Goal

Reject values the evidence does not support.

## Files

- `lib/features/processing/domain/no_invention_guard.dart` (new)

## Steps

1. Drop values with an empty evidence list for fields marked evidence-required.
2. Reject values contradicting an identifier pattern or an option list.

## Acceptance

- [ ] A missing purchase year stays "Not detected" rather than becoming a guess.

## Tests

- Unit tests over fabricated responses.
