# Decision Log
<!-- Copy to projects/<name>/decisions.md when starting a project -->
<!-- One entry per significant decision. Settled = don't re-debate. -->

## Format
```
### YYYY-MM-DD — [Decision title]
**Chose:** 
**Alternatives rejected:** 
**Why:** 
**Trade-off accepted:** 
```

---

## Decisions

### YYYY-MM-DD — [Example: Auth strategy]
**Chose:** JWT with refresh tokens
**Alternatives rejected:** Session cookies, Clerk
**Why:** No third-party dependency, full control over token lifecycle
**Trade-off accepted:** More boilerplate to maintain
