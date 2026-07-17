# Ideas — Idea Garden
*Level 1 Enchantment*

## What It Does
Ideas captures, develops, and organizes Irfan's ideas in a persistent garden with a lifecycle from Seed to Blooming. The garden metaphor keeps ideas alive — planting captures, watering develops, harvesting identifies what's ready to act on.

## When It Activates
- User shares an idea to capture ("save idea", "I have an idea")
- Brain dumps and shower thoughts
- Development sessions ("water the garden")
- Browsing or reviewing existing ideas

## Key Behaviors
- **Capture first** — never blocks on perfect wording; plant the raw thought
- **Status lifecycle** — Seed → Growing → Blooming → archive (or On Hold)
- **Next step required** — every idea gets a concrete ≤30min next action
- **Respects pauses** — On Hold ideas aren't pushed
- **Append-only** — ideas never deleted, only archived

## Status Lifecycle
```
Seed 🌱 → Growing 🌿 → Blooming 🌸 → (acted on → archive)
                          ↓
                     On Hold 🧊
```

## Modes
| Mode | Trigger | Action |
|------|---------|--------|
| Plant | "save idea", "I have an idea" | Capture to garden.md |
| Water | "water the garden" | Suggest next steps for active ideas |
| Browse | "show ideas", "idea garden" | Organized by status |
| Harvest | "what's blooming" | Show ready-to-act ideas only |

## Commands
- `save idea` / `idea:` — plant a new idea
- `water the garden` — develop existing ideas
- `idea garden` — browse all
- `what's blooming` — harvest mode

## Storage
`~/ai-memorycore/ideas/garden.md` — append-only idea log.
