#!/usr/bin/env bash
set -euo pipefail

zone_name="${CF_ZONE_NAME:-polyhydragames.com}"
secrets_file="${CLOUDFLARE_ENV_FILE:-${HOME}/.config/secrets/cloudflare.env}"
apply=0
target="all"

usage() {
  cat >&2 <<'EOF'
Usage:
  scripts/plan-cloudflare-dns.sh [--target all|iu-hd|archive] [--apply]

Defaults to dry-run DNS inventory and plan output. Use --apply plus
CONFIRM_CLOUDFLARE_DNS_APPLY=yes to replace the target records in Cloudflare.

Targets:
  iu-hd    Plan iu-hd.polyhydragames.com -> R620 public ingress.
  archive  Plan internetunderground.polyhydragames.com -> GitHub Pages.
  all      Plan both records.

Environment:
  CLOUDFLARE_ENV_FILE  Secret env file. Default: ~/.config/secrets/cloudflare.env
  CF_ZONE_NAME         Cloudflare zone. Default: polyhydragames.com
  CF_DNS_API_TOKEN     Cloudflare API token, usually sourced from the env file.
  CONFIRM_CLOUDFLARE_DNS_APPLY=yes required with --apply.
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --apply)
      apply=1
      ;;
    --target)
      shift
      target="${1:-}"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 2
      ;;
  esac
  shift
done

case "$target" in
  all|iu-hd|archive) ;;
  *)
    usage
    exit 2
    ;;
esac

if [ -f "$secrets_file" ]; then
  # shellcheck disable=SC1090
  source "$secrets_file"
fi

: "${CF_DNS_API_TOKEN:?Missing CF_DNS_API_TOKEN. Source ${secrets_file} or export it.}"

if [ "$apply" -eq 1 ] && [ "${CONFIRM_CLOUDFLARE_DNS_APPLY:-}" != "yes" ]; then
  echo "Refusing DNS mutation without CONFIRM_CLOUDFLARE_DNS_APPLY=yes." >&2
  exit 2
fi

api() {
  method="$1"
  path="$2"
  data="${3:-}"

  if [ -n "$data" ]; then
    curl -fsS \
      -X "$method" \
      -H "Authorization: Bearer ${CF_DNS_API_TOKEN}" \
      -H "Content-Type: application/json" \
      --data "$data" \
      "https://api.cloudflare.com/client/v4${path}"
  else
    curl -fsS \
      -X "$method" \
      -H "Authorization: Bearer ${CF_DNS_API_TOKEN}" \
      -H "Content-Type: application/json" \
      "https://api.cloudflare.com/client/v4${path}"
  fi
}

zone_id="$(
  api GET "/zones?name=${zone_name}" \
    | jq -r '.result[0].id // empty'
)"

if [ -z "$zone_id" ]; then
  echo "Could not find Cloudflare zone: ${zone_name}" >&2
  exit 1
fi

print_records() {
  name="$1"
  api GET "/zones/${zone_id}/dns_records?name=${name}" \
    | jq -r '.result[]? | [.id,.type,.name,.content,(.proxied|tostring),(.ttl|tostring)] | @tsv'
}

replace_record() {
  name="$1"
  type="$2"
  content="$3"
  proxied="$4"
  comment="$5"

  echo "desired_record=${type} ${name} ${content} proxied=${proxied}"
  echo "current_records:"
  current="$(print_records "$name")"
  if [ -n "$current" ]; then
    printf '%s\n' "$current"
  else
    echo "(none)"
  fi

  if [ "$apply" -ne 1 ]; then
    echo "dry_run=ok"
    return 0
  fi

  if [ -n "$current" ]; then
    printf '%s\n' "$current" | cut -f1 | while IFS= read -r record_id; do
      [ -n "$record_id" ] || continue
      api DELETE "/zones/${zone_id}/dns_records/${record_id}" >/dev/null
      echo "deleted_record=${record_id}"
    done
  fi

  payload="$(
    jq -n \
      --arg type "$type" \
      --arg name "$name" \
      --arg content "$content" \
      --argjson proxied "$proxied" \
      --arg comment "$comment" \
      '{type:$type,name:$name,content:$content,ttl:1,proxied:$proxied,comment:$comment}'
  )"
  api POST "/zones/${zone_id}/dns_records" "$payload" \
    | jq -r '"created_record=" + .result.id'
}

echo "zone=${zone_name}"
echo "zone_id=${zone_id}"
echo "apply=${apply}"

if [ "$target" = "all" ] || [ "$target" = "iu-hd" ]; then
  echo "== iu-hd =="
  replace_record \
    "iu-hd.${zone_name}" \
    "A" \
    "131.241.115.72" \
    "true" \
    "InternetUnderground IU-HD R620 Traefik endpoint"
fi

if [ "$target" = "all" ] || [ "$target" = "archive" ]; then
  echo "== archive =="
  replace_record \
    "internetunderground.${zone_name}" \
    "CNAME" \
    "lancer1977.github.io" \
    "false" \
    "InternetUnderground GitHub Pages custom domain"
fi
