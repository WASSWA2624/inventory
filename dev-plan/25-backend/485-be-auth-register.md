# 485 — Account creation and invitation

**Phase** 25 · Optional team backend  |  **Depends on** [484](484-be-auth-passwords.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement administrator-created accounts and invitation acceptance.

## Files

- `backend/src/routes/auth/register.ts` (new)
- `backend/src/services/auth/register.ts` (new)

## Steps

1. Validate input by schema; enforce unique email per organisation; never reveal whether an email exists.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/05-security.md`, `backend/rules/03-api-design.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Self-service registration is disabled unless the organisation enables it.
- [ ] Tests written and passing: Route tests for success, duplicate and disabled cases.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
