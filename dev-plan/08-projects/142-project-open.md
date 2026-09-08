# 142 — Open a project and current-project provider

**Phase** 08 · Projects  |  **Depends on** [140](140-project-list.md)

## Goal

Hold the currently open project and restore it on launch.

## Files

- `lib/features/projects/presentation/current_project.dart` (new)

## Steps

1. Persist the selection; expose it to every project-scoped route.

## Acceptance

- [ ] Reopening the app returns to the last project.
