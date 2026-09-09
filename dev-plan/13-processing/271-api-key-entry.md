# 271 — Device-held API key: the permitted exception

**Phase** 13 · Processing  |  **Depends on** [037](../02-foundation/037-secure-storage-service.md), [270](270-provider-registry.md), [056](../03-design-system/056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let a key be entered and stored safely on the device, masked after entry — as the **exception** §30.2 permits,
not the norm. Custody belongs to the backend (§73.1); this screen exists for the lone operator an administrator
has allowed to work with the server out of reach.

## Files

- `frontend/lib/features/settings/presentation/api_key_screen.dart` (new)

## Steps

1. Store only in platform secure storage; never in the database, a log, an export or a bundle.
2. State on the screen, in one line, that the key lives on this device only and that the usual arrangement is
   for the organisation's backend to hold it.
3. Offer **Test connection** as a single call, and offer removal in one action that also clears the selection.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A key is unreadable after saving and removable in one action.
- [ ] The screen never presents device custody as the recommended arrangement.
- [ ] Tests written and passing: Test asserting the key never appears in the database or an export.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
