# 422 — Local or removable folder

**Phase** 21 · Manual cloud upload  |  **Depends on** [416](416-destination-model.md), [115](../05-file-storage/115-storage-root.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Copy an export to an SD card or a folder chosen with the system picker.

## Files

- `lib/features/cloud/data/local_destination.dart` (new)

## Constraints

- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Works with no network at all.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
