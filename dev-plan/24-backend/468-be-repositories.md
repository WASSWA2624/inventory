# 468 — Repository base and transactions

**Phase** 24 · The minimal backend  |  **Depends on** [466](466-be-schema-relay.md), [467](467-be-schema-audit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the repository conventions and the transaction helper every multi-table write uses.

## Files

- `backend/src/repositories/base.ts` (new)

## Contract

```ts
withTransaction<T>(fn: (tx: Tx) => Promise<T>): Promise<T>
```

## Steps

1. Parameterised queries only; no SQL outside this folder; map database errors to typed errors.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/01-structure.md`, `backend/.rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A failure mid-transaction leaves no partial rows.
- [ ] Tests written and passing: Integration test with a deliberate mid-transaction failure.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
