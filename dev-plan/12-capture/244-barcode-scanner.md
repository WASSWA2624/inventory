# 244 — Barcode and QR scanner

**Phase** 12 · Capture  |  **Depends on** [217](217-camera-permission-flow.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Scan the symbologies listed in the specification, fast and one-handed.

## Files

- `lib/features/capture/presentation/barcode_scanner_screen.dart` (new)

## Steps

1. Show a scan region, torch toggle and the decoded value with a confirm action.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A worn label still scans within a couple of seconds.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
