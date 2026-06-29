# Internet Underground HD Preservation Policy

Internet Underground HD has two public layers with different rules.

## Raw Archive

The raw archive is the historical source material under `iu/`. It preserves the
original files, layouts, copy, image paths, and period-specific navigation as
much as possible.

Allowed changes in `iu/` are limited to preservation-safe maintenance:

- Fixing local paths needed to keep an existing archived page reachable.
- Adding reversible presentation assets beside originals, using obvious names
  such as `*-hd.png`.
- Adding shared CSS or navigation aids that do not rewrite the archived copy.
- Documenting broken external links without treating them as launch blockers.

The raw archive can contain broken external links, obsolete scripts, old image
maps, and pages that were useful in the 1990s web. Those are historical
artifacts, not defects in the modern reader.

## Modern Reader

The modern reader lives under `reader/`. It is the curated, mobile-first
magazine preservation edition.

Modern reader pages may:

- Extract article text and metadata from raw pages.
- Reformat typography, spacing, image placement, and navigation.
- Add issue table-of-contents pages and restoration notes.
- Link to Spottie News payloads and release copy.
- Omit link-directory pages from the first reader milestones.

Modern reader pages must:

- Link back to the raw source page.
- Preserve issue, section, title, and byline context when known.
- Avoid presenting a rewritten page as an exact replica.
- Keep raw-only and restored states visible in issue navigation.

## Link Directory Policy

The old WebGuide and external-link directory pages remain available in the raw
archive. They should not block reader launch work when external destinations are
dead or period-specific.

If a link page deserves future editorial treatment, add a curated summary in the
modern reader and keep the raw page as the source link. Do not bulk-repair old
external destinations unless a separate issue explicitly calls for that work.
