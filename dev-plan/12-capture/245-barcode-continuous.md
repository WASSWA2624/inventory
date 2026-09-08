# 245 — Continuous scan mode

**Phase** 12 · Capture  |  **Depends on** [244](244-barcode-scanner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Keep the scanner open for stock counting, one scan per item.

## Files

- `lib/features/capture/presentation/barcode_continuous_mode.dart` (new)

## Steps

1. Debounce repeat reads of the same code; show a running count; allow undo of the last scan.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Fifty items can be counted without leaving the screen.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
