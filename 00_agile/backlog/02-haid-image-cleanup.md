# Feature: haid-image-cleanup

**Status**: done
**Owner**: unassigned
**Priority**: high
**Complexity**: Medium
**Order**: 02

## Summary

Create a conservative AI-assisted image cleanup pass for selected archive assets.

## Motivation

Some legacy graphics need upscaling or cleanup to look acceptable on modern displays. The originals must remain preserved.

## Requirements

- [x] Identify a safe sample set of images to improve.
- [x] Define an AI-assisted cleanup workflow.
- [x] Preserve originals alongside derived variants.
- [x] Use clear naming so transformed assets are obvious.

## Acceptance Criteria

1. At least one representative image is improved.
2. The cleanup process is reversible and documented.

## Depends On

none

## Notes

This is the first implementation slice of issue #8.

## Suggested First Pass

- Pick one representative banner or nav image from `iu/` that appears soft on modern monitors.
- Generate one derived HD variant alongside the original.
- Rewire only the pages that directly use that asset.
- Capture the exact original-to-derived mapping in the activity log so the workflow stays reversible.
