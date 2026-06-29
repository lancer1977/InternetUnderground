#!/usr/bin/env python3
"""Validate modern reader pages and Spottie News payloads."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "content" / "manifest.json"
SCHEMA = ROOT / "content" / "spottie-news" / "schema.json"
REQUIRED_PAYLOAD_FIELDS = {
    "source",
    "type",
    "id",
    "title",
    "summary",
    "modernUrl",
    "rawUrl",
    "tags",
    "publishedAt",
    "releaseNote",
}
EVENT_TYPES = {
    "article-restored",
    "issue-restored",
    "reader-update",
    "archive-note",
}


def fail(message: str) -> None:
    raise SystemExit(f"validate-modern-reader: {message}")


def load_json(path: Path) -> dict:
    if not path.exists():
        fail(f"missing {path.relative_to(ROOT)}")
    return json.loads(path.read_text(encoding="utf-8"))


def path_exists(path_text: str) -> bool:
    path = ROOT / path_text
    if path_text.endswith("/") or path.is_dir():
        return (path / "index.html").exists()
    return path.exists()


def validate_manifest() -> None:
    manifest = load_json(MANIFEST)
    if manifest.get("project") != "internet-underground-hd":
        fail("manifest project must be internet-underground-hd")
    if not (ROOT / manifest["policy"]).exists():
        fail("manifest policy file is missing")

    restored_articles = 0
    restored_issue_pages = 0
    raw_only = 0
    for item in manifest.get("items", []):
        for field in ("id", "type", "title", "sourcePath", "status"):
            if not item.get(field):
                fail(f"manifest item missing {field}: {item}")
        if not path_exists(item["sourcePath"]):
            fail(f"missing sourcePath for {item['id']}: {item['sourcePath']}")
        if item["status"] in {"restored", "partial-restoration"}:
            if not item.get("modernPath") or not path_exists(item["modernPath"]):
                fail(f"missing modernPath for {item['id']}")
            if item["type"] == "article" and item["status"] == "restored":
                restored_articles += 1
            if item["type"] == "issue" and item["status"] == "partial-restoration":
                restored_issue_pages += 1
        if item["status"] == "raw-only":
            raw_only += 1

    if restored_articles < 3:
        fail("expected at least three restored articles")
    if restored_issue_pages < 1:
        fail("expected at least one restored issue page")
    if raw_only < 1:
        fail("expected at least one raw-only inventory entry")


def validate_payload(path: Path) -> None:
    payload = load_json(path)
    missing = REQUIRED_PAYLOAD_FIELDS - set(payload)
    if missing:
        fail(f"{path.relative_to(ROOT)} missing fields: {sorted(missing)}")
    if payload["source"] != "internet-underground-hd":
        fail(f"{path.relative_to(ROOT)} has wrong source")
    if payload["type"] not in EVENT_TYPES:
        fail(f"{path.relative_to(ROOT)} has unsupported type")
    if not isinstance(payload["tags"], list) or not payload["tags"]:
        fail(f"{path.relative_to(ROOT)} requires non-empty tags")
    if not path_exists(payload["modernUrl"]):
        fail(f"{path.relative_to(ROOT)} modernUrl missing: {payload['modernUrl']}")
    if not path_exists(payload["rawUrl"]):
        fail(f"{path.relative_to(ROOT)} rawUrl missing: {payload['rawUrl']}")


def validate_spottie() -> None:
    schema = load_json(SCHEMA)
    required = set(schema.get("required", []))
    if required != REQUIRED_PAYLOAD_FIELDS:
        fail("schema required fields do not match validator contract")

    validate_payload(ROOT / "spottie-news" / "latest.json")
    feed = load_json(ROOT / "spottie-news" / "feed.json")
    items = feed.get("items", [])
    if len(items) < 2:
        fail("feed must include at least article and issue events")
    for index, payload in enumerate(items):
        temp = ROOT / "spottie-news" / f".feed-item-{index}.json"
        temp.write_text(json.dumps(payload), encoding="utf-8")
        try:
            validate_payload(temp)
        finally:
            temp.unlink(missing_ok=True)

    examples = sorted((ROOT / "content" / "spottie-news" / "examples").glob("*.json"))
    if len(examples) < 2:
        fail("expected article and issue payload examples")
    for example in examples:
        validate_payload(example)

    notes = ROOT / "spottie-news" / "release-notes.md"
    if "Modern reader:" not in notes.read_text(encoding="utf-8"):
        fail("release notes missing modern reader links")


def validate_reader_html() -> None:
    for page in [
        ROOT / "reader" / "index.html",
        ROOT / "reader" / "issues" / "issue-08" / "index.html",
        ROOT / "reader" / "articles" / "issue-08-crash-test-dummies" / "index.html",
        ROOT / "reader" / "articles" / "issue-08-deathnet" / "index.html",
        ROOT / "reader" / "articles" / "issue-08-internet-impostors" / "index.html",
    ]:
        text = page.read_text(encoding="utf-8")
        if '<meta name="viewport"' not in text:
            fail(f"{page.relative_to(ROOT)} missing viewport meta")
        if "Raw" not in text:
            fail(f"{page.relative_to(ROOT)} missing raw archive/source language")


def main() -> int:
    validate_manifest()
    validate_spottie()
    validate_reader_html()
    print("modern reader and Spottie News validation passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
