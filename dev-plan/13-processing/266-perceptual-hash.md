# 266 — Perceptual hash and duplicate image detection

**Phase** 13 · Processing pipeline  |  **Depends on** [032](../02-foundation/032-hashing-service.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Recognise the same or near-same photo to avoid paying twice.

## Files

- `lib/core/hash/perceptual_hash.dart` (new)

## Steps

1. Compute a difference hash; expose a distance function with a configurable threshold.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Unit tests over resized, recompressed and unrelated images.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
