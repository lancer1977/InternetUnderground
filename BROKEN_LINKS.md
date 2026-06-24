# Broken Link Notes

This file tracks internal archive link and asset issues separately from
intentional external references.

## Current Pass

A full local HTML reference scan on 2026-06-24 checked 27,811 internal
references and found 4,388 missing local targets before deduplication. The
deduplicated finding count was 4,375. This is too broad to fix as part of the
hosting enablement ticket, but it means issue #2 should not claim that all
archive-relative links and assets are healthy yet. The follow-up work is
tracked in GitHub issue #11.

Representative missing targets from that scan:

- `iu/archive/issue1/onwith1/index.html` references missing
  `art/onwithr.gif`
- `iu/archive/issue11/capn/index.html` references missing
  `/iu/online/unamail/`
- `iu/archive/issue2/obscure/index.html` repeatedly references missing
  `art/spacer.gif`
- `iu/contact/index.html` references missing `/subfaq.htm`
- `iu/online/reviews/games/diablo/index.html` references missing `dsc1.gif`
  and `dsc2.gif`
- multiple `iu/webguide/culture/*.htm` pages reference missing
  `/iu/webguide/tune/` and page-local navigation artwork

The entry-point smoke path still passes locally for `/` and `/iu/`; this list is
for deeper archive restoration follow-up.

Repeat the scan with:

```bash
python3 scripts/check-archive-links.py --limit 50
```

## External References

The following references are intentionally external and should remain distinct
from archive integrity issues:

- Google Analytics script references in multiple archive pages
- Google AdSense reference in `iu/webguide/index.html`
- The archive statement link in `iu/index.html`

## Notes

- External links are not rewritten here unless a restoration decision requires
  it.
- If future browsing finds a missing local asset or broken internal path, add it
  here with the affected page and filename.
