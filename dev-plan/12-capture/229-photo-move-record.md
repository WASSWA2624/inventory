# 229 — Move photos to another record

**Phase** 12 · Capture  |  **Depends on** [228](228-photo-multi-select.md), [116](../05-file-storage/116-file-relocation.md)

## Goal

Correct a mistake where photos landed on the wrong record.

## Files

- `lib/features/capture/presentation/photo_move_action.dart` (new)

## Steps

1. Move files and rows in one transaction; flag affected field values as evidence changed.

## Acceptance

- [ ] Moving photos never leaves a dangling evidence link.
