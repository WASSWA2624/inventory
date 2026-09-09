"""Build the deployable Tapture web bundle.

    python run-tools/deploy/build-web.py
    python run-tools/deploy/build-web.py --base-href /tapture/

The static site is written to run-tools/dist/web/, ready to copy to any host.
"""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common import (  # noqa: E402
    BuildError,
    DIST,
    FRONTEND,
    REPO_ROOT,
    flutter,
    info,
    main,
    reset_dir,
    step,
    tool,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build the Tapture web bundle.")
    parser.add_argument(
        "--base-href",
        default="/",
        help="path the site is served from (default /); must start and end with /",
    )
    parser.add_argument("--debug", action="store_true", help="build unoptimised")
    return parser.parse_args()


def entry() -> None:
    args = parse_args()
    if not args.base_href.startswith("/") or not args.base_href.endswith("/"):
        raise BuildError("--base-href must start and end with '/', for example /tapture/")
    if not (FRONTEND / "web").is_dir():
        raise BuildError(
            "frontend/web is missing. Run: python run-tools/deploy/update-web.py"
        )
    tool("flutter")

    step("Building the web bundle")
    flutter(
        [
            "build",
            "web",
            "--debug" if args.debug else "--release",
            "--base-href",
            args.base_href,
        ]
    )

    source = FRONTEND / "build" / "web"
    if not (source / "index.html").is_file():
        raise BuildError(f"the build reported success but {source}/index.html is missing")

    step("Collecting the artefacts")
    target = reset_dir(DIST / "web")
    shutil.copytree(source, target, dirs_exist_ok=True)
    total = sum(p.stat().st_size for p in target.rglob("*") if p.is_file())
    info(f"{sum(1 for p in target.rglob('*') if p.is_file())} files, {total / (1024 * 1024):.1f} MB")
    print(f"\nWeb bundle ready in {target.relative_to(REPO_ROOT)}")


if __name__ == "__main__":
    main(entry)
