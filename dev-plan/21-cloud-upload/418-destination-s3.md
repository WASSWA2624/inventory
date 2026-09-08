# 418 — Amazon S3 and compatible stores

**Phase** 21 · Manual cloud upload  |  **Depends on** [416](416-destination-model.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Configure and upload to an S3-compatible bucket with user-supplied keys.

## Files

- `lib/features/cloud/data/s3_destination.dart` (new)

## Steps

1. Fields: access key, secret, region, bucket, optional prefix, optional endpoint.

## Constraints

- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A test upload of a small file proves the configuration before any real upload.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
