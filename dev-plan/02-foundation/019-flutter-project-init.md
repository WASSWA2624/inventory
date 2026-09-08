# 019 — Create the Flutter project

**Phase** 02 · Project foundation  |  **Depends on** [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Initialise the Flutter application in the repository root with the Tapture identity.

## Files

- `pubspec.yaml` (new)
- `lib/main.dart` (new)

## Steps

1. Create the project with organisation com.tapture and package name tapture, Android target first.
2. Set the display name to Tapture and the application id to com.tapture.app.
3. Remove the counter demo and its test.

## Acceptance

- [ ] The app builds and launches to a blank scaffold on a device.

## Tests

- Smoke test that the app boots without exceptions.
