# 232 — Caption scope: this, selected, all

**Phase** 12 · Capture  |  **Depends on** [231](231-photo-caption.md), [228](228-photo-multi-select.md)

## Goal

The explicit target selector from the specification, with the count always visible.

## Files

- `lib/features/capture/presentation/caption_scope_selector.dart` (new)

## Steps

1. Default to this photo from a single thumbnail and to selected from multi-select.
2. Show the exact counts, for example "Selected photos (3)" and "All photos (7)".

## Acceptance

- [ ] The user can never apply a caption without seeing how many photos it will touch.

## Tests

- Widget test of default selection in both entry paths.
