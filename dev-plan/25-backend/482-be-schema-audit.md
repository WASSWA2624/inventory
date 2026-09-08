# 482 — Schema: audit and security events

**Phase** 25 · Optional team backend  |  **Depends on** [479](479-be-schema-identity.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the append-only tables for administrative and security events.

## Files

- `backend/migrations/004_audit.sql` (new)

## Steps

1. Record actor, target, action, outcome and time; forbid update and delete by constraint or trigger.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Integration test proving rows cannot be modified.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
