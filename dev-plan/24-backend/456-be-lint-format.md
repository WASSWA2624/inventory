# 456 — Lint, format and the verify command

**Phase** 24 · The minimal backend  |  **Depends on** [455](455-be-project-init.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the single gate command that runs format, lint, type check and tests, identically here and in continuous integration.

## Files

- `backend/.eslintrc.cjs` (new)
- `backend/scripts/verify.ts` (new)

## Steps

1. Configure lint rules that ban any, non-null assertions, floating promises, console statements and circular imports.
2. The verify script exits non-zero when any stage fails and prints one summary table.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/01-structure.md`, `backend/.rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] One command reproduces the whole review gate.
- [ ] Tests written and passing: `backend/test/tools/verify.test.ts` asserts exit-code aggregation.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
