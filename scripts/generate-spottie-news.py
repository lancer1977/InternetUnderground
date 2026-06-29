#!/usr/bin/env python3
"""Generate Spottie News artifacts from the Internet Underground HD manifest."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "content" / "manifest.json"
OUT_DIR = ROOT / "spottie-news"
PUBLISHED_AT = "2026-06-29"


def load_manifest() -> dict:
    return json.loads(MANIFEST.read_text(encoding="utf-8"))


def article_payload(item: dict) -> dict:
    return {
        "source": "internet-underground-hd",
        "type": "article-restored",
        "id": item["id"],
        "title": item["title"],
        "summary": item["summary"],
        "issue": item["issue"],
        "section": item["section"],
        "modernUrl": item["modernPath"],
        "rawUrl": item["sourcePath"],
        "tags": item["tags"],
        "publishedAt": PUBLISHED_AT,
        "releaseNote": item["releaseNote"],
        "restorationNote": "The raw article remains available unchanged at its source path.",
    }


def issue_payload(item: dict) -> dict:
    return {
        "source": "internet-underground-hd",
        "type": "issue-restored",
        "id": item["id"],
        "title": item["title"],
        "summary": "Issue 8 now has a modern table of contents that separates restored reader content from raw-only archive material.",
        "issue": item["issue"],
        "section": "Milestone",
        "modernUrl": item["modernPath"],
        "rawUrl": item["sourcePath"],
        "tags": [
            "internet-underground",
            "magazine-preservation",
            "restored-issue",
        ],
        "publishedAt": PUBLISHED_AT,
        "releaseNote": "Opened the first Internet Underground HD issue page for Issue 8, with restored and pending article states clearly marked.",
        "restorationNote": "This is a partial issue restoration; additional articles remain queued in the manifest.",
    }


def build_items(manifest: dict) -> list[dict]:
    items: list[dict] = []
    for item in manifest["items"]:
        if item["type"] == "article" and item["status"] == "restored":
            items.append(article_payload(item))
        if item["type"] == "issue" and item["status"] == "partial-restoration":
            items.append(issue_payload(item))
    return sorted(items, key=lambda item: (item["publishedAt"], item["id"]), reverse=True)


def write_json(path: Path, data: object) -> None:
    path.write_text(json.dumps(data, indent=2, ensure_ascii=True) + "\n", encoding="utf-8")


def release_notes(items: list[dict]) -> str:
    lines = [
        "# Internet Underground HD Spottie News Release Notes",
        "",
        f"Generated: {PUBLISHED_AT}",
        "",
    ]
    for item in items:
        lines.extend(
            [
                f"## {item['title']}",
                "",
                item["summary"],
                "",
                item["releaseNote"],
                "",
                f"- Modern reader: `{item['modernUrl']}`",
                f"- Raw source: `{item['rawUrl']}`",
                f"- Tags: {', '.join(item['tags'])}",
                "",
            ]
        )
    return "\n".join(lines)


def main() -> int:
    manifest = load_manifest()
    items = build_items(manifest)
    if not items:
        raise SystemExit("no publishable Spottie News items found")

    OUT_DIR.mkdir(exist_ok=True)
    write_json(OUT_DIR / "latest.json", items[0])
    write_json(
        OUT_DIR / "feed.json",
        {
            "source": "internet-underground-hd",
            "generatedAt": PUBLISHED_AT,
            "items": items,
        },
    )
    (OUT_DIR / "release-notes.md").write_text(release_notes(items), encoding="utf-8")
    print(f"generated {len(items)} Spottie News item(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
