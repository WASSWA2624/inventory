# 420 — OneDrive and Dropbox

**Phase** 21 · Manual cloud upload  |  **Depends on** [419](419-destination-google-drive.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The same flow for the other two consumer providers.

## Files

- `lib/features/cloud/data/oauth_destinations.dart` (new)

## Reuse

- Shares the OAuth flow and token storage written for Drive.

## Constraints

- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
