# HAID Revamp Notes

## Purpose

Keep a running record of archive revamp work so changes to the modern shell,
asset structure, or typography can be reviewed and rolled back without touching
the preserved `iu/` snapshot.

## Original vs Modern Structure

- `iu/` remains the preserved archive snapshot.
- New documentation and rewrite experiments live outside `iu/`.
- Modernized image variants use a `-hd` suffix next to the original asset, such
  as `iu/navart/iuo.gif` -> `iu/navart/iuo-hd.png`.
- The repository root is treated as the published site entry point.
- Deployment helpers live under `deploy/iu-hd/` and `scripts/`.

## CSS Patterns

- Preserve the original archive content as much as possible.
- Prefer shared shell/layout CSS over page-specific rewrites.
- Keep typography and spacing changes isolated to the modern presentation layer.
- Avoid editing the historical archive files unless a restoration issue requires it.

## Experiments

- Static hosting checks should confirm that the repo root and `iu/` entry points
  resolve when served.
- Local deploy checks should validate the compose files and the Nginx/Traefik
  wiring before any live publish work.
- Any visual refresh should be treated as a reversible shell update, not a
  content rewrite.

## Rollback Anchors

- Restore the repo root and `iu/` snapshot as the canonical archive source.
- Revert `deploy/iu-hd/` or workflow changes if publish contracts drift.
- Keep a note of the last known-good local deploy command in `deploy/README.md`.

## Iteration Log

- 2026-06-23: Added deploy target contract checks and smoke coverage for the
  IU-HD path.
- 2026-06-23: Documented that the public hostname is still unresolved; live
  hosting remains a separate follow-up.
- 2026-06-23: Added the first archive image cleanup pass for `iuo` and
  documented the original-vs-modern asset structure.

## Visual References

- Before: [`iu-index-before.png`](./iu-index-before.png)
- After: [`iu-index-after.png`](./iu-index-after.png)
