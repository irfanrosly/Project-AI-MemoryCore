# Shopping — Wardrobe & Style Manager
*Level 1 Enchantment*

## What It Does
Shopping manages Irfan's wardrobe, outfit combinations, and wishlist. It remembers owned items, suggests outfits from what's actually owned, and tracks items to buy.

## When It Activates
- Adding items to wardrobe inventory
- Asking for outfit ideas or "what should I wear"
- Managing wishlist or shopping list
- Style advice requests

## Key Behaviors
- **Reality-based outfits** — only suggests outfits using owned items (reads wardrobe first)
- **Context-aware** — asks for occasion/vibe before suggesting
- **Wishlist priority** — tags items High/Medium/Low importance
- **Append-only** — wardrobe history never deleted

## Storage Files
| File | Contents |
|------|---------|
| `wardrobe/wardrobe.md` | Owned items inventory |
| `wardrobe/outfits.md` | Saved outfit combinations |
| `wardrobe/wishlist.md` | Items to buy |

## Commands
- `add to wardrobe` — log a new item
- `outfit idea` / `what should I wear` — get outfit suggestions
- `add to wishlist` — add item to buy list
- `wardrobe check` — browse owned items
- `shopping list` — view wishlist by priority

## Storage
`~/ai-memorycore/wardrobe/` — wardrobe.md, outfits.md, wishlist.md
