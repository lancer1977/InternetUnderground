#!/usr/bin/env python3
"""Scan preserved HTML for missing local links and assets."""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from html.parser import HTMLParser
from pathlib import Path
import re
from urllib.parse import unquote, urlsplit


LOCAL_ATTRS = {
    "a": "href",
    "area": "href",
    "body": "background",
    "frame": "src",
    "iframe": "src",
    "img": "src",
    "input": "src",
    "link": "href",
    "script": "src",
    "td": "background",
    "table": "background",
}

HEX_COLOR = re.compile(r"#?[0-9a-fA-F]{6}")


@dataclass(frozen=True)
class MissingReference:
    page: Path
    reference: str
    target: Path


class LinkParser(HTMLParser):
    def __init__(self, page: Path, repo_root: Path) -> None:
        super().__init__(convert_charrefs=True)
        self.page = page
        self.repo_root = repo_root
        self.checked = 0
        self.missing: list[MissingReference] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attr_name = LOCAL_ATTRS.get(tag.lower())
        if attr_name is None:
            return

        attr_map = {key.lower(): value for key, value in attrs if value is not None}
        raw_ref = (attr_map.get(attr_name) or "").strip()
        if not raw_ref or raw_ref.startswith(("#", "javascript:", "mailto:", "tel:")):
            return
        if attr_name == "background" and HEX_COLOR.fullmatch(raw_ref):
            return

        parsed = urlsplit(raw_ref)
        if parsed.scheme or parsed.netloc:
            return

        path = unquote(parsed.path)
        if not path:
            return

        if path.startswith("/"):
            target = self.repo_root / path.lstrip("/")
        else:
            target = self.page.parent / path

        self.checked += 1
        if self._exists(target, raw_ref):
            return

        self.missing.append(MissingReference(self.page, raw_ref, target))

    @staticmethod
    def _exists(target: Path, raw_ref: str) -> bool:
        if raw_ref.endswith("/") or target.is_dir():
            return (target / "index.html").exists() or (target / "index.htm").exists()
        return target.exists()


def is_scannable(path: Path) -> bool:
    ignored_parts = {".git", ".devstudio", ".pages-site"}
    return not any(part in ignored_parts for part in path.parts)


def relative(path: Path, root: Path) -> str:
    try:
        return str(path.resolve().relative_to(root))
    except ValueError:
        return str(path)


def scan(root: Path, start: Path) -> tuple[int, list[MissingReference]]:
    checked = 0
    missing: list[MissingReference] = []
    html_files = sorted(
        path
        for path in start.rglob("*")
        if path.suffix.lower() in {".html", ".htm"} and is_scannable(path)
    )

    for page in html_files:
        parser = LinkParser(page, root)
        parser.feed(page.read_text(errors="ignore"))
        checked += parser.checked
        missing.extend(parser.missing)

    return checked, missing


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root",
        type=Path,
        default=Path.cwd(),
        help="Repository root. Defaults to the current directory.",
    )
    parser.add_argument(
        "--start",
        type=Path,
        default=None,
        help="Directory to scan. Defaults to the repository root.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=50,
        help="Maximum missing references to print. Use 0 for summary only.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    start = (args.start or root).resolve()
    checked, missing = scan(root, start)

    unique_missing = sorted(
        {(relative(item.page, root), item.reference, relative(item.target, root)) for item in missing}
    )

    print(f"checked_references={checked}")
    print(f"missing_references={len(missing)}")
    print(f"unique_missing_references={len(unique_missing)}")

    if args.limit:
        for page, ref, target in unique_missing[: args.limit]:
            print(f"{page}\t{ref}\t{target}")

    return 1 if missing else 0


if __name__ == "__main__":
    raise SystemExit(main())
