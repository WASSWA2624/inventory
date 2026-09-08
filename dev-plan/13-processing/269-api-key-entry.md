# 269 — API key entry

**Phase** 13 · Processing pipeline  |  **Depends on** [037](../02-foundation/037-secure-storage-service.md), [268](268-provider-registry.md), [056](../03-design-system/056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let the user enter and store a key safely, masked after entry.

## Files

- `frontend/lib/features/settings/presentation/api_key_screen.dart` (new)

## Steps

1. Store only in secure storage; never log, export or include in a bundle.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A key is unreadable after saving and removable in one action.
- [ ] Tests written and passing: Test asserting the key never appears in the database or an export.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
