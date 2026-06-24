# Local IU-HD Deploy

This folder provides a local static-site deployment for the `InternetUnderground`
archive using the `iu-hd.polyhydragames.com` host name.

## What it does

- serves the repository root as a static site
- keeps the archive files read-only
- answers on `http://iu-hd.polyhydragames.com:8088`

## Run

```bash
docker compose -f deploy/iu-hd/docker-compose.local.yml up -d
```

For the R620 host, use the Traefik-facing compose file instead:

```bash
cd /home/lancer1977/servers/internetunderground
docker stack deploy -c deploy/iu-hd/r620-compose.yml iu-hd
```

R620 currently has `docker-compose` v1 available for config rendering, but not
the `docker compose` v2 plugin. Use this read-only check before deploying:

```bash
docker-compose -f deploy/iu-hd/r620-compose.yml config
```

From this repo, use the guarded helper for a read-only R620 preflight:

```bash
./scripts/deploy-iu-hd-r620.sh
```

After operator approval, deploy with:

```bash
./scripts/deploy-iu-hd-r620.sh --apply
```

## Check

```bash
curl -I --resolve iu-hd.polyhydragames.com:8088:127.0.0.1 http://iu-hd.polyhydragames.com:8088/
curl -I --resolve iu-hd.polyhydragames.com:8088:127.0.0.1 http://iu-hd.polyhydragames.com:8088/iu/
```

Automated smoke test:

```bash
./scripts/validate-iu-hd.sh
```

Deployment target contract test:

```bash
./scripts/test-iu-hd-deploy.sh
```

## Stop

```bash
docker compose -f deploy/iu-hd/docker-compose.local.yml down
```

R620 stop:

```bash
docker stack rm iu-hd
```
