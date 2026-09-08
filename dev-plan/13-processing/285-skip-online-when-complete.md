# 285 — Skip the online stage when possible

**Phase** 13 · Processing pipeline  |  **Depends on** [262](262-identifier-extraction.md), [192](../10-reference-data/192-lookup-prefill-apply.md), [256](256-job-runner.md)

## Goal

Do not pay for a call when local extraction plus a reference match already fills the record.

## Files

- `lib/features/processing/domain/online_skip_rule.dart` (new)

## Steps

1. Skip when every required field is filled and confident; record the skip reason on the job.

## Acceptance

- [ ] A scanned known asset completes with no online call.

## Tests

- Test proving zero calls on the fully matched path.
