# Feature: haid-landing-pages

**Status**: done
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 04

## Summary

Modernize the main landing pages so the site reads cleanly on large monitors and laptops.

## Motivation

The highest-traffic entry points should establish the new presentation layer and make the rest of the archive easier to follow.

## Requirements

- [x] Apply responsive width, spacing, and typography to the main landing pages.
- [x] Keep the content and link structure intact.
- [x] Preserve the archive's visual identity while reducing cramped layout behavior.

## Acceptance Criteria

1. The key landing pages are readable on modern desktop widths.
2. The pages still feel like the original site, not a redesign.

## Depends On

`haid-layout-typography`

## Notes

Suggested target set: `index.html`, `iu/index.html`, `iu/current/index.html`, `iu/archive/index.html`, `iu/contest/index.html`, `iu/online/index.html`, `iu/webguide/index.html`, `iu/contact/index.html`.

## Completion Notes

- Added the missing modern shell for `iu/current/index.html`.
- Verified the full landing-page set through the live IU-HD endpoint.
- Preserved the compact archival feel on `iu/index.html` while fixing the stale HD asset/style path.
