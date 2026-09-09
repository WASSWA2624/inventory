# 272 — Test connection

**Phase** 13 · Processing  |  **Depends on** [271](271-api-key-entry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A single call that proves the key and endpoint work, with a clear result.

## Files

- `frontend/lib/features/settings/presentation/provider_test_action.dart` (new)

## Steps

1. Send the smallest possible request through the registry in `frontend/lib/core/ai/`; this action never imports a HTTP client itself.
2. Report success, auth failure or network failure distinctly.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Widget test of `provider_test_action.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
