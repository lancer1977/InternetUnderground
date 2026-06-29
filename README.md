# InternetUnderground

This is the base branch for the `Internet Underground` project and the home of
Internet Underground HD, a modern magazine preservation edition built beside the
raw archive.

The original site is preserved in `iu/` as a historical snapshot. The modern
reader lives in `reader/` and focuses on restored issues, articles, release
copy, and source links back to the raw archive.

## Purpose

- Preserve the original website in one place
- Treat this repo as the canonical base version
- Publish a curated, mobile-first magazine reader for restored content
- Keep raw archive files separate from modern reader and publishing artifacts
- Emit Spottie News payloads for restored articles, issues, and reader updates

## Layout

- `iu/`: the website as it originally existed
- `reader/`: modern Internet Underground HD reader pages
- `content/manifest.json`: issue/article inventory and raw-only triage notes
- `content/spottie-news/schema.json`: Spottie News payload contract
- `spottie-news/`: generated JSON feed, latest item, and release notes
- `README.md`: project framing and direction
- `ARCHIVE_INVENTORY.md`: human-readable inventory of preserved content
- `BROKEN_LINKS.md`: current internal link and asset notes
- `PRESERVATION_POLICY.md`: raw archive vs modern reader policy

## Hosting

The archive publishes as a static site from the repository root.

Live public URL:

- `https://lancer1977.github.io/InternetUnderground/`

Planned custom archive domain:

- `https://internetunderground.polyhydragames.com/`

This hostname is not live yet; track it separately from the working GitHub Pages
URL so the current archive URL does not regress.

Related IU-HD R620/Cloudflare endpoint:

- `https://iu-hd.polyhydragames.com/`

Track deployment-path health in `docs/deploy/issue-2-deployment-health.md`.

Verification check:

- Open `https://lancer1977.github.io/InternetUnderground/` and confirm the
  landing page loads
- Open `https://lancer1977.github.io/InternetUnderground/iu/` and confirm the
  archive entry point works
- Open `https://lancer1977.github.io/InternetUnderground/reader/` and confirm
  the modern reader entry point works
- Check that relative assets resolve when served from GitHub Pages
- Run `python3 scripts/generate-spottie-news.py`
- Run `python3 scripts/validate-modern-reader.py`
- Run `./scripts/test-iu-hd-deploy.sh` for the IU-HD deploy contract
- Run `./scripts/validate-iu-hd.sh` for the local Nginx smoke path

## Direction

The target is not a copy. It is a magazine preservation edition.

The raw archive keeps the original site visible. The reader presents restored
issue and article content with modern typography, mobile-first navigation, and
explicit raw-source links.

## Preservation Rules

- Keep original archive files intact unless there is a clear restoration reason
- Treat new documentation and rewrite content as separate from the preserved site
- Avoid rewriting original page copy without an explicit archival or restoration goal
- Keep WebGuide and old external-link pages as raw historical artifacts unless a
  separate issue asks for curated treatment
