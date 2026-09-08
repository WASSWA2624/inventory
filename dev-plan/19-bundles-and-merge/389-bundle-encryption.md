# 389 — Optional bundle encryption

**Phase** 19 · Bundles and merge  |  **Depends on** [387](387-bundle-writer.md), [037](../02-foundation/037-secure-storage-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Password-protect a bundle that will travel on removable media.

## Files

- `lib/core/bundle/bundle_encryption.dart` (new)

## Steps

1. Encrypt the archive with a user-supplied password; never store the password.

## Constraints

- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A wrong password fails cleanly without partial extraction.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
