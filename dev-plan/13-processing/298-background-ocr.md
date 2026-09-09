# 298 — Opportunistic on-device OCR

**Phase** 13 · Processing  |  **Depends on** [266](266-ocr-on-device.md), [038](../02-foundation/038-app-lifecycle-observer.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Pre-read text on unprocessed records while charging, so online work is smaller later.

## Files

- `frontend/lib/features/processing/domain/background_ocr.dart` (new)

## Steps

1. Run only while charging and idle; stop immediately on resume.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Battery use is negligible and no network is used.
- [ ] Tests written and passing: Unit tests of `background_ocr.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
