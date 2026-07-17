# Scan — Project Scope & Pricing
*Level 1 Enchantment*

## What It Does
Scan analyzes a project description and produces a structured scope breakdown with hour estimates and freelance pricing across market tiers. Built for Irfan's stack (Next.js, TypeScript, Payload CMS) but adaptable to any project.

## When It Activates
- User asks for project estimate or scope analysis
- Freelance/client pricing questions
- "How long will this take?" on a new feature or project
- Quote generation for client proposals

## Key Behaviors
- **Ranges not false precision** — always gives min–max hour estimates
- **20% buffer** — always includes revision/unknown buffer
- **Multi-market pricing** — local, mid-market, US/EU tiers
- **Scope decomposition** — breaks down into functional areas for transparency
- **Flags unknowns** — calls out items that commonly balloon scope

## Output Format
```
Feature breakdown:
  Setup               :  4–6h
  [Core features]     :  Xh
  Auth                :  4–6h
  UI polish           :  6–10h
  Buffer              :  ~Xh
  Total               :  Xh – Yh

Recommended quote: $X,XXX – $X,XXX
```

## Commands
- `scan this project` — full scope + pricing analysis
- `estimate this` — same
- `how much should I charge for [X]` — pricing-focused
- `scope this` — scope only, no pricing

## Storage
No persistent storage. Works in-session.
