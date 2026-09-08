# Tapture — development plan

466 tasks, in the order they should be built, from an empty repository to a shippable app.

Read [INDEX.md](INDEX.md) for the full list, or open a phase folder.

## How this plan works

**One task, one file, one pull request.** Each file is a single micro-feature — a table, a widget, a button, one rule. If a task feels like two things, it is two things: split it and add a file.

**Work in number order.** Numbers are global and chronological. A task's dependencies are always lower-numbered, so working top to bottom means never being blocked. Numbers are never reused, even if a task is dropped.

**Never widen a task.** Anything discovered mid-task becomes a new file appended to the right phase, not extra scope in the current one.

**A task is done when** its acceptance boxes are ticked, its tests are written and green, the analyzer is clean, and nothing in it violates the policies in phase 01.

## Structure of a task file

```text
# 223 — Delete a photo

**Phase** 12 · Capture  |  **Depends on** 220, 068, 070

## Goal        one sentence: what exists when this is finished
## Files       what to create or change
## Steps       how to do it
## Reuse       which existing components it must use rather than rebuild
## Acceptance  the checklist that defines done
## Tests       what proves it
## Notes       cautions worth knowing before starting
```

## Phases

| | Phase | Tasks | What it delivers |
|---|---|---|---|
| 01 | [Orchestration](01-orchestration/) | 001–018 | The working agreements every later task obeys. No app code. |
| 02 | [Foundation](02-foundation/) | 019–037 | An app that boots, logs, fails safely and knows its device. |
| 03 | [Design system](03-design-system/) | 038–079 | Tokens, themes and the whole widget vocabulary, built before any screen. |
| 04 | [Local database](04-data-layer/) | 080–110 | Every table, with merge columns present from the first migration. |
| 05 | [File storage](05-file-storage/) | 111–122 | The organised folder tree and every service that writes into it. |
| 06 | [Application shell](06-app-shell/) | 123–129 | Navigation, routing and the always-visible status line. |
| 07 | [Operator and settings](07-operator-and-settings/) | 130–138 | Local identity, app lock and the switches later features read. |
| 08 | [Projects](08-projects/) | 139–148 | The container that owns everything else. |
| 09 | [Templates](09-templates/) | 149–178 | Shipped, hand-built and spreadsheet-derived record shapes. |
| 10 | [Reference data](10-reference-data/) | 179–194 | Imported tables, lookups and prefill. |
| 11 | [Context](11-context/) | 195–208 | Set a value once; it applies until changed. |
| 12 | [Capture](12-capture/) | 209–253 | Evidence in, with as little typing as possible. |
| 13 | [Processing](13-processing/) | 254–293 | On-device first, online only when it earns its place. |
| 14 | [Review](14-review/) | 294–304 | Where a person turns proposals into data. |
| 15 | [Records](15-records/) | 305–319 | Find, read and change what was captured. |
| 16 | [Data quality](16-data-quality/) | 320–339 | Validation, duplicates, conflicts and verification. |
| 17 | [Meetings](17-meetings/) | 340–353 | Minutes, attendance and actions. |
| 18 | [Export](18-export/) | 354–382 | XLSX, CSV, JSON, PDF and ZIP, all produced on device. |
| 19 | [Bundles and merge](19-bundles-and-merge/) | 383–406 | Collaboration with no server. |
| 20 | [Data import](20-data-import/) | 407–412 | Continue an inventory someone else started. |
| 21 | [Cloud upload](21-cloud-upload/) | 413–423 | A destination for files, never a sync channel. |
| 22 | [Privacy and security](22-privacy-and-security/) | 424–433 | What leaves the device, and what never does. |
| 23 | [Hardening](23-hardening/) | 434–449 | Fast, legible, reachable, unbreakable in the field. |
| 24 | [Testing and release](24-testing-and-release/) | 450–466 | The suites, the pipeline and the shipping gate. |

## The first milestone

Phases 01–05 build no visible feature and are the most valuable work in the plan: they are what stops 400 later tasks from each inventing their own button, colour, error message and table shape.

The first end-to-end slice is complete at task 382, when a project can be created, a template chosen, a record captured, processed, reviewed, approved and exported with its photos. Everything after that widens the app; nothing after that is needed to prove it works.

## Rules that outrank convenience

1. Raw evidence is never destroyed. Refinement writes a new column beside the original.
2. No screen invents a widget, a colour, a spacing value or an error style that the design system already has.
3. Nothing blocks capture — not a missing network, not a slow provider, not a missing template.
4. Every write is local-first and durable before the interface confirms it.
5. AI proposes; a person approves. No record leaves as data on a machine's word alone.

See [phase 01](01-orchestration/) for the full policies these summarise.
