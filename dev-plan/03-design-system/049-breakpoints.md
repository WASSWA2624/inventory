# 049 — Breakpoints and responsive helpers

**Phase** 03 · Design system  |  **Depends on** [018](../01-orchestration/018-responsiveness-policy.md), [044](044-spacing-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One source of truth for size classes and a helper that resolves values per class.

## Files

- `lib/core/widgets/responsive/breakpoints.dart` (new)

## Contract

```dart
enum SizeClass { compact, medium, expanded }
extension SizeClassX on BuildContext { SizeClass get sizeClass; T responsive<T>({required T compact, T? medium, T? expanded}); }
```

## Steps

1. Define compact, medium and expanded; expose a context extension and a value resolver.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No widget compares MediaQuery width directly after this task.
- [ ] Tests written and passing: Unit test of resolution at boundary widths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
