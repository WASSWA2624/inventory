# 115 — Storage root resolution

**Phase** 05 · File storage  |  **Depends on** [036](../02-foundation/036-permissions-service.md), [026](../02-foundation/026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Resolve and create the visible Tapture root folder on the device.

## Files

- `lib/core/files/storage_root.dart` (new)

## Steps

1. Resolve the documents directory, create Tapture/, and expose it as a single provider.
2. Handle a missing or unwritable location with a recoverable failure.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The folder is visible over a cable and in a file manager.
- [ ] Tests written and passing: Unit test with a temporary directory.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
