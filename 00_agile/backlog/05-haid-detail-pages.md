# Feature: haid-detail-pages

**Status**: done
**Owner**: unassigned
**Priority**: medium
**Complexity**: Medium
**Order**: 05

## Summary

Tidy the article and detail-page family so individual pages do not collapse into narrow, hard-to-read columns.

## Motivation

The detail pages carry the archive content itself, so they need the same readability work as the landing pages.

## Requirements

- [x] Apply the same readability treatment to the content-heavy subpages.
- [x] Avoid rewriting article copy or changing the archival text.
- [x] Keep page-specific art and navigation working.

## Acceptance Criteria

1. Representative detail pages are comfortable to read without zooming.
2. The changes stay conservative and local to presentation.

## Depends On

`haid-layout-typography`

## Notes

Suggested target set: `iu/online/imho/*`, `iu/webguide/culture/*`, `iu/webguide/rec/*`, and the contact subpages.

## Completion Notes

- Added `iu/online/imho/imho.css` as the representative detail-page
  presentation layer.
- Applied the stylesheet and HD IMHO banner to the IMHO article family.
- Verified the IMHO index and representative article through the live IU-HD
  endpoint on desktop and mobile.
- WebGuide/archive-wide missing references remain tracked separately by #11.
