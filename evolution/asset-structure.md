# Asset Structure

This note defines the original-vs-modern layout for the Internet Underground
archive so new work stays reversible.

## Original Assets

- Preserved archive files stay in place under `iu/`.
- Historical HTML and image sources remain the canonical originals.
- Any rollback starts by restoring the original asset reference in the page
  markup.

## Modern Variants

- Transformed CSS and image variants live next to the originals.
- Use a `-hd` suffix for modern image variants, for example
  `iu/navart/iuo.gif` -> `iu/navart/iuo-hd.png`.
- Keep the derived file name in page markup so the modern choice is explicit.

## Rollback Rules

- Do not move the preserved archive snapshot out of `iu/`.
- Revert a modernization by switching the page reference back to the original
  file name.
- Remove derived assets only after the page references have been restored.

## Working Notes

- Shared shell and layout experiments belong in the modern presentation layer.
- Small local swaps are preferred over broad folder moves until the structure
  is stable.
