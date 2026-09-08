# 432 — Redact regions before sending

**Phase** 22 · Privacy and security  |  **Depends on** [122](../05-file-storage/122-compressed-copy.md), [226](../12-capture/226-photo-viewer.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let the user mark regions to be obscured in the copy sent for analysis.

## Files

- `lib/features/capture/presentation/redaction_editor.dart` (new)

## Steps

1. Apply redaction to the derived copy only; mark the photo as redacted-on-send.

## Constraints

- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A marked region cannot reach a provider.
- [ ] Tests written and passing: Test asserting the sent copy differs from the original in the marked region.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
