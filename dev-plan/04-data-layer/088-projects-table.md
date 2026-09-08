# 088 — Projects table

**Phase** 04 · Local database  |  **Depends on** [082](082-column-mixins.md), [083](083-dao-conventions.md)

## Goal

Store projects with status, dates, folder name and settings.

## Files

- `lib/core/db/tables/projects.dart` (new)

## Steps

1. Columns per the specification, with settings held as validated JSON.
2. Index on status and updatedAt for the project list.

## Tests

- DAO test for create, list and update.
