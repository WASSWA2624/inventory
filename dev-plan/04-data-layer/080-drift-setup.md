# 080 — Drift database bootstrap

**Phase** 04 · Local database  |  **Depends on** [022](../02-foundation/022-folder-scaffold.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Create the database class, connection and code generation wiring.

## Files

- `lib/core/db/app_database.dart` (new)

## Steps

1. Open the database in the application support directory with write-ahead logging enabled.
2. Configure code generation and add the build command to the project README.

## Acceptance

- [ ] The database opens, closes cleanly and survives a hot restart.

## Tests

- Test helper that opens an in-memory database.
