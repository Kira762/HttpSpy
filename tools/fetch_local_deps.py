#!/usr/bin/env python3
"""Download the third-party modules that the vendored scripts used to load at runtime.

The upstream VexalScripts scripts downloaded and executed code from GitHub/GitLab while
running. They now read those modules from local files (see docs/UPSTREAM.md). This helper
fills `upstream/VexalScripts/deps/` with them so the local paths exist:

    python3 tools/fetch_local_deps.py

The downloaded files are third-party code and are intentionally *not* committed to this
repository (see .gitignore and upstream/VexalScripts/deps/README.md). Nothing is executed
by this script - it only writes files. Re-run it to refresh the modules.
"""
from __future__ import annotations

import hashlib
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEPS = ROOT / "upstream" / "VexalScripts" / "deps"

# local path -> (url, sha256 observed on 2026-09-24, used for the consuming script)
TARGETS = {
    "saveinstance.luau": (
        "https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/saveinstance.luau",
        "3e034158c5fbf6306718f5fd62ba256014f4a3fd410dafdaa55f8db124a7e331",
        "backup/VexExplorer.lua (LoadSynSaveInstance)",
    ),
    "lucide-roblox/source.lua": (
        "https://gitlab.com/upio/lucide-roblox-direct/-/raw/main/source.lua",
        None,  # GitLab was unreachable when this repository was prepared
        "backup/obsidian/Library.lua (icon module)",
    ),
    "VexExplorer/VexVersion.lua": (
        "https://raw.githubusercontent.com/Vezise/2026/main/Vez/VexExplorer/VexVersion.lua",
        "746642cacaa8bd37de29d72138e657f18cd9a42e504c67d995ad4af6faa4c9ab",
        "backup/VexExplorer.lua (FetchVersion)",
    ),
}


def main() -> int:
    failures = 0
    for relative, (url, expected_sha, consumer) in TARGETS.items():
        destination = DEPS / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        print(f"fetching {url}\n      -> {destination.relative_to(ROOT)} (for {consumer})")
        try:
            with urllib.request.urlopen(url, timeout=60) as response:
                data = response.read()
        except Exception as error:  # pragma: no cover - network dependent
            print(f"      FAILED: {error}")
            failures += 1
            continue
        destination.write_bytes(data)
        digest = hashlib.sha256(data).hexdigest()
        if expected_sha is None:
            print(f"      wrote {len(data)} bytes, sha256 {digest}")
        elif digest == expected_sha:
            print(f"      wrote {len(data)} bytes, sha256 matches the recorded copy")
        else:
            print(f"      wrote {len(data)} bytes, sha256 {digest}")
            print(f"      note: upstream changed since 2026-09-24 (recorded {expected_sha})")

    print()
    if failures:
        print(f"{failures} download(s) failed; the scripts fall back to an error message "
              f"unless you set the documented opt-in flag")
        return 1
    print("deps are in place; copy upstream/VexalScripts into the executor workspace "
          "(or point getgenv().HttpSpyLocalRoot at it) to use them")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
