#!/bin/bash
# PATCH-001: Fix outdated file references in Project-AI-MemoryCore
# Auto-generated from Feature/Memory-Consolidation-System/patches/PATCH-001.md
# Run: bash patches/apply-patch-001.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "=== PATCH-001: Fixing outdated file references ==="
echo "Root: $ROOT"

# Change 2: Fix diary entry format reference in master-memory.md
sed -i 's|- Format: daily-diary/diary-entry-format.md|- Format: Feature/Save-Diary-System/diary-entry-format.md|' "$ROOT/master-memory.md"

# Change 3: Fix recall format reference in master-memory.md
sed -i 's|- Format: daily-diary/recall-format.md|- Format: Feature/Echo-Memory-Recall/recall-format.md|' "$ROOT/master-memory.md"

# Change 9: Fix memory updates template in daily-diary-protocol.md
sed -i '/identity-core.md/,/current-session.md/c\- [ ] **main-memory.md**: [Personality refinements or preference patterns to add]\n- [ ] **current-session.md**: [Context updates for continuity]' "$ROOT/daily-diary/daily-diary-protocol.md"

# Change 11: Remove critical-thinking.md from setup-wizard.md
sed -i '/✅ \*\*critical-thinking.md\*\*: Domain focus if specified/d' "$ROOT/setup-wizard.md"
sed -i '/✅ \*\*identity-core.md\*\*: Name, relationship style, communication patterns  /d' "$ROOT/setup-wizard.md"
sed -i '/✅ \*\*relationship-memory.md\*\*: User profile and preferences  /d' "$ROOT/setup-wizard.md"

echo ""
echo "=== PATCH-001 applied ==="
echo "Changes: 2,3 (master-memory), 9 (daily-diary-protocol), 11 (setup-wizard)"
echo "Changes 1,4-8,10: post-consolidation notes already applied or save-protocol.md created separately"
echo "Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> "$ROOT/patches/applied.log"
