# Tapture — development plan

469 implementation prompts, in the order they should be built, from an empty repository to a shippable app.

Every file is a prompt that produces code. There are no policy documents, no checklists to read and file away: the
architectural rules of phase 01 ship as lints, checkers and tests that fail a build when they are broken.

Read [INDEX.md](INDEX.md) for the full list, or open a phase folder.

## How to use a task file

Open the lowest unticked task, give the file to a developer or an agent, and build exactly what it says. Each file is
self-contained: it names its dependencies, the files to touch, the public contract, the steps, the constraints and the
test that proves it.

```text
# 010 — Layering enforcement test

**Phase** 01 · Project setup and guardrails  |  **Depends on** 004

> Implementation prompt. Build exactly this task, then stop.

## Implement           what exists when this is finished
## Files               what to create or change
## Contract            the public API, in Dart, that other tasks will call
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
being blocked. Task 006 builds the checker that proves this stays true.

**Never widen a task.** Every file ends with an Out of scope fence. Anything discovered mid-task becomes a new file.

**A task is done when** its Definition of done is fully ticked — which includes a clean analyzer, applied formatter,
written tests, and green guardrail suites.

## Phases

| | Phase | Tasks | What it delivers |
|---|---|---|---|
| 01 | [Project setup and guardrails](01-orchestration/) | 001–022 | The repository, plus every architectural rule as a lint, checker or test |
| 02 | [Foundation services](02-foundation/) | 023–041 | Boots, logs, fails safely; the small services everything injects |
| 03 | [Design system](03-design-system/) | 042–083 | Tokens, themes and the whole widget vocabulary, before any screen |
| 04 | [Local database](04-data-layer/) | 084–114 | Every table, with merge columns present from the first migration |
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

Team mode — the optional backend in Part XI of the specification — is deliberately absent. The application must be
complete and shippable with no server in existence.

## Milestones

**Task 022** — the guardrails are in place. From here, an architectural mistake fails a test instead of surviving to
review.

**Task 083** — the design system is complete. Every later screen is assembled from existing parts; no feature builds a
button, a field, an error state or a spacing value of its own.

**Task 385** — the first end-to-end slice works: create a project, choose a template, set context, capture, process,
review, approve, export with photos. Everything after that widens the app; nothing after that is needed to prove it.

## Rules that outrank convenience

1. Raw evidence is never destroyed. Refinement writes a new column beside the original.
2. No screen invents a widget, colour, spacing value or error style the design system already has.
3. Nothing blocks capture — not a missing network, not a slow provider, not a missing template.
4. Every write is local-first and durable before the interface confirms it.
5. AI proposes; a person approves.

Tasks 010–022 turn each of these from a promise into a failing test.
