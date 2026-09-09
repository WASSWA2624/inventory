"""Shared helpers for the Tapture run and deploy scripts.

Every script in `run-tool/` resolves paths through here so that the repository
can be moved or cloned anywhere without editing a script.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
FRONTEND = REPO_ROOT / "frontend"
BACKEND = REPO_ROOT / "backend"
DIST = REPO_ROOT / "run-tool" / "dist"


class BuildError(RuntimeError):
    """A step failed; the message is already user-facing."""


def info(message: str) -> None:
    print(f"  {message}", flush=True)


def step(message: str) -> None:
    print(f"\n==> {message}", flush=True)


def tool(name: str) -> str:
    """Absolute path to an executable on PATH, or a clear failure."""
    found = shutil.which(name)
    if found is None:
        raise BuildError(
            f"{name!r} is not on PATH. Install it, or open a shell where it is."
        )
    return found


def _usable_jdk() -> str | None:
    """A JDK_HOME whose java executable actually exists.

    JAVA_HOME on a developer machine often points at a JDK that has since been
    upgraded or removed; Gradle then fails with a misleading error.
    """
    candidates: list[Path] = []
    env_home = os.environ.get("JAVA_HOME")
    if env_home:
        candidates.append(Path(env_home))
    java_on_path = shutil.which("java")
    if java_on_path:
        candidates.append(Path(java_on_path).resolve().parent.parent)
    for base in (
        Path("C:/Program Files/Microsoft"),
        Path("C:/Program Files/Eclipse Adoptium"),
        Path("C:/Program Files/Java"),
        Path("C:/Program Files/Android/Android Studio/jbr"),
    ):
        if base.is_dir():
            candidates.extend(sorted(base.glob("jdk*"), reverse=True))
            if (base / "bin").is_dir():
                candidates.append(base)
    for candidate in candidates:
        launcher = candidate / "bin" / ("java.exe" if os.name == "nt" else "java")
        if launcher.is_file():
            return str(candidate)
    return None


def _af_unix_scratch() -> str | None:
    """A socket directory whose path has no spaces.

    The JVM opens an AF_UNIX socket under `java.io.tmpdir` for every NIO
    selector. Where that path contains a space or an 8.3 short name, the
    connect fails and Gradle reports "Unable to establish loopback connection".
    """
    default = Path(tempfile.gettempdir())
    if " " not in str(default) and "~" not in str(default):
        return None
    scratch = Path(REPO_ROOT.anchor or "/") / "jtmp"
    try:
        scratch.mkdir(parents=True, exist_ok=True)
    except OSError:
        return None
    return str(scratch)


def gradle_env() -> dict[str, str]:
    """Environment for a Gradle-backed build, with known JDK traps corrected."""
    env = dict(os.environ)
    jdk = _usable_jdk()
    if jdk and env.get("JAVA_HOME") != jdk:
        info(f"JAVA_HOME -> {jdk}")
        env["JAVA_HOME"] = jdk
    scratch = _af_unix_scratch()
    if scratch:
        info(f"AF_UNIX socket dir -> {scratch}")
        option = f"-Djdk.net.unixdomain.tmpdir={scratch}"
        existing = env.get("JAVA_TOOL_OPTIONS", "")
        if option not in existing:
            env["JAVA_TOOL_OPTIONS"] = f"{existing} {option}".strip()
    return env


def run(
    args: list[str],
    cwd: Path,
    env: dict[str, str] | None = None,
    check: bool = True,
) -> int:
    """Run a command, streaming its output, and fail loudly."""
    printable = " ".join(args)
    info(f"$ {printable}   (in {cwd.relative_to(REPO_ROOT) if cwd != REPO_ROOT else '.'})")
    completed = subprocess.run(args, cwd=str(cwd), env=env)
    if check and completed.returncode != 0:
        raise BuildError(f"command failed ({completed.returncode}): {printable}")
    return completed.returncode


def flutter(args: list[str], env: dict[str, str] | None = None) -> None:
    run([tool("flutter"), *args], cwd=FRONTEND, env=env)


def reset_dir(path: Path) -> Path:
    """An empty directory at `path`, creating or clearing it."""
    if path.exists():
        shutil.rmtree(path)
    path.mkdir(parents=True)
    return path


def main(entry) -> None:
    """Run a script entry point, turning BuildError into a clean exit."""
    try:
        entry()
    except BuildError as error:
        print(f"\nFAILED: {error}", file=sys.stderr)
        raise SystemExit(1) from error
    except KeyboardInterrupt:
        print("\nInterrupted.", file=sys.stderr)
        raise SystemExit(130) from None
