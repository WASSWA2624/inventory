# 490 — Audit and security event recording

**Phase** 24 · The minimal backend  |  **Depends on** [467](467-be-schema-audit.md), [475](475-be-permissions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Record every administrative and security-relevant action in the append-only log.

## Files

- `backend/src/services/audit.ts` (new)

## Steps

1. Cover user creation, role change, key rotation, retention change, relay enablement, device revocation and purge runs.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/08-observability.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every privileged action is attributable to an actor and a time.
- [ ] Tests written and passing: Tests asserting one row per action with actor, target and outcome.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
