# 486 — AI proxy endpoints

**Phase** 24 · The minimal backend  |  **Depends on** [485](485-be-ai-keys.md), [473](473-be-auth-middleware.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement the pass-through endpoints that forward the device's request to the provider and return the result unchanged.

## Files

- `backend/src/routes/ai.ts` (new)

## Steps

1. Do not rewrite prompts, inject instructions or reinterpret results; the device owns the model contract.
2. Stream or buffer within the configured size limit; never persist a payload beyond the request.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/07-ai-proxy.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No image, audio or extracted text is written to disk, database or cache.
- [ ] Tests written and passing: Tests asserting nothing is persisted and that metadata-only logging occurs.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
