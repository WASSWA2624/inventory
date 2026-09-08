# 052 — Text field

**Phase** 03 · Design system  |  **Depends on** [042](042-theme-assembly.md), [040](040-spacing-tokens.md)

## Goal

The single text input: label, hint, helper, error, prefix and suffix slots, clear button.

## Files

- `lib/core/widgets/fields/app_text_field.dart` (new)

## Steps

1. Support single and multi-line, character counter, and a trailing slot for the microphone or scanner.
2. Surface validation errors from the shared validation display.

## Acceptance

- [ ] All later fields reuse this rather than raw TextFormField.

## Tests

- Widget tests for error display and clearing.
