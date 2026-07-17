# Seal — Commit Convention Enforcer
*Level 1 Enchantment*

## What It Does
Seal generates and enforces conventional commit messages. It analyzes staged changes, picks the right commit type, determines scope, and outputs a properly formatted `type(scope): description` message.

## When It Activates
- User wants to commit code
- User asks for a commit message
- User says "seal this" or "seal commit"

## Commit Types
| Type | Purpose |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Restructure without behavior change |
| `chore` | Tooling, deps, config |
| `docs` | Documentation only |
| `test` | Tests only |
| `style` | Formatting/linting |
| `perf` | Performance |
| `ci` | CI/CD changes |
| `revert` | Revert previous commit |

## Format
```
type(scope): imperative description under 72 chars

Optional body: explains WHY, not WHAT.
```

## Commands
- `seal this` — generate commit from staged changes
- `seal commit` — same
- `commit this` — trigger seal
- `write commit message` — generate without executing

## Storage
No persistent storage. Works with current git repo state.
