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

After that pass, the scanner reported:

- `checked_references=27827`
- `missing_references=42`
- `unique_missing_references=41`

The source-recovery pass used `http://underground-online.troybrophy.com/` as
the authoritative public mirror for exact original paths. It restored:

- `iu/archive/issue16/faq16/index.html`
- `iu/archive/issue16/onwith16/index.html`
- `iu/archive/issue16/schlock/index.html`
- `iu/archive/issue9/presses/index.html`
- `iu/online/reviews/games/diablo/dsc1.gif`
- `iu/online/reviews/games/diablo/dsc2.gif`
- `iu/online/reviews/games/drowngod/crowley.gif`
- `iu/online/reviews/games/drowngod/greyhack.gif`
- `iu/online/reviews/games/drowngod/readme.txt`
- `iu/online/reviews/games/redalert/game04.gif`

The checker was also tightened so six-digit `BACKGROUND=000000` color values
are not treated as local file references.

After that pass, the scanner reports:

- `checked_references=27855`
- `missing_references=31`
- `unique_missing_references=30`

Remaining missing targets are grouped below.

### Missing Historical Article Pages

- `iu/archive/issue11/capn/index.html` references missing
  `/iu/online/unamail/`
- `iu/archive/issue7/deadman/index.html` references missing
  `/iu/online/dmcall/`

These paths returned 404 from the Troy Brophy mirror and from alternate
`/origin/` and non-`/iu/` path probes during the 2026-06-24 recovery pass.

### Missing Historical Assets and Downloads

- `iu/archive/issue1/onwith1/index.html` references missing
  `art/onwithr.gif`
- `iu/online/reviews/games/drowngod/index.html` references missing
  `DgPatch5.exe`

These paths returned 404 from the Troy Brophy mirror during the 2026-06-24
recovery pass. The page-local screenshots and text files available from the
mirror were restored.

### Missing WebGuide Detail Pages

Several WebGuide index pages reference historical review/detail pages that are
not present in the archive snapshot, including entries under:

- `iu/webguide/entertain/e_afh.htm`
- `iu/webguide/entertain/e_cmsa.htm`
- `iu/webguide/entertain/e_dtgsa.htm`
- `iu/webguide/entertain/e_mlinkskey.htm`
- `iu/webguide/entertain/e_ntsgr.htm`
- `iu/webguide/read/r_ba.htm`
- `iu/webguide/read/r_cv.htm`
- `iu/webguide/rec/rc_bandjhm.htm`
- `iu/webguide/rec/rc_darinha.htm`
- `iu/webguide/rec/rc_elecpost.htm`
- `iu/webguide/rec/rc_fruitgame.htm`
- `iu/webguide/rec/rc_hoslime.htm`
- `iu/webguide/rec/rc_httiyhab.htm`
- `iu/webguide/rec/rc_mtbrev.htm`
- `iu/webguide/rec/rc_ttaogtue.htm`
- `iu/webguide/tech/tc_anawbap.htm`
- `iu/webguide/tech/tc_chotn.htm`
- `iu/webguide/tech/tc_emblaze.htm`
- `iu/webguide/tech/tc_fos.htm`
- `iu/webguide/tech/tc_gmsc.htm`
- `iu/webguide/tech/tc_jbcp.htm`
- `iu/webguide/tech/tc_ttwttyh.htm`
- `iu/webguide/tunes/tune_.bhphtm`
- `iu/webguide/tunes/tune_sohp.htm`
- `iu/webguide/tunes/tune_ulhp.htm`
- `iu/webguide/tunes/tunerocktrop.htm`

The missing WebGuide targets are title-list entries whose corresponding
detail-page files are absent from this repository snapshot. Representative
missing paths also returned 404 from the Troy Brophy mirror both with and
without the `/iu/` prefix.

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
