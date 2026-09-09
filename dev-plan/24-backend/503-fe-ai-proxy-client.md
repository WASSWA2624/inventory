# 503 — App: route AI through the backend

**Phase** 24 · The minimal backend  |  **Depends on** [498](498-fe-signin-enrol.md), [270](../13-processing/270-provider-registry.md), [486](486-be-ai-proxy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The proxy implementation of the AI service, and the switch that makes it the **default** custody arrangement:
the backend holds the keys, the device holds none (§30.2, §73.1).

## Files

- `frontend/lib/core/ai/proxy_ai_service.dart` (new)

## Steps

1. Implement the existing AiService interface against the backend endpoints; queue on failure exactly as the
   direct provider does (§70.4).
2. Make the proxy the default provider for every project, so a fresh install holds no key and needs none.
3. Keep the device-held key path from 271 alive as the administrator-permitted exception it now is, selectable
   per project and clearly labelled as the lone-operator arrangement.
4. Surface quota, budget and usage from the server (§36) in the same counters the direct path already uses.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A fresh install performs AI extraction with no key ever entered on the device.
- [ ] Choosing the proxy or a device key changes no code in any feature that uses AI.
- [ ] No endpoint, error path or log line can return a provider key to the device.
- [ ] Tests written and passing: Contract tests proving the proxy satisfies the same interface tests as the direct provider.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
