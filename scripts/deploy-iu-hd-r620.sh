#!/usr/bin/env bash
set -euo pipefail

remote_host="${IU_HD_R620_HOST:-192.168.0.21}"
remote_root="${IU_HD_R620_ROOT:-/home/lancer1977/servers/internetunderground}"
stack_name="${IU_HD_STACK_NAME:-iu-hd}"
host_name="${IU_HD_HOST:-iu-hd.polyhydragames.com}"
apply=0

usage() {
  cat >&2 <<'EOF'
Usage:
  scripts/deploy-iu-hd-r620.sh [--apply]

Defaults to read-only preflight. Use --apply to sync the current repo content
to the R620 static tree and deploy the Docker stack.

Environment:
  IU_HD_R620_HOST   SSH target. Default: 192.168.0.21
  IU_HD_R620_ROOT   Remote static tree. Default: /home/lancer1977/servers/internetunderground
  IU_HD_STACK_NAME  Docker stack name. Default: iu-hd
  IU_HD_HOST        Traefik host rule. Default: iu-hd.polyhydragames.com
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --apply)
      apply=1
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

ssh_base=(
  ssh
  -o BatchMode=yes
  -o ConnectTimeout=10
  -o StrictHostKeyChecking=accept-new
  "$remote_host"
)

run_remote() {
  "${ssh_base[@]}" "$@"
}

echo "Target host: ${remote_host}"
echo "Remote root: ${remote_root}"
echo "Stack name: ${stack_name}"
echo "Host rule: ${host_name}"

run_remote "set -eu
cd '${remote_root}'
test -f index.html
test -f iu/index.html
test -f deploy/iu-hd/r620-compose.yml
test -f deploy/iu-hd/default.conf
docker network inspect traefik-public >/dev/null
docker-compose -f deploy/iu-hd/r620-compose.yml config >/tmp/iu-hd-r620-config.yml
grep -q 'traefik.http.routers.\${IU_HD_APP_NAME:-iu-hd}.rule' deploy/iu-hd/r620-compose.yml
echo 'preflight=ok'
echo 'existing_stack_services:'
docker service ls --format '{{.Name}} {{.Replicas}} {{.Image}}' | grep -E '^${stack_name}_' || true"

if [ "$apply" -ne 1 ]; then
  cat <<EOF
dry_run=ok

To deploy after approval:
  scripts/deploy-iu-hd-r620.sh --apply
EOF
  exit 0
fi

rsync -az --delete \
  --exclude='.git/' \
  --exclude='.devstudio/runtime/' \
  --exclude='.env' \
  --exclude='deploy/iu-hd/.env' \
  ./ "${remote_host}:${remote_root}/"

run_remote "set -eu
cd '${remote_root}'
docker stack deploy -c deploy/iu-hd/r620-compose.yml '${stack_name}'
for _ in \$(seq 1 30); do
  replicas=\$(docker service ls --format '{{.Name}} {{.Replicas}}' | awk '\$1 == \"${stack_name}_web\" {print \$2}')
  if [ \"\${replicas:-}\" = '1/1' ]; then
    break
  fi
  sleep 2
done
docker service ls --format '{{.Name}} {{.Replicas}} {{.Image}}' | grep -E '^${stack_name}_'
docker service ps '${stack_name}_web' --no-trunc
curl -kfsSI --resolve '${host_name}:443:127.0.0.1' 'https://${host_name}/' | sed -n '1,12p'
curl -kfsSI --resolve '${host_name}:443:127.0.0.1' 'https://${host_name}/iu/' | sed -n '1,12p'
echo 'deploy=ok'"
