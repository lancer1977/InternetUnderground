# Spottie News Publishing Handoff

Internet Underground HD publishes restored magazine events as static artifacts
that `spottie-news` can consume without scraping archived HTML.

## Publishable Events

- `article-restored`: a raw article has a modern reader page.
- `issue-restored`: an issue milestone has a modern table of contents and
  restored article set.
- `reader-update`: reader design, navigation, or publishing improvements.
- `archive-note`: preservation notes about raw-only archive material.

## Artifact Paths

- `spottie-news/latest.json`: newest publishable event.
- `spottie-news/feed.json`: recent publishable events.
- `spottie-news/release-notes.md`: human-friendly release copy.
- `content/spottie-news/schema.json`: required and optional field contract.
- `content/spottie-news/examples/`: checked examples for article and issue
  events.

## Required Fields

Every payload includes `source`, `type`, `id`, `title`, `summary`,
`modernUrl`, `rawUrl`, `tags`, `publishedAt`, and `releaseNote`.

Issue, section, status, and restoration notes are included when available.

## Consumption Contract

`spottie-news` should fetch `spottie-news/feed.json`, read `items`, and render
each item from the same fields used in `release-notes.md`. It does not need to
crawl `iu/` or infer changed pages from commits.

Modern URLs point at `reader/`. Raw URLs point at `iu/` source pages so readers
can compare the polished edition with the preserved original.
