# Tapture — development plan

522 implementation prompts, in the order they should be built, from an empty repository to a shippable product: the
Flutter application and the minimal backend it requires.

Every file is a prompt that produces code. There are no policy documents here: the architectural rules live in
`frontend/.rules/` and `backend/.rules/`, and phase 01 ships them as lints, checkers and tests that fail a build when
they are broken.

Read [INDEX.md](INDEX.md) for the full list, or open a phase folder.

## Repository layout

```text
tapture/
├── frontend/           the Flutter application
│   └── .rules/         13 rule files — structure, theming, responsiveness, simplicity, l10n, a11y, ...
├── backend/            the minimal server — required, one per organisation (specification Part XI)
│   └── .rules/         11 rule files — structure, API, data, security, relay boundary, AI proxy, ...
├── dev-plan/           this plan
├── run-tool/           run locally; build the APK, web bundle and backend archive
└── app-write-up.md     the specification
```

Task file paths are written in full: a frontend task touches `frontend/lib/...`, a backend task touches
`backend/src/...`. Nothing is ambiguous about where a file goes.

## The rules come first

Before starting any task, read the rule files it cites. Every task's **Constraints** section names them, and the ones
that matter for that task specifically:

```text
- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`,
  `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
```

Rules are numbered (`FE-THEME-05`, `BE-RELAY-04`) so review cites an identifier instead of an opinion. Most are
enforced by a test; where one is not, that gap is itself a task.

## How to use a task file

Open the lowest unticked task, give the file to a developer or an agent, and build exactly what it says. Each file is
self-contained.

```text
# 230 — Delete a photo

**Phase** 12 · Capture  |  **Depends on** 227, 072, 074

> Implementation prompt. Build exactly this task, then stop.

## Implement           what exists when this is finished
## Files               what to create or change, with full paths
## Contract            the public API other tasks will call
## Steps               how to build it
## Reuse               what must be reused rather than rebuilt
## Constraints         the rules this task may not break
## Definition of done  the checklist, including the tests
## Out of scope        the fence that stops this task growing
```

Five of those are in every task: **Implement**, **Files**, **Constraints**, **Definition of done** and **Out of
scope**. Three appear only where they say something a task cannot say without them — **Contract** where the task
publishes an API other tasks call, **Steps** where the order of work is not obvious from the contract, and **Reuse**
where a task is at genuine risk of rebuilding something that already exists. Their absence is not an omission.

The reuse obligation itself is never optional: it lives in `frontend/.rules/07-consistency.md` (FE-CONS-01, FE-CONS-02)
and `frontend/.rules/01-structure.md` (FE-STR-09), which every task inherits through its Constraints.

## Rules the plan enforces on itself

**One task, one file, one pull request.** If a task feels like two things, it is two things: run
`dart run tool/new_task.dart` and split it.

**Numbers are global and chronological, and dependencies always point backwards.** Working top to bottom means never
being blocked; task 006 builds the checker that proves it stays true.

**Never widen a task.** Every file ends with an Out of scope fence.

**A task is done when** its Definition of done is fully ticked — clean analyzer, applied formatter, written tests,
green guardrails. Every task carries a test obligation naming the layer it owes tests at, because
`frontend/.rules/12-testing.md` (FE-TEST-01) and `backend/.rules/09-testing.md` (BE-TEST-01) both refuse to let a
task close without them. Tests are never a follow-up task.

## Phases

