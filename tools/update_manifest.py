#!/usr/bin/env python3
"""Refresh the local hashes in upstream/VexalScripts/manifest.json after editing the mirror.

    python3 tools/update_manifest.py

Only the `bytes` and `local_sha256` fields are recomputed; the upstream hashes (recorded
from the pristine import) and the patch notes are left untouched. Run `python3 tools/check.py`
afterwards, and `python3 tools/check.py --fetch-upstream` to re-verify against GitHub.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "upstream" / "VexalScripts" / "manifest.json"
MIRROR = ROOT / "upstream" / "VexalScripts" / "scripts"


def main() -> int:
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    changed = []
    for entry in manifest["files"]:
        path = MIRROR / entry["path"]
        if not path.exists():
            print(f"missing mirror file: {entry['path']}")
            return 1
        data = path.read_bytes()
        digest = hashlib.sha256(data).hexdigest()
        if entry["bytes"] != len(data) or entry["local_sha256"] != digest:
            changed.append(entry["path"])
        entry["bytes"] = len(data)
        entry["local_sha256"] = digest

    MANIFEST.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    if changed:
        print("updated: " + ", ".join(changed))
    else:
        print("manifest already up to date")
    patched = [e["path"] for e in manifest["files"] if e.get("patched")]
    print(f"{len(manifest['files'])} files, {len(patched)} patched: {', '.join(patched)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
