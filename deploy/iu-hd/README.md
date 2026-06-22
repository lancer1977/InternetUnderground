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
docker compose -f deploy/iu-hd/r620-compose.yml up -d
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

## Stop

```bash
docker compose -f deploy/iu-hd/docker-compose.local.yml down
```

R620 stop:

```bash
docker compose -f deploy/iu-hd/r620-compose.yml down
```
