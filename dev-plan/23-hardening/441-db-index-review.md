# 441 — Database index review

**Phase** 23 · Hardening  |  **Depends on** [308](../15-records/308-records-search.md), [309](../15-records/309-records-filters.md)

## Goal

Profile the real queries and add the indexes they need.

## Files

- `lib/core/db/migrations.dart` (edit)

## Steps

1. Measure list, search, filter, duplicate lookup and queue queries with realistic data.

## Acceptance

- [ ] Every screen query is measured and documented.

## Tests

- Performance test with a large seeded database.
