# IU-HD R620 and Cloudflare Setup

This document captures the deploy shape for `iu-hd.polyhydragames.com`.

## R620 deploy

- Use `deploy/iu-hd/r620-compose.yml`.
- Publish the repo checkout or static export into the live R620 path at
  `/home/lancer1977/servers/internetunderground`.
- Deploy the stack into the existing `traefik-public` network on the R620 host.
- Traefik should route `Host(\`iu-hd.polyhydragames.com\`)` to the Nginx container.

## Cloudflare DNS

Create one DNS record in the `polyhydragames.com` zone:

- Type: `CNAME`
- Name: `iu-hd`
- Target: `r620.polyhydragames.com`
- Proxy: `DNS only` until the R620/TLS edge is confirmed

If `r620.polyhydragames.com` is not the public ingress name for the host,
point the CNAME at the real public ingress hostname or use an `A` record for the
public IP instead.

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
