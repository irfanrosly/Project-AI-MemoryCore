# Shard — Large File Refactoring
*Level 2 Enchantment*

## What It Does
Shard is a strategic guide for safely splitting large files (1000+ lines). It maps the file's structure, detects what imports from it, proposes a clear split plan, and executes the split without breaking existing references.

## When It Activates
- File is 1000+ lines
- User says: `shard this`, `break this up`, `split this file`, `refactor` on large file

## Key Behaviors
- **Dependency detection first** — always checks what imports from the file before splitting
- **Propose before execute** — user approves the split plan
- **Smart strategies** — barrel re-export for many importers, direct updates for few
- **Verification step** — confirms no broken references after split

## Example
```
User: "This utils.ts is 1400 lines, shard it"
→ Shard maps sections: string utils, date utils, validation utils, api utils
→ Detects 12 files importing from utils.ts
→ Proposes barrel strategy: split into 4 files, keep utils.ts as barrel
→ User approves → execute split → verify
```

## Commands
- `shard this` — run full protocol on current/specified file
- `break this up` — same trigger
- `split this file` — same trigger

## Storage
No persistent storage. Works in-session on the target codebase.
