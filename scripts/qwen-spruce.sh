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
  echo "usage: $0 <prompt-file> [model]" >&2
  exit 0
fi

prompt_file="$1"
model="${2:-qwen2.5-coder}"

if [ ! -f "$prompt_file" ]; then
  echo "prompt file not found: $prompt_file" >&2
  exit 1
fi

runtime="$(ollama_cmd || true)"

if [ -z "$runtime" ]; then
  echo "ollama or docker is required for the local Qwen spruce workflow" >&2
  exit 1
fi

if [ "$runtime" = "ollama" ]; then
  ollama run "$model" < "$prompt_file"
else
  container="$(ensure_ollama_container)"
  docker exec -i "$container" ollama run "$model" < "$prompt_file"
fi
