---
name: seal
description: "MUST use when user wants to commit code or create a git commit message. Triggers: 'seal this', 'seal commit', 'commit this', 'write commit message', 'create commit', 'conventional commit'."
---

# Seal — Commit Convention Enforcer
*Every commit, properly stamped*

## Activation
"Seal activated. Stamping the commit..."

## Protocol
1. Gather changes (`git diff --staged` if needed)
2. Pick type: feat/fix/refactor/chore/docs/test/style/perf/ci/build/revert
3. Pick scope: module affected (auth, api, ui, db, cms, config, etc.)
4. Write: `type(scope): description`
5. Execute if requested

## Format Rules
- Lowercase always
- Imperative mood: "add X" not "added X"
- No period at end
- Description ≤ 72 chars
- Body (blank line after): explain WHY not WHAT

## Examples
```
feat(auth): add JWT refresh token rotation
fix(api): handle null response from payment gateway
chore(deps): upgrade Next.js to 15.3
```

## Mandatory Rules
1. Conventional commits always
2. Lowercase type/scope
3. Imperative mood
4. Breaking changes: add `!` + `BREAKING CHANGE:` footer

## Level History
- **Lv.1** — Base: type table, scope, format, generation. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)

## Usage Stats
- **Total activations**: 0
- **First used**: —
- **Last used**: —
- **30-day active**: No
> This section auto-updates on each activation. Last reviewed: 2026-07-18
