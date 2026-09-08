# 023 — Application bootstrap

**Phase** 02 · Project foundation  |  **Depends on** [021](021-strict-lints.md), [022](022-folder-scaffold.md)

## Goal

One entry point that installs error handling, the provider scope and the theme before the first frame.

## Files

- `lib/main.dart` (edit)
- `lib/app/app.dart` (new)

## Steps

1. Wrap the app in runZonedGuarded and set FlutterError.onError to the logger.
2. Install ProviderScope and a single MaterialApp.router placeholder.
3. Ensure bindings are initialised before any platform call.

## Acceptance

- [ ] An uncaught error is logged rather than lost, and the app still renders.

## Tests

- Widget test that the app builds.
