# 251 — Optional GPS capture

**Phase** 12 · Capture  |  **Depends on** [036](../02-foundation/036-permissions-service.md), [136](../07-account-and-settings/136-settings-store.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record coordinates and accuracy when, and only when, the project enables it.

## Files

- `frontend/lib/features/capture/domain/gps_capture.dart` (new)

## Steps

1. Time-box the fix; store accuracy; never block saving on a slow fix.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] With GPS off, no location permission is requested anywhere.
- [ ] Tests written and passing: Test that the disabled path makes no location call.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
