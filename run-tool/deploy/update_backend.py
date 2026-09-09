"""Refresh the backend's dependencies.

    python run-tool/deploy/update_backend.py

The backend is built in dev-plan phase 24. Until its manifest exists this
script reports what it is waiting for rather than pretending to succeed.
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common import BACKEND, BuildError, info, main, run, step, tool  # noqa: E402

# Manifest -> the command that installs from it.
INSTALLERS: list[tuple[str, list[str]]] = [
    ("package.json", ["npm", "install"]),
    ("pubspec.yaml", ["dart", "pub", "get"]),
    ("requirements.txt", ["pip", "install", "-r", "requirements.txt"]),
    ("pyproject.toml", ["pip", "install", "-e", "."]),
    ("go.mod", ["go", "mod", "download"]),
]


def entry() -> None:
    if not BACKEND.is_dir():
        raise BuildError(f"{BACKEND} does not exist")

    step("Looking for a backend manifest")
    for manifest, command in INSTALLERS:
        if (BACKEND / manifest).is_file():
            info(f"found {manifest}")
            run([tool(command[0]), *command[1:]], cwd=BACKEND)
            print("\nBackend dependencies up to date")
            return

    looked_for = ", ".join(manifest for manifest, _ in INSTALLERS)
    raise BuildError(
        f"no manifest in backend/ (looked for {looked_for}). "
        "The backend server is built in dev-plan phase 24; nothing to update yet."
    )


if __name__ == "__main__":
    main(entry)
