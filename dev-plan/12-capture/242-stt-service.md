# 242 — Speech-to-text service

**Phase** 12 · Capture  |  **Depends on** [241](241-voice-permission.md), [041](../02-foundation/041-ai-service-interface.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

On-device dictation with the configured language, behind one interface.

## Files

- `frontend/lib/core/ai/stt_service.dart` (new)

## Steps

1. Expose partial and final results, cancellation, and the language actually used.
2. Fall back to the online service only when configured and online; otherwise say it is unavailable.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Dictation works with the network off where the platform supports the language.
- [ ] Tests written and passing: Unit test with a fake recogniser.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
