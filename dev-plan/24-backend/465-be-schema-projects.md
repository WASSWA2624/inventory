# 465 — Schema: projects, members and roles

**Phase** 24 · The minimal backend  |  **Depends on** [464](464-be-schema-identity.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the migration for project registration and membership, using the client-generated project identifiers.

## Files

- `backend/migrations/002_projects.sql` (new)

## Steps

1. Projects store only the identifier, name, organisation and relay settings — never content.
2. Members join users to projects with a role and an optional context scope.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The server never invents or reassigns a project identifier.
- [ ] Tests written and passing: Integration tests for membership and scoping.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
