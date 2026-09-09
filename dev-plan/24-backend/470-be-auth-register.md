# 470 — Account creation, invitation and password lifecycle

**Phase** 24 · The minimal backend  |  **Depends on** [469](469-be-auth-passwords.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement the account lifecycle §71.1 names other than sign-in: administrator-created accounts, invitation
acceptance, password change and password reset. These are four of the endpoints §74.2 lists, and §74.2 is the
whole API (BE-API-01), so they are built here rather than left implied.

## Files

- `backend/src/routes/auth/register.ts` (new)
- `backend/src/routes/auth/password.ts` (new)
- `backend/src/services/auth/register.ts` (new)
- `backend/src/services/auth/password.ts` (new)

## Contract

```ts
POST /api/v1/auth/register           POST /api/v1/auth/change-password
POST /api/v1/auth/reset
```

## Steps

1. Validate input by schema; enforce unique email per organisation; never reveal whether an email exists.
2. Change-password requires the current password, re-hashes with the Argon2id parameters of task 469, and
   invalidates every refresh-token family for that user so old sessions cannot outlive the change.
3. Reset issues a single-use, short-lived, rate-limited token and answers identically whether or not the
   address is known, so the endpoint is not an account oracle (BE-SEC-07, BE-API-09).
4. Every one of these writes an administrative audit entry (BE-OBS-07).

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/05-security.md`, `backend/.rules/03-api-design.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Self-service registration is disabled unless the organisation enables it.
- [ ] A changed or reset password invalidates every existing refresh-token family for that user.
- [ ] Neither reset nor register reveals whether an address exists.
- [ ] Tests written and passing: Route tests for success, duplicate, disabled, wrong-current-password, expired
      reset token and replayed reset token.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
