"""Refresh the web platform folder and its dependencies.

    python run-tool/deploy/update_web.py
    python run-tool/deploy/update_web.py --clean   # also discard build output

Run this after changing pubspec.yaml, after a Flutter upgrade, or to create
frontend/web for the first time.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common import FRONTEND, flutter, info, main, step, tool  # noqa: E402


def drop_regenerated_demo() -> None:
    """Remove the counter demo `flutter create` restores on every run.

    The template rewrites test/widget_test.dart whenever a platform is
    regenerated. It tests a widget this app does not have, so it fails the
    suite the moment it reappears.
    """
    demo = FRONTEND / "test" / "widget_test.dart"
    if demo.is_file():
        demo.unlink()
        info(f"removed regenerated demo test {demo.name}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Refresh the web platform folder.")
    parser.add_argument(
        "--clean", action="store_true", help="discard build output before refreshing"
    )
    return parser.parse_args()


def entry() -> None:
    args = parse_args()
    tool("flutter")

    if args.clean:
        step("Discarding build output")
        flutter(["clean"])

    step("Regenerating the web platform folder")
    flutter(["create", "--platforms=web", "--project-name", "tapture", "."])

    step("Removing template demo code")
    drop_regenerated_demo()

    step("Resolving dependencies")
    flutter(["pub", "get"])

    print(f"\nWeb platform up to date in {FRONTEND.name}/web")


if __name__ == "__main__":
    main(entry)
