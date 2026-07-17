# Amber — Visual Memory
*Level 1 Enchantment*

## What It Does
Amber captures and indexes visual references — UI screenshots, design inspiration, color palettes, architecture diagrams. Think of it as a searchable scrapbook stored in `~/ai-memorycore/visual-memories/index.md`.

## When It Activates
- User wants to save a visual reference or screenshot
- User shares an image for future reference
- User wants to recall or browse saved visuals

## Key Behaviors
- **Save mode** — logs entry to index.md with date, category, description, tags
- **Recall mode** — searches index by keyword or tag
- **Browse mode** — lists all saved visuals organized by category
- **Never overwrites** — always appends, preserving history

## Categories
| Category | Content |
|----------|---------|
| UI | App screenshots, interface designs |
| Inspiration | Design mood boards, visual ideas |
| Reference | Technical diagrams, architecture |
| Style | Colors, typography, brand assets |
| Other | Anything else |

## Commands
- `amber this` — save current image/reference
- `save this visual` — same
- `recall [keyword]` — find saved visual
- `list visuals` — browse all by category

## Storage
`~/ai-memorycore/visual-memories/index.md` — append-only log.
