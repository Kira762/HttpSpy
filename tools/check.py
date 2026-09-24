#!/usr/bin/env python3
"""Offline integrity checks for the HttpSpy repository (no network, no dependencies).

    python3 tools/check.py                  # run every check
    python3 tools/check.py --verbose        # also list local/attribution URL sites
    python3 tools/check.py --fetch-upstream # additionally re-download upstream files and
                                            # compare them with the recorded hashes

Checks performed:
  1. required files exist and the standalone build is in sync with the two source modules
  2. HttpSpy.lua stays connected to Serializer.lua locally, and the standalone build
     embeds the serializer instead of downloading it
  3. upstream/VexalScripts/scripts still matches upstream/VexalScripts/manifest.json
  4. no Lua file downloads and executes code (remote-load audit)
  5. URL inventory (every remaining http(s) URL is classified)
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "upstream" / "VexalScripts" / "manifest.json"
MIRROR = ROOT / "upstream" / "VexalScripts" / "scripts"

LOADER = "local Serializer = require(script.Parent.Serializer)"
EMBED_MARKER = "local Serializer = (function()"

# A code-load site is "remote" when a load from a string happens near a network fetch.
FETCH_CALL = re.compile(
    r"game:HttpGet\s*\(|game:HttpPost\s*\(|HttpGetAsync\s*\(|HttpPostAsync\s*\("
    r"|syn\.request\s*\(|http\.request\s*\(|request\s*\(\s*\{"
)
CODE_LOAD = re.compile(r"\bloadstring\s*\(|\brequire\s*\(")
URL = re.compile(r"https?://[^\s\"'\]\)<>]+")
# Opt-in flags that must guard any remaining remote code load.
GUARD_FLAG = re.compile(r"AllowRemote|AllowRemoteCode")

WINDOW_BEFORE = 600
WINDOW_AFTER = 400

failures: list[str] = []
notes: list[str] = []
verbose = "--verbose" in sys.argv


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lua_files() -> list[Path]:
    found = []
    for pattern in ("*.lua", "*.luau"):
        found.extend(p for p in ROOT.rglob(pattern) if ".git" not in p.parts and "node_modules" not in p.parts)
    return sorted(set(found))


def fail(message: str) -> None:
    failures.append(message)


# --- 1. structure and standalone build ---------------------------------------
def check_structure() -> None:
    required = [
        "HttpSpy.lua",
        "Serializer.lua",
        "HttpSpy.standalone.lua",
        "tools/build_standalone.py",
        "docs/UPSTREAM.md",
        "upstream/VexalScripts/manifest.json",
        "upstream/VexalScripts/scripts/GuiLoader.lua",
        "upstream/VexalScripts/scripts/init/loader.lua",
    ]
    for name in required:
        if not (ROOT / name).exists():
            fail(f"missing required file: {name}")

    sys.path.insert(0, str(ROOT / "tools"))
    import build_standalone  # type: ignore  # noqa: E402

    expected = build_standalone.build()
    actual = build_standalone.read(ROOT / "HttpSpy.standalone.lua")
    if expected != actual:
        fail("HttpSpy.standalone.lua is out of sync; run `python3 tools/build_standalone.py`")

    # --- 2. local connections -------------------------------------------------
    spy = build_standalone.read(ROOT / "HttpSpy.lua")
    if spy.count(LOADER) != 1:
        fail(f"HttpSpy.lua must contain exactly one {LOADER!r} (found {spy.count(LOADER)})")

    serializer = build_standalone.read(ROOT / "Serializer.lua")
    body = serializer.rstrip()[: -len(build_standalone.MODULE_RETURN)]
    if expected.count(EMBED_MARKER) != 1:
        fail("HttpSpy.standalone.lua must embed exactly one serializer block")
    if body not in expected:
        fail("the serializer block inside HttpSpy.standalone.lua is not byte-identical to Serializer.lua")
    for forbidden in ("require(script.Parent.Serializer)", "raw.githubusercontent.com"):
        if forbidden in expected:
            fail(f"HttpSpy.standalone.lua still contains {forbidden!r}")
    notes.append("standalone build embeds Serializer.lua and downloads nothing at runtime")


# --- 3. upstream mirror manifest ---------------------------------------------
def check_manifest() -> None:
    if not MANIFEST.exists():
        fail("upstream/VexalScripts/manifest.json is missing")
        return

    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    listed = set()
    for entry in manifest["files"]:
        listed.add(entry["path"])
        path = MIRROR / entry["path"]
        if not path.exists():
            fail(f"mirror file missing: {entry['path']}")
            continue
        if path.stat().st_size != entry["bytes"]:
            fail(f"mirror file size changed: {entry['path']} "
                 f"({path.stat().st_size} != {entry['bytes']})")
        if sha256(path) != entry["local_sha256"]:
            fail(f"mirror file content changed: {entry['path']} "
                 f"(compare with upstream using --fetch-upstream)")

    on_disk = {rel(p).split("upstream/VexalScripts/scripts/", 1)[1] for p in MIRROR.rglob("*.lua")}
    for extra in sorted(on_disk - listed):
        fail(f"mirror contains a file that is not in the manifest: {extra}")

    patched = [e["path"] for e in manifest["files"] if e.get("patched")]
    notes.append(
        f"mirror verified against {manifest['source']['repository']}@"
        f"{manifest['source']['commit'][:7]} ({len(manifest['files'])} files, "
        f"{len(patched)} localized: {', '.join(patched)})"
    )


# --- 4. remote-load audit + 5. URL inventory ---------------------------------
def classify_url_site(text: str, position: int, guarded: bool) -> str:
    window = text[max(0, position - WINDOW_BEFORE): position + WINDOW_AFTER]
    line = text[:position].split("\n")[-1]
    if line.strip().startswith("--") or line.strip().startswith("--[["):
        return "attribution"
    if CODE_LOAD.search(window):
        return "code-guarded" if guarded else "code-unguarded"
    if FETCH_CALL.search(window) or "writefile" in window or "getcustomasset" in window:
        return "data"
    return "attribution"


def check_remote_loads() -> None:
    guarded_files = 0
    code_sites = 0
    for path in lua_files():
        text = path.read_text(encoding="utf-8", errors="replace")
        guarded = GUARD_FLAG.search(text) is not None
        if guarded:
            guarded_files += 1
        for match in CODE_LOAD.finditer(text):
            line_start = text.rfind("\n", 0, match.start()) + 1
            if text[line_start:match.start()].lstrip().startswith("--"):
                continue  # documented in a comment, not executed
            window = text[max(0, match.start() - WINDOW_BEFORE): match.start() + WINDOW_AFTER]
            if not FETCH_CALL.search(window):
                if verbose:
                    line = text[: match.start()].count("\n") + 1
                    print(f"note  {rel(path)}:{line} loads code from local source")
                continue
            line = text[: match.start()].count("\n") + 1
            snippet = " ".join(window[-120:].split())
            if guarded:
                code_sites += 1
                print(f"warn  {rel(path)}:{line} remote code load is opt-in guarded :: {snippet}")
            else:
                fail(f"remote code load without an opt-in guard in {rel(path)}:{line} :: {snippet}")

    if code_sites == 0:
        notes.append("no remote code-load site is reachable without an explicit opt-in flag")
    else:
        notes.append(f"{code_sites} remote code-load site(s) remain behind opt-in flags "
                     f"({guarded_files} files carry a guard; see docs/UPSTREAM.md)")


def report_urls() -> None:
    rows = []
    for path in lua_files():
        text = path.read_text(encoding="utf-8", errors="replace")
        guarded = GUARD_FLAG.search(text) is not None
        for match in URL.finditer(text):
            kind = classify_url_site(text, match.start(), guarded)
            line = text[: match.start()].count("\n") + 1
            rows.append((rel(path), line, kind, match.group(0)[:96]))

    counts: dict[str, int] = {}
    for _, _, kind, _ in rows:
        counts[kind] = counts.get(kind, 0) + 1
    summary = ", ".join(f"{kind}={count}" for kind, count in sorted(counts.items()))
    notes.append(f"URL inventory: {len(rows)} URL(s) total ({summary or 'none'})")
    if verbose:
        for file, line, kind, url in rows:
            print(f"url   {kind:14} {file}:{line} {url}")


# --- optional: compare the mirror with GitHub --------------------------------
def fetch_upstream() -> None:
    if "--fetch-upstream" not in sys.argv or not MANIFEST.exists():
        return
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    source = manifest["source"]
    repository = source["repository"].replace("https://github.com/", "")
    commit = source["commit"]
    print(f"\nfetching {repository}@{commit[:7]} to verify the recorded upstream hashes")
    for entry in manifest["files"]:
        url = f"https://raw.githubusercontent.com/{repository}/{commit}/{entry['path']}"
        try:
            with urllib.request.urlopen(url, timeout=30) as response:
                data = response.read()
        except Exception as error:  # pragma: no cover - network dependent
            fail(f"could not download {entry['path']}: {error}")
            continue
        digest = hashlib.sha256(data).hexdigest()
        if digest != entry["upstream_sha256"]:
            fail(f"upstream hash mismatch for {entry['path']} ({digest[:12]} != "
                 f"{entry['upstream_sha256'][:12]})")
        else:
            state = "localized" if entry.get("patched") else "unmodified"
            print(f"ok    {entry['path']} matches upstream ({state})")


def main() -> int:
    check_structure()
    check_manifest()
    check_remote_loads()
    report_urls()
    fetch_upstream()

    print()
    for note in notes:
        print(f"note  {note}")
    for failure in failures:
        print(f"FAIL  {failure}")
    print()
    if failures:
        print(f"{len(failures)} check(s) failed")
        return 1
    print("all offline checks passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
