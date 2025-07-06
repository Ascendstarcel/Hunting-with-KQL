#!/bin/bash
# Rename invalid Git paths for Windows compatibility

echo "🔁 Scanning and renaming invalid Git-tracked files..."

git ls-files -z | while IFS= read -r -d '' file; do
  newfile="$file"

  # Replace Unicode dash with ASCII dash
  newfile="${newfile//–/-}"
  
  # Replace colons with underscores
  newfile="${newfile//:/_}"
  
  # Replace spaces with underscores
  newfile="${newfile// /_}"

  # Remove trailing underscores (converted from trailing spaces)
  newfile="$(echo "$newfile" | sed 's/_*$//')"

  if [[ "$file" != "$newfile" ]]; then
    mkdir -p "$(dirname "$newfile")"
    git mv "$file" "$newfile"
    echo "Renamed: $file → $newfile"
  fi
done

echo "✅ All renaming complete. Run 'git status' and 'git commit'."
