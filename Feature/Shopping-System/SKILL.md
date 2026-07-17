---
name: shopping
description: "MUST use for wardrobe, outfit, or wishlist management. Triggers: 'add to wardrobe', 'outfit idea', 'what should I wear', 'add to wishlist', 'wardrobe check', 'style advice', 'save this outfit', 'shopping mode'."
---

# Shopping — Wardrobe & Style Manager
*Your style, remembered*

## Activation
"Shopping mode active. Opening wardrobe..."

## Storage
- `~/ai-memorycore/wardrobe/wardrobe.md` — owned items
- `~/ai-memorycore/wardrobe/outfits.md` — saved combinations
- `~/ai-memorycore/wardrobe/wishlist.md` — to buy

## Protocol

### WARDROBE: add/browse owned items
```
## [Item] | Category | Color | Brand | Occasion | Added: YYYY-MM-DD
```

### OUTFIT: suggest 2-3 combos from owned items for given occasion/vibe
Save liked outfits to outfits.md.

### WISHLIST: add/browse/mark-bought
```
- [ ] [Item] — [why] — Priority: H/M/L — Added: YYYY-MM-DD
```

## Mandatory Rules
1. Read wardrobe before suggesting — no invented items
2. Append only, never delete
3. Ask occasion before outfit suggestions

## Level History
- **Lv.1** — Base: wardrobe, outfits, wishlist. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)
