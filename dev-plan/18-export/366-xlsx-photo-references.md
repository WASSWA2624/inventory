# 366 — Photo reference modes

**Phase** 18 · Export  |  **Depends on** [361](361-xlsx-writer.md), [359](359-photo-naming-service.md)

## Goal

Filename, relative path or embedded image, chosen per project.

## Files

- `lib/core/export/xlsx_photo_refs.dart` (new)

## Steps

1. Implement filename and relative path first; embedding adjusts row height and file size.

## Acceptance

- [ ] Switching mode changes only the photo column.
