# 484 — AI provider abstraction

**Phase** 24 · The minimal backend  |  **Depends on** [457](457-be-config.md), [459](459-be-error-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the interface every provider implements, plus a fake used by every test.

## Files

- `backend/src/services/ai/provider.ts` (new)

## Contract

```ts
interface AiProvider { extract(req): Promise<Res>; ocr(req): Promise<Res>; transcribe(req): Promise<Res>; refine(req): Promise<Res> }
```

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/07-ai-proxy.md`, `backend/.rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Adding a provider is one implementation and one configuration value, with no route change.
- [ ] Tests written and passing: Contract tests every implementation must pass.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
