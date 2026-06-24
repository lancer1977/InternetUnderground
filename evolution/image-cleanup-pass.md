# Image Cleanup Pass

This note records the first conservative image cleanup slice for the archive.

## Sample Set

- Original: `iu/navart/iuo.gif`
- Derived: `iu/navart/iuo-hd.png`

The `iuo` logo is the first representative asset cleaned up for modern display
without removing the preserved original.

## Workflow

1. Generate a higher-resolution PNG from the original GIF with local image
   tooling.
2. Keep the source GIF unchanged.
3. Rewire only the pages that directly use the asset.
4. Document the source-to-derived mapping here so the change can be reversed.

## Pages Updated

- `iu/index.html`
- `iu/home.htm`

## Reversal

- Point the page markup back at `iu/navart/iuo.gif`.
- Remove `iu/navart/iuo-hd.png` after the rollback is verified.

## Validation

- Confirm the page loads with the derived asset in place.
- Inspect the rendered output to make sure the header logo remains legible.
