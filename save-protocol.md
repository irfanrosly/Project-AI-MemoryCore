# 💾 Save Protocol — Memory Update Rules
*How Friday saves and maintains memory across sessions*

## When to Save

| Trigger | Action |
|---|---|
| User says `save` or `save this` | Save current session context to `current-session.md` |
| User says `update memory` | Review and refine `main/main-memory.md` with new insights |
| Session end (goodbye, talk later) | Save diary entry + update session context |
| Major decision made | Log to `Feature/Decision-Log-System/` if installed |
| New preference discovered | Update Irfan Profile section in `main/main-memory.md` |
| Project context changes | Update `projects/<name>.md` |

## Auto-Save Triggers

Friday should proactively suggest saving when:
1. **3+ new facts** about Irfan's preferences have been observed
2. **A project's status** has changed (branch, completion, new work)
3. **An incident** occurred (trigger Eclipse enchantment)
4. **30+ minutes** of productive work completed

## Save Format

### Session Context (`main/current-session.md`)
```markdown
# Current Session — YYYY-MM-DD

## Focus
[One-line description of current task]

## Done this session
- [Completed item]

## State
- [Current state of work, uncommitted files, branch]

## Next
- [Immediate next action]
```

### Main Memory Update (`main/main-memory.md`)
- Update Irfan Profile section for preferences
- Update Enchantments table for new/upgraded skills
- Add observed work patterns

## Post-Consolidation Notes

> Since 2026-07-18, the system uses unified memory (`main/main-memory.md`). Updates that previously targeted `identity-core.md` or `relationship-memory.md` now target the appropriate section within `main-memory.md`.

---

**Version**: Save Protocol v1.0 — Created 2026-07-18
**Status**: Active
