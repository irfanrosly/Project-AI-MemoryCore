---
name: eclipse
description: "MUST use when something goes wrong, user reports a bug/incident, or wants post-mortem. Triggers: 'eclipse this', 'log this incident', 'something broke', 'post-mortem', 'incident report', 'root cause'."
---

# Eclipse — Incident Tracker
*Darkness documented, so light returns faster*

## Activation
"Eclipse activated. Logging the incident..."

## Protocol
1. **Capture** — what, when, error msg, expected vs actual, recent changes
2. **RCA** — 5 Whys: symptom → why1 → why2 → why3 → why4 → root cause
3. **Log** to `~/ai-memorycore/eclipse-archive/incident-log.md`:
```
## [Title] — YYYY-MM-DD
- Severity: Critical/High/Medium/Low
- Component: [affected]
- Error: `[exact message]`
- Root cause: [summary]
- Fix applied: [what was done]
- Prevention: [concrete next step]
- Status: Resolved/Open/Monitoring
```
4. **Prevention** — one concrete action: test, monitoring, pre-deploy check

## Severity: Critical/High/Medium/Low

## Mandatory Rules
1. Always log to incident-log.md
2. Never skip root cause
3. Exact error messages quoted
4. Always end with prevention

## Level History
- **Lv.1** — Base: capture, 5-whys RCA, log, prevention. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)

## Usage Stats
- **Total activations**: 0
- **First used**: —
- **Last used**: —
- **30-day active**: No
> This section auto-updates on each activation. Last reviewed: 2026-07-18
