# Nine B workflow

## Contents

1. State model
2. Human gates
3. Problem artifacts
4. A-to-B and B-to-archive exchange
5. Recovery rules

## State model

Use exactly one current state in each problem's `state.md`:

| State | Meaning | Permitted next states |
|---|---|---|
| `drafting_charter` | Target and rules are being made precise | `exploring`, `suspended` |
| `exploring` | Sol is researching, calculating, or testing | `awaiting_lemma_approval`, `suspended` |
| `awaiting_lemma_approval` | A complete lemma packet awaits the researcher | `exploring`, `rethlas_approved`, `suspended` |
| `rethlas_approved` | Exact statement and parameters are approved | `rethlas_running`, `exploring`, `suspended` |
| `rethlas_running` | One recorded Rethlas run is active | `integrating_result`, `suspended` |
| `integrating_result` | Sol is checking and contextualizing the result | `exploring`, `awaiting_lemma_approval`, `candidate_complete`, `suspended` |
| `candidate_complete` | Full proof and dependency audit await acceptance | `exploring`, `complete`, `suspended` |
| `complete` | Researcher accepted the conclusion | none |
| `suspended` | Work stopped with a resumable record | any nonterminal state approved by researcher |

Every state change must append a dated entry to `state.md` containing the actor,
reason, and associated artifact.

## Human gates

Explicit researcher approval is required for:

- changing the parent theorem or its hypotheses;
- launching Rethlas and selecting its run parameters;
- launching another Rethlas run after exhaustion or failure;
- promoting a claim into the trusted archive;
- declaring the problem complete;
- spending substantial effort on a route excluded by the charter.

Sol may autonomously search literature, run ordinary workspace calculations,
test examples, and compare routes within the charter's scope. External actions
with independent side effects still follow Codex approval rules.

## Problem artifacts

Each `research/problems/<problem-id>/` contains:

```text
charter.md             stable target and exploration permissions
state.md               current state plus append-only transition history
ledger.md              chronological research record
dependencies.md        theorem/lemma/citation dependency table
lemmas/                immutable numbered lemma packets
rethlas-runs/           one record per approved run
sources/                source index, locators, and reading notes
outbox/                 proposed updates to the shared trusted archive
final-audit.md          created only for a candidate complete solution
```

Do not overwrite an approved lemma statement. Create a new numbered lemma or a
new version and record the supersession relation.

## A-to-B and B-to-archive exchange

A writes unreviewed paper and technique records to `research/inbox/`. Each item
must include provenance and distinguish source content from A's suggestions.

B may use inbox items as leads, but verifies proof-critical facts against primary
sources. B submits reusable results or technique cards to its `outbox/`. Human
review promotes accepted records into `research/literature/`,
`research/techniques/`, or the relevant profile/problem index.

Neither A nor B directly rewrites trusted records merely because a newer model
output conflicts with them. Record the conflict for review.

## Recovery rules

On resumption, do not rely on chat memory. Read the problem artifacts and state:

- the exact current target;
- the current state;
- the last established result;
- the active gap;
- the next decision requiring the researcher.

If these cannot be reconstructed, return to `drafting_charter` or `exploring` and
repair the archive before new proof work.
