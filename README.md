# InternetUnderground

This is the base branch for the `Internet Underground` project.
It is `v0`, the OG reference point, and the starting point for the rewrite.

The original site is preserved in `iu/` as a historical snapshot.
Everything new here is meant to HAID-ify that original: a modified, AI-driven
reinterpretation that keeps the source material visible while pushing the site
forward.

## Purpose

- Preserve the original website in one place
- Treat this repo as the canonical base version
- Build a new version that stays rooted in the original, but is clearly reworked
- Keep the archive separate from modern documentation and rewrite work

## Layout

- `iu/`: the website as it originally existed
- `README.md`: project framing and direction
- `ARCHIVE_INVENTORY.md`: human-readable inventory of preserved content
- `BROKEN_LINKS.md`: current internal link and asset notes

## Hosting

The archive is intended to publish as a static site from the repository root.
Track the current deployment health in
`docs/deploy/issue-2-deployment-health.md` before treating a URL as live.

Expected public URLs:

- `https://lancer1977.github.io/InternetUnderground/`
- Custom domain: `https://internetunderground.polyhydragames.com/`

Verification check:

- Open the URL and confirm the landing page loads
- Click through to `iu/` and confirm the archive entry point works
- Check that relative assets resolve when served from GitHub Pages
- Run `./scripts/test-iu-hd-deploy.sh` for the IU-HD deploy contract
- Run `./scripts/validate-iu-hd.sh` for the local Nginx smoke path

## Direction

The target is not a copy. It is a revamp.

The goal is to keep the original spirit, then HAID-ify the experience into a
new version that feels like a deliberate evolution from `v0`.

## Preservation Rules

- Keep original archive files intact unless there is a clear restoration reason
- Treat new documentation and rewrite content as separate from the preserved site
- Avoid rewriting original page copy without an explicit archival or restoration goal
