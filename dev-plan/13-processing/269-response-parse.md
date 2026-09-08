# 269 — Parse and validate the response

**Phase** 13 · Processing pipeline  |  **Depends on** [268](268-extraction-request.md), [150](../09-templates/150-field-type-registry.md)

## Goal

Turn the provider response into typed proposals, rejecting anything malformed.

## Files

- `lib/features/processing/domain/response_parser.dart` (new)

## Steps

1. Validate against the schema derived from the template; drop unknown keys; coerce types safely.

## Acceptance

- [ ] A malformed response never corrupts a record.

## Tests

- Unit tests over valid, partial and hostile responses.
