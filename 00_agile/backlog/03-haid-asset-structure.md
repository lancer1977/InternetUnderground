# Feature: haid-asset-structure

**Status**: backlog
**Owner**: unassigned
**Priority**: medium
**Complexity**: Small
**Order**: 03

## Summary

Define a clean original-vs-modern asset structure for future revamp work.

## Motivation

The site needs a durable way to separate preserved archive files from modernized variants so future work stays organized and recoverable.

## Requirements

- [ ] Document where original assets live.
- [ ] Document where transformed CSS and image variants live.
- [ ] Make authoritative files easy to identify.
- [ ] Keep rollback paths obvious.

## Acceptance Criteria

1. The structure supports ongoing HAID work.
2. Future changes can tell original and modern assets apart at a glance.

## Depends On

none

## Notes

This is the first implementation slice of issue #9.

## Working Convention

- Keep preserved archive files in place under `iu/`.
- Put modernized variants next to the originals with an obvious `-hd` suffix.
- Use the derived file name in page markup so the repo always points at the new asset intentionally.
- Prefer small, local swaps over broad folder moves until the structure is fully established.
