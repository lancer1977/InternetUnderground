# IU-HD R620 and Cloudflare Setup

This document captures the deploy shape for `iu-hd.polyhydragames.com`.

## Current status

Live as of 2026-06-24:

- `iu-hd_web` is deployed on R620 with one running replica.
- Cloudflare DNS has `iu-hd.polyhydragames.com` as a proxied `A` record to
  `131.241.115.72`.
- `https://iu-hd.polyhydragames.com/` returns `HTTP/2 200`.
- `https://iu-hd.polyhydragames.com/iu/` returns `HTTP/2 200`.

## R620 deploy

- Use `deploy/iu-hd/r620-compose.yml`.
- Publish the repo checkout or static export into the live R620 path at
  `/home/lancer1977/servers/internetunderground`.
- Deploy the stack into the existing `traefik-public` network on the R620 host.
- Traefik should route `Host(\`iu-hd.polyhydragames.com\`)` to the Nginx container.

R620 findings from 2026-06-24:

- R620 is reachable at `192.168.0.21` as `dell-r620-1`.
- `/home/lancer1977/servers/internetunderground` exists and contains
  `index.html`, `u-o.gif`, and `iu/index.html`.
- The `traefik-public` overlay network exists.
- `iu-hd_web` is deployed and attached to `traefik-public`.
- R620 has `docker-compose` v1 for `config` checks, but not the `docker compose`
  v2 plugin.

Read-only config check:

```bash
cd /home/lancer1977/servers/internetunderground
docker-compose -f deploy/iu-hd/r620-compose.yml config
```

Repo-local guarded preflight:

```bash
./scripts/deploy-iu-hd-r620.sh
```

Deployment command, after operator approval:

```bash
./scripts/deploy-iu-hd-r620.sh --apply
```

## Cloudflare DNS

Create one DNS record in the `polyhydragames.com` zone:

- Type: `CNAME`
- Name: `iu-hd`
- Target: `r620.polyhydragames.com`
- Proxy: `DNS only` until the R620/TLS edge is confirmed

If `r620.polyhydragames.com` is not the public ingress name for the host,
point the CNAME at the real public ingress hostname or use an `A` record for the
public IP instead.

DNS findings from 2026-06-24:

- `r620.polyhydragames.com` does not resolve from this machine.
- `iu-hd.polyhydragames.com` is a proxied Cloudflare `A` record to
  `131.241.115.72`.
- Existing homelab `polyhydragames.com` records such as
  `radio.polyhydragames.com`, `dreadtv.polyhydragames.com`, and
  `identity.polyhydragames.com` use proxied `A` records to `131.241.115.72`.
- A direct-origin probe with
  `--resolve iu-hd.polyhydragames.com:443:131.241.115.72` reaches Traefik but
  returns a plain `HTTP/2 404`, which is expected until the `iu-hd` stack is
  deployed and Traefik has a matching router.

Public DNS contract:

- Type: `A`
- Name: `iu-hd`
- Target: `131.241.115.72`
- Proxy: enabled, matching the existing homelab records

Repo-local guarded DNS plan:

```bash
./scripts/plan-cloudflare-dns.sh --target iu-hd
```

After operator approval, apply the DNS change with:

```bash
CONFIRM_CLOUDFLARE_DNS_APPLY=yes ./scripts/plan-cloudflare-dns.sh --target iu-hd --apply
```

## Smoke check

After the DNS record exists and the R620 stack is live:

```bash
curl -I https://iu-hd.polyhydragames.com/
curl -I https://iu-hd.polyhydragames.com/iu/
```

## Follow-up issue

Track the live rollout and any TLS/proxy cleanup in a GitHub issue:

- R620 deploy wiring
- Cloudflare DNS record
- Traefik TLS validation
- final public smoke check