| | Phase | Tasks | What it delivers |
|---|---|---|---|
| 01 | [Project setup and guardrails](01-orchestration/) | 001–022 | The repository, plus every architectural rule as a lint, checker or test |
| 02 | [Foundation services](02-foundation/) | 023–041 | Boots, logs, fails safely; the services everything injects |
| 03 | [Design system](03-design-system/) | 042–083 | Tokens, themes and the whole widget vocabulary, before any screen |
| 04 | [Local database](04-data-layer/) | 084–114 | Every table, with merge columns from the first migration |
| 05 | [File storage](05-file-storage/) | 115–126 | The organised folder tree and every service that writes into it |
| 06 | [Application shell](06-app-shell/) | 127–133 | Navigation, routing and the always-visible status line |
| 07 | [Account and settings](07-account-and-settings/) | 134–142 | Local identity that later becomes an account, app lock, and the switches later features read |
| 08 | [Projects](08-projects/) | 143–152 | The container that owns everything else |
| 09 | [Templates](09-templates/) | 153–185 | Record shapes with atomic columns, and requiredness the user owns |
| 10 | [Reference data](10-reference-data/) | 186–201 | Imported tables, lookups and prefill |
| 11 | [Context](11-context/) | 202–215 | Set a value once; it applies until changed |
| 12 | [Capture](12-capture/) | 216–260 | Evidence in, with as little typing as possible |
| 13 | [Processing](13-processing/) | 261–299 | On-device first, online only when it earns its place |
| 14 | [Records](14-records/) | 300–314 | Find, read and change what was captured |
| 15 | [Data quality](15-data-quality/) | 315–334 | Validation, duplicates, conflicts and verification |
| 16 | [Review](16-review/) | 335–344 | Where a person turns proposals into data |
| 17 | [Meetings](17-meetings/) | 345–358 | Minutes, attendance and actions |
| 18 | [Export](18-export/) | 359–387, 522 | XLSX, CSV, JSON, PDF and ZIP, all produced on device |
| 19 | [Bundles and merge](19-bundles-and-merge/) | 388–411 | Collaboration that never touches the backend |
| 20 | [Data import](20-data-import/) | 412–417 | Continue an inventory someone else started |
| 21 | [Cloud upload](21-cloud-upload/) | 418–428 | A destination for files, never a sync channel |
| 22 | [Privacy and security](22-privacy-and-security/) | 429–438 | What leaves the device, and what never does |
| 23 | [Hardening](23-hardening/) | 439–454 | Fast, legible, reachable, unbreakable in the field |
| 24 | [The minimal backend](24-backend/) | 455–503 | **Required** — accounts, auth, roles, AI functionality and key custody, plus the optional relay |
| 25 | [Testing and release](25-testing-and-release/) | 504–521 | The suites, the pipeline and the gate over both artefacts |

## Why the backend is built late but required

The backend is not optional — every deployment has one (§70) — but it is built after the app, because almost all of
it depends on the app existing first. That ordering is a build sequence, not a statement about what ships. The app is
developed against a local operator profile and, where an administrator permits it, a device-held key; task 497
onwards turns those into an account and server-held key custody, which is the default arrangement (§30.2). Nothing is
shippable until phase 25 passes, and phase 25 gates the app and the backend together.

The one thing inside phase 24 that stays optional is the change relay (§72): tasks 466, 478–483, 501 and 502. An
organisation that never switches it on has a complete product.

## Milestones

**Task 022** — the guardrails are in place. An architectural mistake now fails a test instead of surviving to review.

**Task 083** — the design system is complete. Every later screen is assembled from existing parts.

**Task 387** — the first end-to-end slice works: create a project, choose a template, set context, capture, process,
review, approve, export with photos.

**Task 503** — the backend exists and the app runs on it: one organisation identity, role grants, and AI through the
proxy with no key on the device.

**Task 521** — shippable. The app and the backend pass one gate together, including the run that proves a required
backend is never a required connection.

Task 522 was added after the first numbering and sits with its phase rather than at the end of it: numbers are
allocated by `dart run tool/new_task.dart` from the highest in use, so a task added later keeps a higher number
than the phase around it. Nothing depends on it, so working top to bottom is unaffected.

## Rules that outrank convenience

1. Raw evidence is never destroyed. Refinement writes beside the original.
2. No screen invents a widget, colour, spacing value or error style the design system already has.
3. Nothing blocks capture — not a missing network, not an unreachable server, not a slow provider, not a missing
   template.
4. Every write is local-first and durable before the interface confirms it.
5. AI proposes; a person approves.
6. The backend is required to exist and never required to be reachable. It holds people, permissions and keys; it is
   never the store of record, never a backup, and never in the way of a field worker.

Tasks 010–022 turn the first five into failing tests. `backend/.rules/06-relay-and-retention.md`, tasks 480–482 and
the end-to-end run at 521 do the same for the sixth.
