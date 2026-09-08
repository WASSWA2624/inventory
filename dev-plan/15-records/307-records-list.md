# 307 — Records list screen

**Phase** 15 · Records  |  **Depends on** [305](305-record-model.md), [067](../03-design-system/067-async-value-view.md), [061](../03-design-system/061-app-list-tile.md)

## Goal

The paged list with number, name, identifier, context and status.

## Files

- `lib/features/records/presentation/records_list_screen.dart` (new)

## Steps

1. Virtualised paging; two-pane list and detail on expanded layouts.

## Acceptance

- [ ] Ten thousand records scroll smoothly.

## Tests

- Widget test of paging and empty state.
