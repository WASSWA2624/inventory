# 083 — DAO base and conventions

**Phase** 04 · Local database  |  **Depends on** [082](082-column-mixins.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

One shape for every DAO: typed queries, Result returns, streams for lists.

## Files

- `lib/core/db/base_dao.dart` (new)

## Steps

1. Provide watchAll, getById, upsert, softDelete and paged query helpers.
2. Map database exceptions to storage failures.

## Acceptance

- [ ] Later table tasks are a schema plus a thin DAO, nothing more.
