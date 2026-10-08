#!/usr/bin/env bash
set -euo pipefail
root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
command_name="${1:-desktop}"
if [[ $# -gt 0 ]]; then shift; fi
case "$command_name" in
  setup|desktop|cli|tui|dashboard|build|pack) ;;
  *) printf 'Usage: bash run.sh {setup|desktop|cli|tui|dashboard|build|pack} [arguments]\n' >&2; exit 2 ;;
esac
cd "$root_dir"
git submodule update --init --recursive
export HERMES_HOME="${HERMES_HOME:-$HOME/raw-agent-data}"
export HERMES_RUNTIME_DIR="${HERMES_RUNTIME_DIR:-$HERMES_HOME/tools}"
cd hermes
source ./activate
case "$command_name" in
  setup) hermes setup; npm ci ;;
  cli) hermes "$@" ;;
  tui) hermes --tui "$@" ;;
  dashboard) hermes dashboard "$@" ;;
  desktop|build|pack)
    if [[ ! -d node_modules ]]; then
      printf 'Run bash run.sh setup from the Raw repository before starting the desktop.\n' >&2
      exit 1
    fi
    case "$command_name" in
      desktop) npm run dev --workspace apps/desktop -- "$@" ;;
      build) npm run build --workspace apps/desktop -- "$@" ;;
      pack) npm run pack --workspace apps/desktop -- "$@" ;;
    esac ;;
esac
