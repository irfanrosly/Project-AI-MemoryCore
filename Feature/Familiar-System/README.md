# Familiar — Agent Dispatch & Sub-Agent Management
*Level 1 Enchantment*

## What It Does
Familiar is Friday's agent dispatch system. When facing complex tasks that can be split into independent work streams, Familiar analyzes the work, identifies what can run in parallel, and dispatches specialized sub-agents to handle each part simultaneously.

## When It Activates
- User says: `dispatch agent`, `send familiar`, `run in parallel`, `do simultaneously`
- Friday identifies 2+ independent tasks with no shared state
- Complex research that benefits from specialized agents

## Key Behaviors
- **Dependency mapping** — identifies what must be sequential vs. parallel
- **Agent type selection** — picks the right specialist for each task type
- **Self-contained prompts** — each agent gets full context, not conversation references
- **Result synthesis** — raw agent output is curated before presenting to user

## Example
```
User: "Refactor this component AND set up the test suite"
→ Familiar maps: component refactor (file A) has no dependency on test setup (file B)
→ Dispatches 2 agents simultaneously
→ Synthesizes both results
```

## Commands
- `dispatch agent` — analyze task and dispatch agents
- `send familiar` — same trigger

## Storage
No persistent storage. Familiar works in session memory only.
