# Feature: haid-shared-banner-art

**Status**: backlog
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 07

## Summary

Clean up the most visible shared banner art used by the archive and WebGuide pages.

## Motivation

The page typography is improving, but the site still looks soft if the banner graphics stay low-detail.

## Requirements

- [ ] Identify one or more visible banner assets for cleanup.
- [ ] Produce derived HD variants instead of overwriting originals.
- [ ] Keep a reversible path back to the source files.

## Acceptance Criteria

1. At least one shared banner asset has a clearly improved derived version.
2. The original asset remains intact and traceable.

## Depends On

`haid-image-cleanup`
`haid-asset-structure`

## Notes

Suggested starting assets: `iu/online/imho/imho.gif`, `iu/webguide/wgmap.gif`, and `iu/navart/home.gif`.
