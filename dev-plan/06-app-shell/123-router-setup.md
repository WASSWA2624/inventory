# 123 — Router setup

**Phase** 06 · Application shell  |  **Depends on** [023](../02-foundation/023-app-bootstrap.md), [022](../02-foundation/022-folder-scaffold.md)

## Goal

Install GoRouter with typed routes and a single place where every path is declared.

## Files

- `lib/app/router.dart` (new)

## Steps

1. Declare the route table from the specification; add a not-found route rendering the error state.
2. Expose typed navigation helpers so no screen builds a path string by hand.

## Acceptance

- [ ] Deep linking to a record opens it directly.

## Tests

- Unit test that every declared route resolves.
