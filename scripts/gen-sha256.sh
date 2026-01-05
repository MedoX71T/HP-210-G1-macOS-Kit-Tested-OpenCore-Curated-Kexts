#!/usr/bin/env bash
# gen-sha256.sh — generate a simple SHA256 checksum file
if [ $# -ne 1 ]; then
  echo "Usage: $0 path/to/file.zip" >&2
  exit 1
fi
file="$1"
if [ ! -f "$file" ]; then
  echo "File not found: $file" >&2
  exit 2
fi
sha256sum "$file" > "$(basename "$file").sha256" 2>/dev/null || shasum -a 256 "$file" > "$(basename "$file").sha256"
echo "SHA256 written to $(basename "$file").sha256"