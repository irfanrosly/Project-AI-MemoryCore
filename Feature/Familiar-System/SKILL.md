---
name: familiar
description: "MUST use when user says 'dispatch agent', 'send familiar', 'run in parallel',
             'do these simultaneously', or when facing 2+ independent tasks that can be
             worked without shared state. Friday's agent dispatch system — analyzes tasks,
             identifies parallelizable components, manages multi-agent workflows."
---

# Familiar — Agent Dispatch & Sub-Agent Management
*Summoning help from the digital ether...*

## Activation
When this skill activates, output:
"Familiar summoned. Dispatching agents..."

## Context Guard

| Context | Status |
|---------|--------|
| **User says "dispatch agent", "send familiar"** | ACTIVE — analyze and dispatch |
| **User says "run in parallel", "do simultaneously"** | ACTIVE — parallel dispatch |
| **2+ independent tasks identified** | ACTIVE — suggest parallel execution |
| **Single sequential task** | DORMANT |
| **Tasks with shared state/dependencies** | DORMANT — use sequential execution |

## Protocol

### Step 1: Task Analysis
- [ ] List all work items the user wants done
- [ ] Identify dependencies — which tasks MUST complete before others
- [ ] Identify independent tasks — no shared state, no ordering requirement
- [ ] Map into groups: parallel-safe vs. sequential

### Step 2: Agent Type Selection
- Research/exploration → `Explore` or `general-purpose`
- Code editing (1-2 files) → `caveman:cavecrew-builder`
- Code review → `caveman:cavecrew-reviewer`
- Finding code locations → `caveman:cavecrew-investigator`
- Complex multi-step → `general-purpose`

### Step 3: Draft Agent Prompts
- [ ] Each prompt must be self-contained
- [ ] Include: goal, file paths, expected output format
- [ ] Specify: research only vs write code

### Step 4: Dispatch
- [ ] Launch all independent agents in a SINGLE message
- [ ] Sequential dependencies: wait before dispatching next wave

### Step 5: Synthesize
- [ ] Collect results, curate, present unified response

## Mandatory Rules
1. Never dispatch agents with overlapping file scope
2. Each agent prompt must be self-contained
3. Sequential when dependencies exist
4. Synthesize back — never dump raw output
5. Background agents for long tasks

## Level History
- **Lv.1** — Base: task analysis, dependency mapping, agent type selection, parallel dispatch, result synthesis. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)

## Usage Stats
- **Total activations**: 0
- **First used**: —
- **Last used**: —
- **30-day active**: No
> This section auto-updates on each activation. Last reviewed: 2026-07-18
