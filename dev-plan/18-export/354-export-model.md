# 354 — Export request model

**Phase** 18 · Export  |  **Depends on** [104](../04-data-layer/104-exports-table.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

Model an export: formats, scope, column options, extras and the resulting files.

## Files

- `lib/features/exports/domain/export_request.dart` (new)

## Steps

1. Make the request serialisable so an export can be repeated exactly.

## Tests

- Round-trip test of the request.
