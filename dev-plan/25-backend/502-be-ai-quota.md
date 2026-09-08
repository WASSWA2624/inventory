# 502 — Budgets, quotas and usage

**Phase** 25 · Optional team backend  |  **Depends on** [501](501-be-ai-proxy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Enforce per-project and per-organisation budgets server-side, and report usage.

## Files

- `backend/src/services/ai/quota.ts` (new)

## Contract

```dart
GET /api/v1/ai/usage?project=&from=&to=
```

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/07-ai-proxy.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A runaway client cannot exceed the organisation budget, because the limit is not on the client.
- [ ] Tests written and passing: Tests at, below and above each limit.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
