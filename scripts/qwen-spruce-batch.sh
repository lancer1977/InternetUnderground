#!/usr/bin/env bash
set -euo pipefail

ollama_cmd() {
  if command -v ollama >/dev/null 2>&1; then
    printf '%s\n' "ollama"
    return 0
  fi

  if command -v docker >/dev/null 2>&1; then
    printf '%s\n' "docker"
    return 0
  fi

  return 1
}

ensure_ollama_container() {
  local name="qwen-spruce-ollama"

  if docker ps --format '{{.Names}}' | grep -qx "$name"; then
    printf '%s\n' "$name"
    return 0
  fi

  if docker ps -a --format '{{.Names}}' | grep -qx "$name"; then
    docker start "$name" >/dev/null
    printf '%s\n' "$name"
    return 0
  fi

  docker run -d --name "$name" -p 11434:11434 -v ollama:/root/.ollama ollama/ollama:latest >/dev/null
  printf '%s\n' "$name"
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ] || [ "$#" -lt 1 ]; then
  echo "usage: $0 <target-list> [model]" >&2
  echo "  target-list: text file with one repo-relative path per line" >&2
  exit 0
fi

target_list="$1"
model="${2:-qwen2.5-coder}"

if [ ! -f "$target_list" ]; then
  echo "target list not found: $target_list" >&2
  exit 1
fi

runtime="$(ollama_cmd || true)"

if [ -z "$runtime" ]; then
  echo "ollama or docker is required for the local Qwen spruce workflow" >&2
  exit 1
fi

while IFS= read -r target; do
  [ -z "$target" ] && continue
  [ "${target#\#}" != "$target" ] && continue

  if [ ! -f "$target" ]; then
    echo "skipping missing target: $target" >&2
    continue
  fi

  prompt_file="$(mktemp)"
  {
    printf '%s\n\n' "### Target: $target"
    cat scripts/haul-haid-page.prompt.txt
    printf '\n\n### Source\n'
    sed -n '1,220p' "$target"
    printf '\n\n### Response\n'
  } > "$prompt_file"

  if [ "$runtime" = "ollama" ]; then
    ollama run "$model" < "$prompt_file"
  else
    container="$(ensure_ollama_container)"
    docker exec -i "$container" ollama run "$model" < "$prompt_file"
  fi
  rm -f "$prompt_file"
  printf '\n'
done < "$target_list"
