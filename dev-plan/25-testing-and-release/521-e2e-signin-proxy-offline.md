# 521 — End-to-end: sign in, proxy AI, then go offline

**Phase** 25 · Testing and release  |  **Depends on** [506](506-test-harness-integration.md), [507](507-e2e-capture-to-export.md), [500](../24-backend/500-fe-offline-authority.md), [503](../24-backend/503-fe-ai-proxy-client.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The end-to-end run that proves the sentence the MVP definition of done turns on (§67): an operator signs in once,
runs AI through the backend with no key on the device, and then does everything else with the server unreachable.

## Files

- `frontend/integration_test/signin_proxy_offline_test.dart` (new)

## Steps

1. Start against a fake backend. Sign in once, enrol the device, and assert the device holds no provider key at any
   point in the run.
2. Capture a record and process it through the AI proxy; assert the extraction succeeds and the usage counter moves.
3. Take the server away. Capture, review, approve, edit and export — all must succeed, with no login screen and no
   blocking dialog.
4. Advance the clock past both cache lifetimes with the server still away. Assert capture, review, edit and export
   still work, and that only relay, the proxy and a role change are refused, each with a plain-language reason.
5. Bring the server back. Assert the session and grant refresh silently, and queued proxy jobs drain on their own.

## Reuse

- The fake backend, the integration harness and the clock injection already exist; this test adds no infrastructure.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/12-testing.md`, `frontend/.rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The run passes with the backend reachable exactly once, at sign-in.
- [ ] No assertion in the run depends on a provider key existing on the device.
- [ ] A failure anywhere in the offline stretch fails the release gate, not just this test.
- [ ] Tests written and passing: the integration test itself, running in the pipeline's integration job.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Relay, which is not in the MVP (§67, §72).
- Anything not named above. Raise it as its own task rather than widening this one.
