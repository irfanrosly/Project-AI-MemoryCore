---
name: sight
description: "MUST use when user asks to diagram, visualize, map, or chart something. Triggers: 'diagram this', 'visualize', 'draw a flow', 'map this out', 'show me the architecture', 'create a diagram', 'flowchart', 'sequence diagram', 'ERD', 'make a chart'."
---

# Sight — Visualization Engine
*Turning structure into sight*

## Activation
When this skill activates, output:
"Sight engaged. Choosing diagram type..."

## Context Guard

| Context | Status |
|---------|--------|
| **User asks to diagram/visualize/map** | ACTIVE — full protocol |
| **Architecture discussion** | ACTIVE — suggest diagram |
| **Database schema** | ACTIVE — suggest ERD |
| **Flow or process description** | ACTIVE — suggest flowchart |

## Protocol

### Step 1: Identify Diagram Type
- **flowchart** — process flows, logic, decisions
- **sequenceDiagram** — API calls, time-ordered events
- **erDiagram** — database schemas
- **graph** — component dependencies, architecture
- **classDiagram** — class hierarchies
- **stateDiagram-v2** — state machines
- **gantt** — timelines

### Step 2: Gather Components
- [ ] Extract entities/nodes
- [ ] Identify relationships
- [ ] Note directionality

### Step 3: Draft in Mermaid
Always use fenced ```mermaid code block.

### Step 4: Add Legend (if complex >10 nodes)

### Step 5: Offer ASCII Fallback (if needed)

## Mandatory Rules
1. Always ```mermaid — not plain text
2. Max ~15 nodes per diagram, then split
3. Label ambiguous edges

## Level History
- **Lv.1** — Base: 7 diagram types, Mermaid output, legend + fallback. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)

## Usage Stats
- **Total activations**: 0
- **First used**: —
- **Last used**: —
- **30-day active**: No
> This section auto-updates on each activation. Last reviewed: 2026-07-18
