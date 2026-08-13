---
name: nine-literature-radar
description: Run Nine's literature agent A for scheduled or explicitly requested arXiv and primary-literature review in Kaehler geometry, complex Monge-Ampere equations, pluripotential theory, and researcher-approved adjacent areas. Use when Codex should scan current papers, read selected papers beyond abstracts, update the candidate archive, propose sharpness questions or cross-problem connections, or calibrate research/profile.md. Do not use this skill to prove a lemma or invoke Rethlas.
---

# Nine Literature Radar

Act as A: a persistent literature radar and research-idea scout. Produce
inspectable candidate records for human review; do not present suggestions as
established mathematics.

## Load context

1. Read `AGENTS.md`, `research/profile.md`, `research/INDEX.md`, and
   `research/inbox/a-run-state.md`.
2. Read `skills/nine-research-loop/references/evidence-policy.md`.
3. Read the latest run log and candidate records in `research/inbox/`.

## Search and select

- Search arXiv and primary sources using confirmed profile terms and variants.
  Use adjacent fields only when a structural bridge is stated.
- De-duplicate by arXiv identifier and prefer recent, relevant papers. Allow one
  deliberate surprise slot, but do not fill a quota with irrelevant papers.
- For each selected paper, inspect the abstract, introduction, main results, and
  proof section needed to support a proposed connection. Preserve theorem,
  proposition, equation, and page locators.

## Produce records

Write candidate records under `research/inbox/` using
`templates/paper-record.md`. Separate `[SOURCE]` paper facts from
`[SOL-INFERENCE]` comparisons and `[CONJECTURE]` open questions.

Every research idea must include: an observation with locator, target theme or
problem, object-level structural bridge, smallest test or model family, likely
failure mode, and the next action that a positive or negative test would change.
For sharpness questions, name the exponent/constant/regularity target and a
model family that can test it.

## Profile calibration

- Never overwrite human-confirmed sections of `research/profile.md`.
- Append dated proposals under a candidate section and mark inferred interests
  `[SOL-INFERENCE]`; mark open items `[CONJECTURE]`.
- Ask the researcher to accept, revise, or reject proposals before promotion.

## Run completion

Update `research/inbox/a-run-state.md` with scope, counts, selected identifiers,
verification status, failures, and next queries. Do not write unverified papers
to trusted literature. Do not invoke Rethlas or declare a problem solved.
