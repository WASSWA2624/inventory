# 500 — Provider key custody

**Phase** 25 · Optional team backend  |  **Depends on** [499](499-be-ai-provider.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Load provider keys from the secret store and make it impossible for one to leave the server.

## Files

- `backend/src/services/ai/keys.ts` (new)

## Steps

1. Read from the secret store at boot; never expose through any route; never write to a log or an error.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/07-ai-proxy.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A key cannot be retrieved through any endpoint, including error paths.
- [ ] Tests written and passing: A test scanning every route response and log line for key patterns.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
