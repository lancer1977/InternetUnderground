# Feature: haid-image-nav-assets

**Status**: backlog
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 06

## Summary

Improve the clarity of the shared banners, navigation art, and selected legacy images with conservative AI-assisted cleanup.

## Motivation

The pages will still look soft if the key graphics remain low-resolution or heavily compressed.

## Requirements

- [ ] Identify the most visible graphics that need cleanup.
- [ ] Produce derived image variants instead of overwriting originals.
- [ ] Keep the original files available for rollback and comparison.

## Acceptance Criteria

1. At least one nav or banner image is visibly improved.
2. The repo clearly separates original and derived assets.

## Depends On

`haid-image-cleanup`
`haid-asset-structure`

## Notes

Use Qwen only to identify candidates and propose cleanup steps. Use an image tool or editor for the actual raster work.

## Starter Queue

- `iu/navart/home.gif`
- `iu/navart/halfhome.gif`
- `iu/navart/halfback.gif`
- `iu/webguide/wgmap.gif`
- `iu/webguide/wghome.gif`
- `iu/webguide/wgsearch.gif`
- `iu/webguide/wgback.gif`
