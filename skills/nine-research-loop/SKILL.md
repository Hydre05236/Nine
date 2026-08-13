---
name: nine-research-loop
description: Conduct a long-horizon, human-supervised mathematical research problem in the Nine workspace. Use when the researcher asks to start, continue, resume, audit, or close a Nine problem; explore a proposed proof direction; let Sol investigate and propose precise lemmas; consult Nine's literature archive; or prepare an approved lemma for Rethlas proof and verification. Do not use for the scheduled literature-agent A workflow by itself or invoke Rethlas without explicit approval.
---

# Nine Research Loop

Use Sol as the research explorer and Rethlas as an approved proof-verification
backend. Keep the researcher in control of theorem scope and proof expenditure.

## Load context

1. Read the root `AGENTS.md`.
2. Read `research/profile.md` and `research/INDEX.md`.
3. For a new problem, copy the templates listed below into a new folder under
   `research/problems/`. For an existing problem, read its `state.md`,
   `charter.md`, `ledger.md`, and active lemma packet.
4. Read [workflow.md](references/workflow.md) for state transitions and required
   artifacts.
5. Read [evidence-policy.md](references/evidence-policy.md) before making or
   recording mathematical claims.

## Explore

- Preserve the researcher's exact target, hypotheses, notation, suggested route,
  and permission for independent exploration in `charter.md`.
- Search the approved archive first. Treat `research/inbox/` as unreviewed leads.
- Search arXiv or primary literature when needed. Verify proof-critical claims in
  the paper, not only its abstract or a secondary summary.
- Record calculations, model cases, possible counterexamples, failed routes, and
  changes of assumptions in `ledger.md` as they occur.
- Allocate effort to the researcher's route unless the charter permits deviation.
  State why an alternative route may remove a named obstruction before pursuing
  it substantially.
- Never manufacture a lemma merely to advance the state machine. Continue
  exploration or report that no viable lemma is ready.

## Propose a lemma checkpoint

When a precise, useful, and plausibly true lemma is ready:

1. Create `lemmas/LNNN.md` from `templates/lemma-packet.md`.
2. State all quantifiers, hypotheses, conventions, and dependencies exactly.
3. Explain its role in the parent problem, supporting evidence, proof sketch,
   weakest point, edge cases, and consequences of failure.
4. Recommend Rethlas parameters, but do not choose on the researcher's behalf.
5. Report the packet to the researcher and stop at `awaiting_lemma_approval`.

Do not invoke Rethlas until the researcher explicitly approves both the exact
statement and run configuration. A request to revise or explore further returns
the problem to `exploring`.

## Hand off to Rethlas

After approval, read [rethlas-handoff.md](references/rethlas-handoff.md). Record
the approved configuration before invoking the Rethlas plugin. Do not silently
substitute a model, effort, iteration limit, or MMA policy.

Use the Rethlas plugin's standard complete-run interface unless the researcher
explicitly requests a background run, status monitoring, or cancellation. Treat
only the plugin's verified artifact with a matching acceptance record as a
successful Rethlas proof.

## Integrate the result

- On verified completion, check that the proved statement exactly matches the
  approved lemma, record artifact paths and hashes, and update the dependency
  graph. Do not paraphrase away assumptions.
- On exhaustion, record approaches, verifier objections, and unresolved gaps.
  Do not call the lemma false.
- On failure or cancellation, distinguish engineering status from mathematical
  status.
- Explain the result to the researcher. Propose a revised or next lemma only when
  it is mathematically motivated, then stop for the next approval.

## Close or suspend

Never declare the parent problem solved from local lemma successes alone. For a
candidate solution, create `final-audit.md` from the final-audit template and
check the full dependency graph, hypothesis flow, citations, limiting arguments,
and statement identity. Mark the problem `candidate_complete` until the
researcher accepts it.

When progress stalls or the researcher stops, preserve the strongest current
statement, open gaps, failed routes, and cheapest next tests; mark the problem
`suspended` rather than forcing a conclusion.

## Templates

- `templates/problem-charter.md`
- `templates/problem-state.md`
- `templates/research-ledger.md`
- `templates/lemma-packet.md`
- `templates/rethlas-run.md`
- `templates/final-audit.md`
