# Eclipse — Incident Tracker
*Level 1 Enchantment*

## What It Does
Eclipse captures incidents, runs 5-Whys root cause analysis, logs everything to a persistent incident archive, and always ends with a concrete prevention note. Turns "it broke" into structured institutional memory.

## When It Activates
- Something broke or errored in production/dev
- User wants a post-mortem
- Root cause analysis requested
- User says "eclipse this" or "log this incident"

## Key Behaviors
- **5-Whys RCA** — never stops at surface symptoms
- **Persistent log** — every incident saved to `eclipse-archive/incident-log.md`
- **Prevention first** — always ends with one concrete prevention action
- **Severity classification** — Critical/High/Medium/Low with clear criteria
- **Exact quotes** — error messages quoted verbatim, not paraphrased

## Incident Log Format
```markdown
## [Title] — YYYY-MM-DD
- Severity: [level]
- Component: [affected area]
- Error: `[exact message]`
- Root cause: [summary]
- Fix applied: [what was done]
- Prevention: [next step]
- Status: Resolved / Open / Monitoring
```

## Commands
- `eclipse this` — full incident protocol
- `log this incident` — same
- `post-mortem` — retrospective on past incident
- `what went wrong with [X]` — trigger RCA

## Storage
`~/ai-memorycore/eclipse-archive/incident-log.md` — append-only incident history.
