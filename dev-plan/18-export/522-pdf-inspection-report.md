# 522 — Inspection report PDF

**Phase** 18 · Export  |  **Depends on** [376](376-pdf-engine.md), [184](../09-templates/184-checklist-progress.md), [333](../15-data-quality/333-missing-items.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The fifth report of §52, and the only one tasks 377–380 do not build: the inspection report. It renders a
project's checklist templates — `inspection_check` and anything derived from it — as checklist items,
observations, compliance, risk, recommendations and photo evidence.

## Files

- `frontend/lib/core/export/pdf/inspection_report.dart` (new)

## Steps

1. Order by the template's predefined rows (§15), so the report reads in the order the inspector worked, not in
   capture order.
2. Render each row as its result, its observation, its risk and its recommendation, with the photos that
   evidence it beneath. A row never found prints as **Not found**, which is a finding rather than a gap (§15).
3. Carry the compliance total and the count of rows not found onto the cover page, so the deliverable states its
   own completeness.
4. Print the raw observation beside the refined one wherever the field carries both and the project has the
   option on (§32).

## Reuse

- The cover page, header, footer, page numbers and photo blocks all come from `pdf_engine.dart` (376). This task
  adds a report, not a second PDF foundation.
- Checklist progress and the not-found set already exist in 184 and 333; read them rather than recomputing.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Generation runs on a background isolate with progress and cancellation; the UI thread never renders a page.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] All five reports of §52 now exist, and every one of them shares the layout of 376.
- [ ] A row that was never captured appears as **Not found** rather than being omitted.
- [ ] Tests written and passing: Golden test of a rendered inspection page, plus a unit test asserting row order
      follows the predefined rows and that not-found rows are present.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
