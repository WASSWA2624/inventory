"""Package the Tapture backend as a deployable .zip.

    python run-tool/deploy/build_backend.py
    python run-tool/deploy/build_backend.py --name tapture-backend-2026-09-09

The archive is written to run-tool/dist/backend/. Dependency directories, build
output and anything that could carry a secret are excluded rather than shipped.
"""

from __future__ import annotations

import argparse
import sys
import zipfile
from datetime import date
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common import (  # noqa: E402
    BACKEND,
    BuildError,
    DIST,
    REPO_ROOT,
    info,
    main,
    reset_dir,
    step,
)

# Never packaged: reinstallable, regenerated, or secret.
EXCLUDED_DIRS = {
    ".git",
    ".venv",
    "venv",
    "node_modules",
    "__pycache__",
    "dist",
    "build",
    "coverage",
    ".pytest_cache",
    ".mypy_cache",
    ".dart_tool",
}
EXCLUDED_SUFFIXES = {".pyc", ".log", ".keystore", ".jks", ".pem", ".key", ".p12"}
EXCLUDED_NAMES = {".env", ".env.local", "key.properties", "secrets.json"}


def is_excluded(path: Path) -> bool:
    if any(part in EXCLUDED_DIRS for part in path.parts):
        return True
    if path.suffix in EXCLUDED_SUFFIXES:
        return True
    return path.name in EXCLUDED_NAMES or path.name.startswith(".env.")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Package the Tapture backend.")
    parser.add_argument(
        "--name",
        default=f"tapture-backend-{date.today().isoformat()}",
        help="archive name without the .zip suffix",
    )
    return parser.parse_args()


def entry() -> None:
    args = parse_args()
    if not BACKEND.is_dir():
        raise BuildError(f"{BACKEND} does not exist")

    step("Selecting the backend sources")
    candidates = [p for p in sorted(BACKEND.rglob("*")) if p.is_file()]
    included = [p for p in candidates if not is_excluded(p.relative_to(BACKEND))]
    if not included:
        raise BuildError(
            "the backend has no files to package. It is built in dev-plan phase 24."
        )
    skipped = len(candidates) - len(included)
    info(f"{len(included)} files included, {skipped} excluded")

    source_files = [p for p in included if ".rules" not in p.relative_to(BACKEND).parts]
    if not source_files:
        info("WARNING: only rule documents found - the backend server is not built yet")

    step("Writing the archive")
    target = reset_dir(DIST / "backend")
    archive = target / f"{args.name}.zip"
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as bundle:
        for path in included:
            bundle.write(path, path.relative_to(BACKEND).as_posix())

    size_mb = archive.stat().st_size / (1024 * 1024)
    info(f"{archive.name}  ({size_mb:.2f} MB)")
    print(f"\nBackend archive ready in {archive.relative_to(REPO_ROOT)}")


if __name__ == "__main__":
    main(entry)
