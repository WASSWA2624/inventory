# 009 — Testing policy per layer

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [004](004-architecture-rules.md)

## Goal

Say exactly what each layer must test so tasks can state their tests in one line.

## Files

- `dev-plan/01-orchestration/_testing.md` (new)

## Steps

1. Domain and pure logic: unit tests, no Flutter binding.
2. Repositories and DAOs: tests against an in-memory database with fixtures.
3. Widgets: behaviour tests; design-system widgets additionally get goldens in light and dark.
4. Flows: integration tests for capture, processing, export and merge.

## Acceptance

- [ ] Each later task can name its test type without re-deciding the approach.
