#!/bin/bash
# Friday Diary Archive - runs nightly to move old diary entries to archived/

DIARY_CURRENT="$HOME/ai-memorycore/daily-diary/current"
DIARY_ARCHIVED="$HOME/ai-memorycore/daily-diary/archived"
SESSION_FILE="$HOME/ai-memorycore/main/current-session.md"
CURRENT_MONTH=$(date +%Y-%m)
ARCHIVED_COUNT=0

# Move any .md files from previous months to archived/YYYY-MM/
for file in "$DIARY_CURRENT"/*.md; do
  [ -f "$file" ] || continue
  filename=$(basename "$file")
  # Extract YYYY-MM from filename (expects YYYY-MM-DD.md format)
  file_month=$(echo "$filename" | grep -oE '^[0-9]{4}-[0-9]{2}')
  if [ -n "$file_month" ] && [ "$file_month" != "$CURRENT_MONTH" ]; then
    target_dir="$DIARY_ARCHIVED/$file_month"
    mkdir -p "$target_dir"
    mv "$file" "$target_dir/"
    ARCHIVED_COUNT=$((ARCHIVED_COUNT + 1))
  fi
done

# Update current-session.md with archival note
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
if [ "$ARCHIVED_COUNT" -gt 0 ]; then
  NOTE="[$TIMESTAMP] Nightly archive: moved $ARCHIVED_COUNT diary file(s) to archived/"
else
  NOTE="[$TIMESTAMP] Nightly archive check: nothing to archive"
fi

# Append note to current-session.md if it exists
if [ -f "$SESSION_FILE" ]; then
  echo "" >> "$SESSION_FILE"
  echo "<!-- $NOTE -->" >> "$SESSION_FILE"
fi

echo "$NOTE"
