# Broken Link Notes

This file tracks internal archive link and asset issues separately from
intentional external references.

## Current Pass

A full local HTML reference scan on 2026-06-24 initially checked 27,811
internal references and found 4,388 missing local targets before
deduplication. The deduplicated finding count was 4,375.

The follow-up pass corrected the broad WebGuide path drift:

- page-local `wghome-hd.png`, `wgsearch-hd.png`, and `wgback-hd.png`
  references now point at `/iu/webguide/`
- `/iu/webguide/tune/` references now point at `/iu/webguide/tunes/`
- several obvious typo paths were corrected, including `/iu/nzvart/`,
  `/iu/archives/issue1/twinkies`, malformed `index.htmlaf*` and
  `index.htmlsz*` anchors, and `c_.pstyles.htm`

After that pass, the scanner reported:

- `checked_references=27830`
- `missing_references=67`
- `unique_missing_references=54`

The next manual classification pass corrected obvious typo-level and
restorable local references:

- page-local `art/spacer.gif` references now use `/iu/navart/spacer.gif`
- malformed external links such as `HREF==`, `http;//`, and scheme-less
  `home.earthlink.net/...` links were corrected
- a scheme-less `www.underground-online.com/archive/issue1/twinkies/` link now
  points at the preserved local `/iu/archive/issue1/twinkies/` page
- preserved online-feature and WebGuide back-navigation links now point at
  existing local index pages

After that pass, the scanner reports:

- `checked_references=27827`
- `missing_references=42`
- `unique_missing_references=41`

Remaining missing targets are grouped below.

### Missing Historical Article Pages

- `iu/archive/issue11/capn/index.html` references missing
  `/iu/online/unamail/`
- `iu/archive/issue7/deadman/index.html` references missing
  `/iu/online/dmcall/`
- `iu/archive/issue16/index.html` references missing issue section paths:
  `faq16`, `onwith16`, and `schlock`
- `iu/archive/issue9/index.html` references missing `presses`

These directories either are not present or contain only artwork without a
preserved article `index.html`/`index.htm`.

### Missing Historical Assets and Downloads

- `iu/archive/issue1/onwith1/index.html` references missing
  `art/onwithr.gif`
- `iu/online/reviews/games/diablo/index.html` references missing `dsc1.gif`
  and `dsc2.gif`
- `iu/online/reviews/games/drowngod/index.html` references missing
  `DgPatch5.exe`, `crowley.gif`, `greyhack.gif`, and `readme.txt`
- `iu/online/reviews/games/redalert/index.html` references missing
  `game04.gif`

### Missing WebGuide Detail Pages

Several WebGuide index pages reference historical review/detail pages that are
not present in the archive snapshot, including entries under:

- `iu/webguide/entertain/`
- `iu/webguide/read/`
- `iu/webguide/rec/`
- `iu/webguide/tech/`
- `iu/webguide/tunes/`

The missing WebGuide targets are title-list entries whose corresponding
detail-page files are absent from this repository snapshot.

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
