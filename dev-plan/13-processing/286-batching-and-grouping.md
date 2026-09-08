# 286 — Group images into one request

**Phase** 13 · Processing pipeline  |  **Depends on** [268](268-extraction-request.md)

## Goal

One request per record, not one per photo.

## Files

- `lib/features/processing/domain/request_batching.dart` (new)

## Steps

1. Cap images per request and split large sets deterministically.

## Acceptance

- [ ] A five-photo record produces exactly one extraction call.
