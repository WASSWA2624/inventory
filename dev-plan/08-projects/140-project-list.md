# 140 — Project list screen

**Phase** 08 · Projects  |  **Depends on** [139](139-project-model.md), [067](../03-design-system/067-async-value-view.md), [061](../03-design-system/061-app-list-tile.md)

## Goal

The landing screen: projects with counts, sorted by most recently worked.

## Files

- `lib/features/projects/presentation/project_list_screen.dart` (new)

## Steps

1. Show record count, unprocessed count and last-worked time per project.
2. Empty state offers "Create a project" and "Import a bundle".

## Acceptance

- [ ] Opening the app lands here in under two seconds.

## Tests

- Widget test of loading, empty and populated states.
