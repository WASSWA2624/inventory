# 073 — Photo thumbnail

**Phase** 03 · Design system  |  **Depends on** [040](040-spacing-tokens.md), [038](038-color-tokens.md)

## Goal

Square thumbnail with type badge, caption indicator, selection state and error placeholder.

## Files

- `lib/core/widgets/app_photo_thumb.dart` (new)

## Steps

1. Load from a cached thumbnail path; never decode a full image for a thumbnail.

## Acceptance

- [ ] Scrolling a tray of thirty photos stays smooth.

## Tests

- Golden test of badge and selection states.
