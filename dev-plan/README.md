# Tapture — development plan

517 implementation prompts, in the order they should be built, from an empty repository to a shippable app plus its
optional team backend.

Every file is a prompt that produces code. There are no policy documents here: the architectural rules live in
`frontend/rules/` and `backend/rules/`, and phase 01 ships them as lints, checkers and tests that fail a build when
they are broken.

Read [INDEX.md](INDEX.md) for the full list, or open a phase folder.

## Repository layout

```text
tapture/
├── frontend/           the Flutter application
│   └── rules/          14 rule files — structure, theming, responsiveness, simplicity, l10n, a11y, ...
├── backend/            the optional team server (post-MVP, specification Part XI)
│   └── rules/          12 rule files — structure, API, data, security, relay boundary, AI proxy, ...
├── dev-plan/           this plan
└── app-write-up.md     the specification
```

Task file paths are written in full: a frontend task touches `frontend/lib/...`, a backend task touches
`backend/src/...`. Nothing is ambiguous about where a file goes.

## The rules come first

Before starting any task, read the rule files it cites. Every task's **Constraints** section names them, and the ones
that matter for that task specifically:

```text
- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/04-theming.md`,
  `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
```

Rules are numbered (`FE-THEME-05`, `BE-RELAY-04`) so review cites an identifier instead of an opinion. Most are
enforced by a test; where one is not, that gap is itself a task.

## How to use a task file

Open the lowest unticked task, give the file to a developer or an agent, and build exactly what it says. Each file is
self-contained.

```text
# 228 — Delete a photo

**Phase** 12 · Capture  |  **Depends on** 225, 072, 074

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

## Rules the plan enforces on itself

**One task, one file, one pull request.** If a task feels like two things, it is two things: run
`dart run tool/new_task.dart` and split it.

**Numbers are global and chronological, and dependencies always point backwards.** Working top to bottom means never
being blocked; task 006 builds the checker that proves it stays true.

**Never widen a task.** Every file ends with an Out of scope fence.

**A task is done when** its Definition of done is fully ticked — clean analyzer, applied formatter, written tests,
green guardrails.

## Phases

| | Phase | Tasks | What it delivers |
|---|---|---|---|
| 01 | [Project setup and guardrails](01-orchestration/) | 001–022 | The repository, plus every architectural rule as a lint, checker or test |
| 02 | [Foundation services](02-foundation/) | 023–041 | Boots, logs, fails safely; the services everything injects |
| 03 | [Design system](03-design-system/) | 042–083 | Tokens, themes and the whole widget vocabulary, before any screen |
| 04 | [Local database](04-data-layer/) | 084–114 | Every table, with merge columns from the first migration |
| 05 | [File storage](05-file-storage/) | 115–126 | The organised folder tree and every service that writes into it |
| 06 | [Application shell](06-app-shell/) | 127–133 | Navigation, routing and the always-visible status line |
| 07 | [Operator and settings](07-operator-and-settings/) | 134–142 | Local identity, app lock, and the switches later features read |
| 08 | [Projects](08-projects/) | 143–152 | The container that owns everything else |
| 09 | [Templates](09-templates/) | 153–183 | Shipped, hand-built and spreadsheet-derived record shapes |
| 10 | [Reference data](10-reference-data/) | 184–199 | Imported tables, lookups and prefill |
| 11 | [Context](11-context/) | 200–213 | Set a value once; it applies until changed |
| 12 | [Capture](12-capture/) | 214–258 | Evidence in, with as little typing as possible |
| 13 | [Processing](13-processing/) | 259–297 | On-device first, online only when it earns its place |
| 14 | [Records](14-records/) | 298–312 | Find, read and change what was captured |
| 15 | [Data quality](15-data-quality/) | 313–332 | Validation, duplicates, conflicts and verification |
| 16 | [Review](16-review/) | 333–342 | Where a person turns proposals into data |
| 17 | [Meetings](17-meetings/) | 343–356 | Minutes, attendance and actions |
| 18 | [Export](18-export/) | 357–385 | XLSX, CSV, JSON, PDF and ZIP, all produced on device |
| 19 | [Bundles and merge](19-bundles-and-merge/) | 386–409 | Collaboration with no server |
| 20 | [Data import](20-data-import/) | 410–415 | Continue an inventory someone else started |
| 21 | [Cloud upload](21-cloud-upload/) | 416–426 | A destination for files, never a sync channel |
| 22 | [Privacy and security](22-privacy-and-security/) | 427–436 | What leaves the device, and what never does |
| 23 | [Hardening](23-hardening/) | 437–452 | Fast, legible, reachable, unbreakable in the field |
| 24 | [Testing and release](24-testing-and-release/) | 453–469 | The suites, the pipeline and the shipping gate |
| 25 | [Optional team backend](25-backend/) | 470–517 | Accounts, roles, key custody and change relay — **post-MVP** |

## Milestones

**Task 022** — the guardrails are in place. An architectural mistake now fails a test instead of surviving to review.

**Task 083** — the design system is complete. Every later screen is assembled from existing parts.

**Task 385** — the first end-to-end slice works: create a project, choose a template, set context, capture, process,
review, approve, export with photos.

**Task 469** — shippable. The application is complete and releasable with no server in existence.

**Task 517** — team mode. Only worth starting once a real organisation needs accounts, roles and relay.

## Rules that outrank convenience

1. Raw evidence is never destroyed. Refinement writes beside the original.
2. No screen invents a widget, colour, spacing value or error style the design system already has.
3. Nothing blocks capture — not a missing network, not a slow provider, not a missing template.
4. Every write is local-first and durable before the interface confirms it.
5. AI proposes; a person approves.
6. The backend is transit, not truth. It never holds a durable copy of a project, and the app is complete without it.

Tasks 010–022 turn the first five into failing tests. `backend/rules/06-relay-and-retention.md` and tasks 495–497 do
the same for the sixth.
