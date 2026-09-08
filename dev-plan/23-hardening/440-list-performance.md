# 440 — List and image performance

**Phase** 23 · Hardening  |  **Depends on** [307](../15-records/307-records-list.md), [117](../05-file-storage/117-thumbnail-cache.md)

## Goal

Make long lists and photo grids smooth on a mid-range device.

## Files

- `lib/features/records/presentation/records_list_screen.dart` (edit)

## Steps

1. Virtualise, cache thumbnails, avoid rebuilding rows and cap concurrent decodes.

## Acceptance

- [ ] Scrolling ten thousand records holds a steady frame rate.

## Tests

- Performance test recording frame times.
