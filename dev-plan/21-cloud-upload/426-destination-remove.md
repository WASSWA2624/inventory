# 426 — Remove a destination

**Phase** 21 · Manual cloud upload  |  **Depends on** [417](417-destination-list.md), [037](../02-foundation/037-secure-storage-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Delete the destination and purge its credentials from secure storage.

## Files

- `lib/features/cloud/presentation/destination_remove_action.dart` (new)

## Constraints

- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Removing a destination leaves no credential behind.
- [ ] Tests written and passing: Test that secure storage no longer holds the entry.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
