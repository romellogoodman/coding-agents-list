#!/usr/bin/env bash
# Clone (or update) every agent in agents.tsv into ./agents/
#
#   ./clone.sh              clone everything not yet present, update the rest
#   ./clone.sh aider pi     only these names (first column of agents.tsv)
#   FULL=1 ./clone.sh       full history instead of shallow (--depth 1)
#
# agents/ is gitignored — nothing cloned here is ever committed.
set -euo pipefail
cd "$(dirname "$0")"

DEST=agents
MANIFEST=agents.tsv
only=" $* "            # " name1 name2 " or "  " when no filter given
depth="--depth 1"
[ -n "${FULL:-}" ] && depth=""

mkdir -p "$DEST"
ok=0; failed=""

while IFS=$'\t' read -r name url _rest; do
  case "$name" in ''|'#'*) continue ;; esac
  if [ "$only" != "  " ]; then
    case "$only" in *" $name "*) ;; *) continue ;; esac
  fi

  if [ -d "$DEST/$name/.git" ]; then
    printf '==> updating %s\n' "$name"
    if git -C "$DEST/$name" pull --ff-only --quiet </dev/null; then ok=$((ok+1)); else failed="$failed $name"; fi
  else
    printf '==> cloning  %s  (%s)\n' "$name" "$url"
    # shellcheck disable=SC2086  # $depth is intentionally unquoted (empty or two words)
    if git clone $depth --quiet "$url" "$DEST/$name" </dev/null; then ok=$((ok+1)); else failed="$failed $name"; fi
  fi
done < "$MANIFEST"

echo
echo "done: $ok ok${failed:+, failed:$failed}"
echo "disk: $(du -sh "$DEST" 2>/dev/null | cut -f1) in $DEST/"
[ -z "$failed" ]
