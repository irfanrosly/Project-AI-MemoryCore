---
name: shard
description: "MUST use when a file is 1000+ lines and needs splitting, user says 'shard this',
             'break this up', 'split this file', 'refactor' on a large file. Strategic guide
             for safely splitting large files without breaking imports or references."
---

# Shard — Large File Refactoring
*Breaking the monolith, one clean cut at a time*

## Activation
When this skill activates, output:
"Shard protocol engaged. Analyzing structure..."

## Context Guard

| Context | Status |
|---------|--------|
| **File is 1000+ lines** | ACTIVE — suggest shard |
| **User says "shard this", "break this up", "split this file"** | ACTIVE — full protocol |
| **User says "refactor" on 1000+ line file** | ACTIVE — full protocol |
| **Small file refactoring** | DORMANT |

## Protocol

### Step 1: Map the File
- [ ] Count total lines, identify logical sections
- [ ] Note exports (what outside world imports)
- [ ] Note internal imports

### Step 2: Detect External Dependencies
- [ ] Grep for imports of this file across codebase
- [ ] List every importer and which exports they use

### Step 3: Propose Split Plan
```
Shard Plan: [filename]
Proposed splits: [file1] / [file2] / [file3]
Importers affected: [X files]
Strategy: [barrel re-export / direct update]
Approve to proceed?
```

### Step 4: Execute
- [ ] Create new files
- [ ] Update original (remove extracted code, add re-exports if barrel)
- [ ] Update all importer files

### Step 5: Verify
- [ ] Confirm no broken references / TypeScript errors

## Mandatory Rules
1. Never split without checking importers first
2. Never delete original until new files verified
3. Propose before executing — user approves plan
4. One split at a time

## Level History
- **Lv.1** — Base: file mapping, dependency detection, split proposal, execution, verification. (Origin: Forged from Kiyo's enchantment system, 2026-05-12)

## Usage Stats
- **Total activations**: 0
- **First used**: —
- **Last used**: —
- **30-day active**: No
> This section auto-updates on each activation. Last reviewed: 2026-07-18
