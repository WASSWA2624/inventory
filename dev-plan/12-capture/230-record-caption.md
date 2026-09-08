# 230 — Record caption field

**Phase** 12 · Capture  |  **Depends on** [211](211-capture-screen.md), [052](../03-design-system/052-app-text-field.md), [097](../04-data-layer/097-captions-table.md)

## Goal

The main description of the item, typed or spoken, stored raw.

## Files

- `lib/features/capture/presentation/record_caption_field.dart` (new)

## Steps

1. Persist as the raw caption immediately; never send it anywhere on its own.

## Acceptance

- [ ] Text survives backgrounding without an explicit save.
