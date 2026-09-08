# 265 — API key entry

**Phase** 13 · Processing pipeline  |  **Depends on** [036](../02-foundation/036-secure-storage-service.md), [264](264-provider-registry.md), [052](../03-design-system/052-app-text-field.md)

## Goal

Let the user enter and store a key safely, masked after entry.

## Files

- `lib/features/settings/presentation/api_key_screen.dart` (new)

## Steps

1. Store only in secure storage; never log, export or include in a bundle.

## Acceptance

- [ ] A key is unreadable after saving and removable in one action.

## Tests

- Test asserting the key never appears in the database or an export.
