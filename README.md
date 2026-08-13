# Nine

Nine is a human-supervised research workspace for mathematical literature
discovery and long-horizon problem exploration.

It separates four concerns:

- **A** periodically reads new literature and submits candidate records.
- **B / Sol** explores one research problem at a time, proposes precise lemmas,
  and explains why they matter.
- **Rethlas** attempts and independently checks an approved lemma.
- **The researcher** controls promotion of knowledge, proof runs, changes of
  scope, and the decision to stop or conclude.

## Start a problem

Open Nine as the Codex project and ask:

> Use `$nine-research-loop` to start a problem. Here is the question and my
> suggested direction: ...

If project-local skill discovery is unavailable, say:

> Read `skills/nine-research-loop/SKILL.md` and start a Nine problem.

Nine first creates a problem charter. Sol may then inspect the shared archive,
search literature, calculate, test examples, and compare approaches. Before any
Rethlas run, it must submit a lemma packet for explicit approval.

## Repository map

```text
skills/nine-research-loop/   B's reusable Codex protocol
templates/                   Human-readable record templates
research/profile.md          Research interests and conventions
research/inbox/              Unreviewed output from A
research/literature/         Human-approved paper records
research/techniques/         Human-approved technique records
research/problems/           One durable folder per B problem
scripts/                     Archive creation and validation helpers
```

Run the helpers from PowerShell. On systems with script execution disabled, use
the one-process `-ExecutionPolicy Bypass` option:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/New-NineProblem.ps1 `
  -Id sample-problem -Title "Sample problem"
powershell -ExecutionPolicy Bypass -File scripts/Test-NineArchive.ps1
```

These helpers do not make mathematical judgments.

## Trust model

The archive distinguishes source facts, Sol inferences, open conjectures,
Rethlas-verified results, and human-confirmed conclusions. Rethlas verification
is stronger than an unchecked model draft, but it is not a formal proof-assistant
kernel certificate. The final mathematical judgment remains with the researcher.
