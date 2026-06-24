# Feature: r620-iu-hd-deploy

**Status**: done
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 08

## Summary

Deploy the IU-HD static site on the R620 host and point Cloudflare at it.

## Motivation

The local deploy is proven, but the site still needs a real homelab ingress and
DNS record so it can be exercised from a stable public hostname.

## Requirements

- [x] Define the R620 stack for the static site.
- [x] Preserve the local deploy path for smoke tests.
- [x] Provision the public DNS record and live ingress for `iu-hd.polyhydragames.com`.

## Acceptance Criteria

1. The stack can be copied to the R620 runtime tree and brought up through Traefik.
2. The DNS record path is explicit enough to apply later without rediscovery.

## Notes

This slice tracked the R620/cloud edge work after the local deploy. The live
hostname now resolves through Cloudflare to the R620 Traefik/Nginx stack.

## Completion Notes

- `iu-hd_web` is running on R620.
- `https://iu-hd.polyhydragames.com/` and `/iu/` return 200.
- The R620 static tree was resynced after stale content was found.
- `scripts/deploy-iu-hd-r620.sh --apply` now syncs repo content before
  refreshing the stack.
