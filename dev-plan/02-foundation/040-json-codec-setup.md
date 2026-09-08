# 040 — Serialisation conventions

**Phase** 02 · Foundation services  |  **Depends on** [004](../01-orchestration/004-folder-scaffold.md), [003](../01-orchestration/003-strict-lints.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Configure code generation for immutable models and write the shared converters every model reuses.

## Files

- `build.yaml` (new)
- `lib/core/serialisation/converters.dart` (new)

## Contract

```dart
class UtcDateTimeConverter implements JsonConverter<DateTime, String>;  class JsonMapConverter ...
```

## Steps

1. Configure the generator, then write converters for UTC date-times, enums with stable wire names and JSON-held maps.
2. Fix the rule that every wire name is stable and never derived from a Dart identifier that may be renamed.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Renaming a Dart field does not change the serialised key.
- [ ] Tests written and passing: `test/core/serialisation/converters_test.dart` round-trips each converter.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
