# Feature: r620-iu-hd-deploy

**Status**: backlog
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

- [ ] Define the R620 stack for the static site.
- [ ] Document the Cloudflare DNS record for `iu-hd.polyhydragames.com`.
- [ ] Preserve the local deploy path for smoke tests.

## Acceptance Criteria

1. The stack can be copied to the R620 runtime tree and brought up through Traefik.
2. The DNS record path is explicit enough to apply later without rediscovery.

## Notes

This slice tracks the remaining R620/cloud edge work after the local deploy.
