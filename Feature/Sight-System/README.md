# Sight — Visualization Engine
*Level 1 Enchantment*

## What It Does
Sight turns code, architecture, and ideas into clear visual diagrams using Mermaid syntax. It detects the right diagram type (flowchart, ERD, sequence, etc.) from context and produces clean, readable output.

## When It Activates
- User asks to diagram, visualize, map, or chart anything
- Architecture or system design discussions
- Database schema explanations
- Process or flow descriptions

## Key Behaviors
- **Type detection** — picks the right Mermaid diagram type automatically
- **Mermaid-first** — always outputs ```mermaid code blocks
- **Legend on complexity** — adds text legend when >10 nodes
- **ASCII fallback** — offers plain text version if rendering environment is limited

## Supported Diagram Types
| Type | Use Case |
|------|----------|
| flowchart | Processes, logic, decisions |
| sequenceDiagram | API calls, service interactions |
| erDiagram | Database schemas |
| graph | Architecture, dependencies |
| classDiagram | Class hierarchies |
| stateDiagram-v2 | State machines |
| gantt | Timelines |

## Commands
- `diagram this` — auto-detect type and draw
- `visualize [thing]` — same
- `draw a flow` / `flowchart` — force flowchart type
- `ERD` / `sequence diagram` — force specific type

## Storage
No persistent storage. Output lives in conversation.
