# 517 — App: route AI through the backend

**Phase** 25 · Optional team backend  |  **Depends on** [513](513-fe-team-signin.md), [268](../13-processing/268-provider-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Add the proxy implementation of the AI service so a device in team mode holds no provider key.

## Files

- `frontend/lib/core/ai/proxy_ai_service.dart` (new)

## Steps

1. Implement the existing AiService interface against the backend endpoints; queue on failure exactly as the direct provider does.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching to team mode requires no change in any feature that uses AI.
- [ ] Tests written and passing: Contract tests proving the proxy satisfies the same interface tests as the direct provider.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
