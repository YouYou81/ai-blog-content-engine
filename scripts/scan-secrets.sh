#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"

patterns=(
  'mcp_[A-Za-z0-9]{16,}'
  'x-api-key[[:space:]]*[:=][[:space:]]*["'\'']?[^"'\'',[:space:]]+'
  'api[_-]?key[[:space:]]*[:=][[:space:]]*["'\'']?[^"'\'',[:space:]]+'
  'http://([0-9]{1,3}\.){3}[0-9]{1,3}(:[0-9]+)?'
  'https?://192\.168\.'
  'https?://10\.'
  'https?://172\.(1[6-9]|2[0-9]|3[0-1])\.'
)

status=0
for pattern in "${patterns[@]}"; do
  matches="$(
    rg -n --hidden --glob '!.git/**' --glob '!node_modules/**' --glob '!.env.example' "$pattern" "$root" \
      | grep -Ev '\$\{[A-Z0-9_]+\}|replace-with|your-' \
      || true
  )"

  if [[ -n "$matches" ]]; then
    echo "$matches"
    status=1
  fi
done

if [[ "$status" -ne 0 ]]; then
  echo "Potential secret or private endpoint found. Review the matches above."
  exit "$status"
fi

echo "No obvious secrets found."
