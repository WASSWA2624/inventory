# 108 — Test fixtures and object factories

**Phase** 04 · Local database  |  **Depends on** [009](../01-orchestration/009-testing-policy.md), [093](093-records-table.md), [090](090-template-fields-table.md)

## Goal

Builders that make a valid project, template, record and photo in one line.

## Files

- `test/support/factories.dart` (new)

## Steps

1. Provide factories with sensible defaults and named overrides; seed an in-memory database in one call.

## Acceptance

- [ ] Later tests are short and do not repeat setup.
