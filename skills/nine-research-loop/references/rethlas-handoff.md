# Rethlas handoff protocol

## Before approval

Prepare a lemma packet and show the researcher:

- exact statement and supporting context;
- why the lemma advances the parent problem;
- dependencies and definitions;
- Sol's proof sketch and strongest objection;
- recommended run settings with reasons.

Do not run Rethlas while approval is ambiguous. Approval must cover the exact
statement and the following settings:

| Setting | Purpose |
|---|---|
| `max_iterations` | Maximum proof/repair iterations |
| `generation_model`, `reasoning_effort` | Proof generation |
| `repair_verification_model`, `repair_verification_effort` | Repair-cycle checking |
| `final_verification_model`, `final_verification_effort` | Independent final audit |
| `mma_mode` | `verifier_only` by default; `generation_allowed` only by request |
| `require_mma_verification` | Require MMA verification when explicitly requested |

When a field is omitted, show the Rethlas defaults before approval rather than
silently relying on them. Current plugin defaults are Sol/xhigh for generation,
Sol/medium for repair checking, Sol/xhigh for final verification, and
`verifier_only` for MMA.

## Invocation

1. Check Rethlas health before the first run in a turn.
2. Record the approved statement and settings in a new run record.
3. Tell the researcher the monitor URL, chosen configurations, and that success
   is not guaranteed.
4. Normally invoke the complete-run interface exactly once and let it own start,
   wait, verification, and result retrieval.
5. Use background start/status/wait tools only when the researcher explicitly
   requests a background run. Cancel only on the researcher's request.

Never silently substitute a model or effort. Never modify Rethlas source during
a run.

## Result integration

On completion, record:

- run id and terminal state;
- exact submitted statement;
- verified blueprint path and hash, acceptance record, and verifier artifacts;
- whether MMA was actually used, what it established, and its audit run id;
- mismatch, if any, between the requested and proved statements.

Only a verified blueprint whose hash matches the acceptance record receives
`[RETHLAS-VERIFIED]`.

On exhaustion, link the exhaustion report and summarize recorded approaches,
failed paths, and unresolved verifier findings. On failure or cancellation,
record the reason and relevant logs. A draft is never a verified theorem.

After every terminal result, Sol reports its mathematical interpretation to the
researcher before proposing or launching another run.
