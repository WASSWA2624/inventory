# 078 — Widget gallery screen

**Phase** 03 · Design system  |  **Depends on** [067](067-async-value-view.md), [061](061-app-list-tile.md), [063](063-app-status-pill.md), [073](073-app-photo-thumb.md), [068](068-app-dialog-service.md)

## Goal

A developer screen showing every catalogue widget in every state, in all themes and widths.

## Files

- `lib/core/widgets/gallery/widget_gallery_screen.dart` (new)

## Steps

1. List each component with its variants; add a theme and width switcher.
2. Rule: adding a catalogue widget without adding it here fails review.

## Acceptance

- [ ] A developer can see the whole vocabulary in one place before building a screen.
