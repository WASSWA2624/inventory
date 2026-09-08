# 443 — Memory and leak review

**Phase** 23 · Hardening  |  **Depends on** [440](440-list-performance.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Find and fix leaks and peaks during capture, export and merge.

## Steps

1. Profile long capture sessions and large exports; ensure isolates and streams are disposed.

## Acceptance

- [ ] A two-hundred-record session does not grow memory without bound.
