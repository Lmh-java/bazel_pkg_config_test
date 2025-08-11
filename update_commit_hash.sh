#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <commit-hash>"
    exit 1
fi

COMMIT_HASH="$1"

# Files to update
FILES=(
    "workspace_test/WORKSPACE"
    "bzlmod_test/MODULE.bazel"
)

for file in "${FILES[@]}"; do
    if [[ -f "$file" ]]; then
        sed -i.bak "s|\[COMMIT_HASH\]|$COMMIT_HASH|g" "$file"
        echo "Updated $file with commit $COMMIT_HASH"
    else
        echo "Skipping $file — file not found"
    fi
done

