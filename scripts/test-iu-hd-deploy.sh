#!/usr/bin/env bash
set -euo pipefail

compose_file="deploy/iu-hd/docker-compose.local.yml"
r620_file="deploy/iu-hd/r620-compose.yml"
nginx_file="deploy/iu-hd/default.conf"
readme_file="deploy/iu-hd/README.md"

fail() {
  echo "test-iu-hd-deploy: $*" >&2
  exit 1
}

assert_file_contains() {
  local file="$1"
  local pattern="$2"

  if ! grep -Eq "$pattern" "$file"; then
    fail "expected pattern '$pattern' in $file"
  fi
}

assert_file_contains "$compose_file" 'IU_HD_LOCAL_PORT:-8088'
assert_file_contains "$compose_file" 'IU_HD_SITE_ROOT:-\.\./\.\.'
assert_file_contains "$compose_file" 'iu-hd-web'

assert_file_contains "$r620_file" 'iu-hd.polyhydragames.com'
assert_file_contains "$r620_file" 'traefik-public'
assert_file_contains "$r620_file" '/home/lancer1977/servers/internetunderground'
assert_file_contains "$r620_file" 'loadbalancer.server.port=80'

assert_file_contains "$nginx_file" 'server_name iu-hd\.polyhydragames\.com localhost _;'
assert_file_contains "$nginx_file" 'root /srv/site;'
assert_file_contains "$nginx_file" 'try_files \$uri \$uri/ =404;'

assert_file_contains "$readme_file" 'Automated smoke test:'
assert_file_contains "$readme_file" '\./scripts/validate-iu-hd\.sh'

if ! docker compose -f "$compose_file" config >/dev/null; then
  fail "docker compose config failed for $compose_file"
fi

if ! docker compose -f "$r620_file" config >/dev/null; then
  fail "docker compose config failed for $r620_file"
fi

echo "IU-HD deployment target contract checks passed."
