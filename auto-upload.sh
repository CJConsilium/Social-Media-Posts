#!/bin/bash

WATCH_DIR="$HOME/Documents/SocialMediaPosts"
LOG_FILE="$WATCH_DIR/auto-upload.log"

cd "$WATCH_DIR"

echo "🔍 Auto-upload started. Watching for changes in: $WATCH_DIR"
echo "$(date): Auto-upload service started" >> "$LOG_FILE"

# Loop forever – watches for file changes
inotifywait -m -r -e create -e modify -e delete -e move "$WATCH_DIR" | while read path action file; do

    echo "📂 Change detected: $action -> $file"
    echo "$(date): Change detected: $action -> $file" >> "$LOG_FILE"

    # Add all changes
    git add .

    # Commit with auto message
    git commit -m "Auto-update: $action $file" >/dev/null 2>&1

    # Push to GitHub
    git push origin main

    echo "⬆️ Auto-upload complete."
done
