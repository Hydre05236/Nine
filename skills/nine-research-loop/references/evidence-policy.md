# Evidence and claim policy

## Claim states

Prefix substantive entries with one of these labels:

| Label | Meaning |
|---|---|
| `[SOURCE]` | Faithful statement from a cited primary source with a locator |
| `[CALC-CHECKED]` | Calculation independently reproduced or exactly checked |
| `[SOL-INFERENCE]` | Sol's reasoned inference, not externally verified |
| `[CONJECTURE]` | Open proposed statement or research question |
| `[RETHLAS-VERIFIED]` | Accepted Rethlas artifact whose recorded hash matches its acceptance record |
| `[HUMAN-CONFIRMED]` | Researcher explicitly accepted the claim or conclusion |
| `[REFUTED]` | A concrete contradiction or counterexample is recorded |
| `[UNRESOLVED]` | Active gap, objection, or status not determined |

Rethlas exhaustion remains `[UNRESOLVED]`, never `[REFUTED]`.

## Source requirements

For proof-critical literature claims, record:

- authors, title, arXiv identifier and version or publication data;
- stable URL or local path;
- theorem, proposition, equation, and page locator;
- the exact hypotheses needed here;
- whether the text was checked in the full paper or only in an abstract.

Do not cite a search result, generated summary, or bibliography entry as if it
established the theorem.

## Assumption discipline

Maintain a hypothesis table for each candidate proof. For every dependency,
record which parent hypotheses discharge its assumptions. Highlight:

- compactness and boundary assumptions;
- positivity versus semipositivity;
- smooth, weak, pluripotential, or viscosity solution classes;
- normalization and sign conventions;
- uniformity in parameters;
- strict versus endpoint inequalities;
- hidden finite-energy or integrability requirements.

If a claim is proved only under stronger hypotheses, store it as a different
claim. Never silently present it as the original target.

## Negative and computational evidence

Model cases and numerical experiments may guide exploration but do not prove a
general theorem. Record precision, ranges, and failure modes. Mathematica output
is a calculation artifact; proof-critical use requires exact computation,
certified bounds, or an independently checkable argument.

## Completion discipline

Separate:

1. a plausible route;
2. a complete draft;
3. individually verified lemmas;
4. a globally audited proof;
5. researcher acceptance.

Only stage 5 receives `[HUMAN-CONFIRMED]` and problem state `complete`.
