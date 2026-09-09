# 494 — Export and destroy server state

**Phase** 24 · The minimal backend  |  **Depends on** [490](490-be-audit-service.md), [491](491-be-metrics.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the two administrative commands the deployment rules require.

## Files

- `backend/src/cli/admin.ts` (new)

## Contract

```ts
npm run admin -- export --out <dir> | npm run admin -- destroy --confirm <org>
```

## Steps

1. Export accounts, devices, memberships, roles, audit and metadata; state plainly that projects are not included.
2. Destroy requires an explicit organisation name and a second confirmation.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/10-deployment.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An operator can leave the product entirely, taking everything the server holds.
- [ ] Tests written and passing: Tests over a seeded database for both commands.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
