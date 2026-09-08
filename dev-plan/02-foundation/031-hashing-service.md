# 031 — Hashing service

**Phase** 02 · Project foundation  |  **Depends on** [022](022-folder-scaffold.md)

## Goal

Content identity for files and records.

## Files

- `lib/core/hash/hashing_service.dart` (new)

## Steps

1. Implement streaming SHA-256 for files and a string hash for identity keys.

## Acceptance

- [ ] Hashing a large file does not load it entirely into memory.

## Tests

- Unit test against known vectors and a large temporary file.
