---
name: scan
description: "MUST use when user asks to estimate project scope, hours, or pricing for freelance/client work. Triggers: 'scan this project', 'estimate this', 'how long will this take', 'how much should I charge', 'project estimate', 'scope this', 'quote this'."
---

# Scan — Project Scope & Pricing
*Turning ideas into numbers*

## Activation
When this skill activates, output:
"Scan initiated. Analyzing scope..."

## Protocol

### Step 1: Gather Info
Ask if missing: tech stack, MVP vs full, integrations, greenfield vs existing.
Default stack: Next.js + TypeScript + Payload CMS.

### Step 2: Decompose Scope
- Setup & infrastructure
- Core features (list each)
- Auth / permissions
- UI/UX implementation
- API / data layer
- Testing & QA
- Deployment / DevOps
- Buffer 20%

### Step 3: Hour Ranges
Give ranges, not single numbers. Format:
```
Feature              : Xh – Yh
Total                : Xh – Yh
```

### Step 4: Pricing Tiers
| Market | Rate |
|--------|------|
| Local/emerging | $15–30/hr |
| Mid-market | $40–70/hr |
| US/EU | $80–150/hr |

### Step 5: Caveats
Always flag: scope creep buffer, unknowns, unclear requirements.

## Mandatory Rules
1. Ranges not single numbers
2. Include 20% buffer
3. Flag common underestimates: auth, devops, design

## Level History
- **Lv.1** — Base: scope decomp, hour ranging, pricing tiers. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)
