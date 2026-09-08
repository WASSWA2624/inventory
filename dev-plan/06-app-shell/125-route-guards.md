# 125 — Route guards

**Phase** 06 · Application shell  |  **Depends on** [123](123-router-setup.md)

## Goal

Send the user somewhere sensible when a route needs a project and none is selected.

## Files

- `lib/app/route_guards.dart` (new)

## Steps

1. Redirect project-scoped routes to the project picker; preserve the intended destination.

## Acceptance

- [ ] Opening a capture link with no project selected asks which project, then continues.
