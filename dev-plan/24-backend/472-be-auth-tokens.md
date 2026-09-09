# 472 — Access and refresh tokens

**Phase** 24 · The minimal backend  |  **Depends on** [471](471-be-auth-login.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement short-lived access tokens and rotating refresh tokens bound to an enrolled device, plus the refresh
and sign-out endpoints that spend them (§74.2).

## Files

- `backend/src/services/auth/tokens.ts` (new)
- `backend/src/routes/auth/session.ts` (new)

## Contract

```ts
issueTokens(userId, deviceId): Promise<TokenPair>;  rotate(refresh: string): Promise<TokenPair>
revoke(refresh: string): Promise<void>

POST /api/v1/auth/refresh            POST /api/v1/auth/logout
```

## Steps

1. Detect refresh reuse, invalidate the family and log a security event.
2. Sign-out revokes the presenting device's refresh-token family and is idempotent: signing out twice, or with
   an already-expired token, succeeds silently rather than erroring (BE-API-07).
3. Sign-out is a server-side revocation only. It never reaches the device's project data, which stays exactly
   where it is (§70.2).

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/05-security.md`, `backend/.rules/03-api-design.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A stolen refresh token cannot be replayed after rotation.
- [ ] Signing out twice succeeds both times and revokes exactly one family.
- [ ] Tests written and passing: Tests for rotation, expiry, reuse detection and repeated sign-out.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
