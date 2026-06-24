# Feature: haid-shared-banner-art

**Status**: done
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 07

## Summary

Clean up the most visible shared banner art used by the archive and WebGuide pages.

## Motivation

The page typography is improving, but the site still looks soft if the banner graphics stay low-detail.

## Requirements

- [x] Identify one or more visible banner assets for cleanup.
- [x] Produce derived HD variants instead of overwriting originals.
- [x] Keep a reversible path back to the source files.

## Acceptance Criteria

1. At least one shared banner asset has a clearly improved derived version.
2. The original asset remains intact and traceable.

## Depends On

`haid-image-cleanup`
`haid-asset-structure`

## Notes

Suggested starting assets: `iu/online/imho/imho.gif`, `iu/webguide/wgmap.gif`, and `iu/navart/home.gif`.

## Completion Notes

- Derived variants exist for `imho.gif`, `wgmap.gif`, and `home.gif`.
- `iu/online/index.html` references `imho/imho-hd.png`.
- WebGuide pages reference `wgmap-hd.png`.
- Live IU-HD asset checks return 200 for the derived banner assets.
