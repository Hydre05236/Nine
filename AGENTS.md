# Nine project rules

Nine is a human-supervised mathematical research workspace. Treat mathematical
correctness, provenance, and recoverability as more important than fluency.

## Required workflow

- For a new or continuing research problem, read
  `skills/nine-research-loop/SKILL.md` and follow it.
- Treat `research/` as the shared memory used by the literature agent A, the
  problem-solving agent B, and the researcher.
- Never silently strengthen or weaken a theorem, lemma, or hypothesis.
- Label every substantive claim with one of the evidence states defined in
  `skills/nine-research-loop/references/evidence-policy.md`.
- Preserve failed approaches and unresolved objections. Do not rewrite the
  record to make an exploration appear linear.
- Do not invoke Rethlas until the researcher explicitly approves the exact
  lemma statement and run parameters.
- Do not interpret an exhausted Rethlas run as a disproof.
- Do not declare the parent problem complete merely because individual lemmas
  were verified. Perform the final dependency and assumption audit.

## Archive boundaries

- A may write candidate literature and technique records under `research/inbox/`.
- B may read the entire archive. B writes only within the active problem folder
  and may propose archive updates in that problem's `outbox/`.
- Promote material from `inbox/` or a problem `outbox/` into trusted archive
  locations only after human review.
- Keep external papers out of Git unless their license and size make inclusion
  appropriate. Store stable links, identifiers, page numbers, theorem numbers,
  and local paths instead.
