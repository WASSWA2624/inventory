# 476 — Organisation user endpoints

**Phase** 24 · The minimal backend  |  **Depends on** [475](475-be-permissions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement listing, creating and updating organisation users, restricted to administrators — and the one
directory endpoint that is not: `GET /auth/me`, which returns the caller's own identity and role grants and is
what the device caches to survive an unreachable server (§70.4, §71.2).

## Files

- `backend/src/routes/org/users.ts` (new)
- `backend/src/routes/auth/me.ts` (new)

## Contract

```ts
GET /api/v1/org/users    POST /api/v1/org/users    PATCH /api/v1/org/users/:id
GET /api/v1/auth/me
```

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/01-structure.md`, `backend/.rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] `GET /auth/me` returns the identity and grants the device caches, and never a credential or a provider key.
- [ ] Listing is cursor-paginated; no endpoint here returns an unbounded list (BE-API-06).
- [ ] Tests written and passing: Route tests including the unauthorised paths and the permission matrix for each role.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
