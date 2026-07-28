#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Nutzung:
  bash scripts/setup-team-branches.sh [--push] [--count N] [--prefix NAME] [--base BRANCH] [--remote REMOTE]

Optionen:
  --push           Erstellt/pusht Branches auf das Remote (default: nur lokal anlegen)
  --count N        Anzahl Team-Branches (default: 8)
  --prefix NAME    Branch-Prefix (default: team)
  --base BRANCH    Basisbranch fuer neue Branches (default: main)
  --remote REMOTE  Ziel-Remote fuer Push (default: origin)
  -h, --help       Hilfe anzeigen

Beispiele:
  bash scripts/setup-team-branches.sh
  bash scripts/setup-team-branches.sh --push
  bash scripts/setup-team-branches.sh --push --count 8 --prefix team --base main --remote origin
EOF
}

push_enabled=0
team_count=8
prefix="team"
base_branch="main"
remote_name="origin"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --push)
      push_enabled=1
      shift
      ;;
    --count)
      team_count="${2:-}"
      shift 2
      ;;
    --prefix)
      prefix="${2:-}"
      shift 2
      ;;
    --base)
      base_branch="${2:-}"
      shift 2
      ;;
    --remote)
      remote_name="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "[teams] Unbekannte Option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if ! [[ "$team_count" =~ ^[0-9]+$ ]] || [[ "$team_count" -lt 1 ]]; then
  echo "[teams] --count muss eine positive ganze Zahl sein." >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "[teams] Kein Git-Repository gefunden." >&2
  exit 1
fi

if ! git show-ref --verify --quiet "refs/remotes/${remote_name}/${base_branch}"; then
  echo "[teams] Hole Remote-Referenzen von ${remote_name}..."
  git fetch "$remote_name" "$base_branch"
fi

base_ref="refs/remotes/${remote_name}/${base_branch}"
if ! git show-ref --verify --quiet "$base_ref"; then
  echo "[teams] Basisbranch ${remote_name}/${base_branch} nicht gefunden." >&2
  exit 1
fi

created=0
skipped_remote_existing=0
pushed=0

for n in $(seq 1 "$team_count"); do
  branch_name="$(printf '%s-%02d' "$prefix" "$n")"

  if git show-ref --verify --quiet "refs/heads/${branch_name}"; then
    echo "[teams] Lokal vorhanden: ${branch_name}"
  else
    git branch "$branch_name" "${remote_name}/${base_branch}"
    echo "[teams] Lokal erstellt: ${branch_name} -> ${remote_name}/${base_branch}"
    created=$((created + 1))
  fi

  if [[ "$push_enabled" -eq 1 ]]; then
    if git show-ref --verify --quiet "refs/remotes/${remote_name}/${branch_name}"; then
      echo "[teams] Remote vorhanden, uebersprungen: ${remote_name}/${branch_name}"
      skipped_remote_existing=$((skipped_remote_existing + 1))
    else
      git push "$remote_name" "${branch_name}:${branch_name}"
      echo "[teams] Remote erstellt: ${remote_name}/${branch_name}"
      pushed=$((pushed + 1))
    fi
  fi
done

echo "[teams] Fertig. Lokal neu: ${created}"
if [[ "$push_enabled" -eq 1 ]]; then
  echo "[teams] Remote neu: ${pushed}, Remote bereits vorhanden (uebersprungen): ${skipped_remote_existing}"
else
  echo "[teams] Hinweis: Mit --push werden Branches auch auf ${remote_name} angelegt."
fi
