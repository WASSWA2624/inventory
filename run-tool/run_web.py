"""Run the Tapture web application locally.

    python run-tool/run_web.py                 # open in Chrome
    python run-tool/run_web.py --server        # serve only, print the URL
    python run-tool/run_web.py --port 8080
    python run-tool/run_web.py --release       # run the optimised build

Stop it with Ctrl-C.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from common import BuildError, FRONTEND, flutter, main, step, tool  # noqa: E402

DEFAULT_PORT = 5353


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the Tapture web app locally.")
    parser.add_argument(
        "--port", type=int, default=DEFAULT_PORT, help=f"port (default {DEFAULT_PORT})"
    )
    parser.add_argument(
        "--server",
        action="store_true",
        help="serve without opening a browser, so any device on the network can connect",
    )
    parser.add_argument(
        "--release", action="store_true", help="run the optimised build, not the debug build"
    )
    return parser.parse_args()


def entry() -> None:
    args = parse_args()
    if not (FRONTEND / "web").is_dir():
        raise BuildError(
            "frontend/web is missing. Run: python run-tool/deploy/update_web.py"
        )
    tool("flutter")

    device = "web-server" if args.server else "chrome"
    step(f"Starting the web app on {device} at http://localhost:{args.port}")
    command = [
        "run",
        "-d",
        device,
        "--web-port",
        str(args.port),
        "--release" if args.release else "--debug",
    ]
    if args.server:
        command += ["--web-hostname", "0.0.0.0"]
    flutter(command)


if __name__ == "__main__":
    main(entry)
