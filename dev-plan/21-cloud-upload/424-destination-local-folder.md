# 424 — Local or removable folder

**Phase** 21 · Cloud upload  |  **Depends on** [418](418-destination-model.md), [115](../05-file-storage/115-storage-root.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Copy an export to an SD card or a folder chosen with the system picker.

## Files

- `frontend/lib/core/cloud/local_destination.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`.
- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Works with no network at all.
- [ ] Tests written and passing: Unit tests of `local_destination.dart` against its fake.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
