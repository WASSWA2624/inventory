# 270 — Provider registry and selection

**Phase** 13 · Processing  |  **Depends on** [041](../02-foundation/041-ai-service-interface.md), [136](../07-account-and-settings/136-settings-store.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Register the available implementations and choose one per project and per operation. The registry must make the
backend proxy (503) a first-class entry from the start, since it is the default custody arrangement (§30.2).

## Files

- `frontend/lib/core/ai/provider_registry.dart` (new)

## Steps

1. Keep the selection per project and per operation, resolved through one interface with no caller aware of
   which implementation answered.
2. Leave room for an implementation that holds no key at all, because the default one does not: the registry
   entry carries where the key lives, not the key.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching provider requires no change outside settings.
- [ ] A registry entry can declare that its key is held by the backend, and no caller behaves differently.
- [ ] Tests written and passing: unit tests over selection per project and per operation, including a keyless entry.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
