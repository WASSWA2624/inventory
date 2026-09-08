# 201 — Apply context to a new record

**Phase** 11 · Context fields  |  **Depends on** [197](197-context-persistence.md), [094](../04-data-layer/094-record-fields-table.md)

## Goal

Prefill context fields on record creation and snapshot them onto the record.

## Files

- `lib/features/context/domain/context_application.dart` (new)

## Steps

1. Write values with source CONTEXT and store the whole context as the record snapshot.

## Acceptance

- [ ] Ten records captured in one room all carry the same three values without typing.

## Tests

- Test asserting values and source on a new record.
