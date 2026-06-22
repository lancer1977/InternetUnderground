#!/usr/bin/env bash
set -euo pipefail

compose_file="${COMPOSE_FILE:-deploy/iu-hd/docker-compose.local.yml}"
host="${IU_HD_TEST_HOST:-iu-hd.polyhydragames.com}"
alt_host="${IU_HD_ALT_TEST_HOST:-internetunderground.polyhydragames.com}"
port="${IU_HD_LOCAL_PORT:-8088}"
site_root="${IU_HD_SITE_ROOT:-$(pwd)}"

compose_cmd=(docker compose -f "${compose_file}")
cleanup() {
  "${compose_cmd[@]}" down >/dev/null 2>&1 || true
}

check_url() {
  local url="$1"
  local expect="$2"
  local output

  output="$(curl -fsSI --resolve "${host}:${port}:127.0.0.1" "${url}")"
  if ! grep -q "${expect}" <<<"${output}"; then
    echo "Expected ${expect} for ${url}, got:"
    echo "${output}"
    exit 1
  fi
  echo "${url} OK"
}

check_alt_url() {
  local url="$1"
  local expect="$2"
  local output

  output="$(curl -fsSI --resolve "${alt_host}:${port}:127.0.0.1" "${url}")"
  if ! grep -q "${expect}" <<<"${output}"; then
    echo "Expected ${expect} for ${url}, got:"
    echo "${output}"
    exit 1
  fi
  echo "${url} OK"
}

trap cleanup EXIT

IU_HD_SITE_ROOT="${site_root}" "${compose_cmd[@]}" up -d

for _ in $(seq 1 20); do
  if curl -fsS "http://127.0.0.1:${port}/" >/dev/null; then
    break
  fi
  sleep 1
done

check_url "http://${host}:${port}/" "200 OK"
check_url "http://${host}:${port}/iu/" "200 OK"
check_alt_url "http://${alt_host}:${port}/" "200 OK"
check_alt_url "http://${alt_host}:${port}/iu/" "200 OK"

echo "IU-HD smoke validation passed."
