# Modern Reader Architecture

## Decision

Use a plain static reader layer for the first Internet Underground HD milestone.

The repo already publishes static files from the repository root through GitHub
Pages and IU-HD Nginx. A custom static layer keeps the raw archive untouched,
keeps validation simple, and avoids adding a Node toolchain before there is
enough restored content to justify it.

## Directory Structure

- `iu/`: preserved raw archive.
- `reader/`: modern Internet Underground HD landing page, issue pages, and
  article pages.
- `content/manifest.json`: machine-readable inventory of reader candidates.
- `content/spottie-news/schema.json`: publish payload schema.
- `spottie-news/`: generated JSON and Markdown artifacts for Spottie News.
- `docs/publishing/spottie-news.md`: handoff contract and consumption notes.

## Build And Publishing

The GitHub Pages workflow runs:

1. `python3 scripts/generate-spottie-news.py`
2. `python3 scripts/validate-modern-reader.py`

The workflow then publishes `index.html`, `iu/`, `reader/`, `content/`, and
`spottie-news/`.

## Future Generator Threshold

Move to Astro or Eleventy when the reader has enough restored content that
hand-maintained HTML becomes the source of repeated mistakes. Until then, the
manifest and validator provide the stable seam a generator would consume later.

## Raw Archive Boundaries

The modern reader links to raw source paths but does not mutate them. Broken
WebGuide and link-directory pages stay in `iu/` as historical reference and are
marked `raw-only` in the inventory when they are not part of the first reader
milestone.
