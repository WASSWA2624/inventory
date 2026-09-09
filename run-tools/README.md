# run-tools

Scripts that run Tapture locally and produce the three deployable artefacts. Every script is plain Python 3 with no
third-party packages, is safe to run twice, and resolves paths from the repository root — run them from anywhere.

## Run it locally

```bash
python run-tools/run-web.py                 # open the web app in Chrome
python run-tools/run-web.py --server        # serve on 0.0.0.0 for another device
python run-tools/run-web.py --port 9090 --release

python run-tools/run-backend.py              # backend on :3000, reloads on every edit
python run-tools/run-backend.py --port 4000
```

`run-backend.py` runs the backend under **nodemon**, so saving a file in `backend/src` restarts the server. Running it
again refreshes it: the previous instance is stopped first, so the command is always safe to repeat.

Both ports are freed before the server starts — whatever is listening on the backend port (3000) or the web port
(5173) is stopped, and named in the output so it is never a silent kill. Pass `--keep-ports` to fail on a busy port
instead.

Two limits keep that from becoming destructive. Ports below 1024 are refused outright, because those belong to
system services. And only the backend port is required: if the web port is held by something that will not stop —
an enterprise agent, say — the run warns and continues, because the server does not need that port.

The backend is built in **dev-plan phase 24**. Until `backend/package.json` exists, `run-backend.py` reports what is
missing rather than pretending to start.

## Build the deployables

| Artefact        | Build                                        | Update                                        |
| --------------- | -------------------------------------------- | --------------------------------------------- |
| Android APK     | `python run-tools/deploy/build-android.py` | `python run-tools/deploy/update-android.py` |
| Web bundle      | `python run-tools/deploy/build-web.py`     | `python run-tools/deploy/update-web.py`     |
| Backend`.zip` | `python run-tools/deploy/build-backend.py` | `python run-tools/deploy/update-backend.py` |

Every artefact lands in `run-tools/dist/`, which is ignored by git:

```text
run-tools/dist/
├── android/    app-release.apk
├── web/        index.html and the static site
└── backend/    tapture-backend-<date>.zip
```

The `build-*` scripts compile what is there now. The `update-*` scripts refresh what they compile *from* —
dependencies, and the generated platform folders. Run the update when `pubspec.yaml` changes, after a Flutter
upgrade, or when a platform folder is missing.

Useful flags: `--debug` and `--split` on Android, `--base-href /path/` on web, `--name` on the backend archive,
`--clean` on either platform update. Pass `--help` to any of them.

## Ports

| Port | Used by | Changed with                                               |
| ---- | ------- | ---------------------------------------------------------- |
| 3000 | backend | `--port`, or `$BACKEND_PORT`                           |
| 5173 | web     | `--port` on run-web.py, `--web-port` on run-backend.py |

## What `common.py` handles for you

- **Broken `JAVA_HOME`.** A stale value left by a JDK upgrade makes Gradle fail with an unrelated error. The Android
  scripts find a JDK that actually exists and use that.
- **`Unable to establish loopback connection`.** The JVM opens an AF_UNIX socket under the system temp directory for
  every NIO selector; where that path contains a space or an 8.3 short name the connect fails and every Gradle build
  dies. The Android scripts point `jdk.net.unixdomain.tmpdir` at a space-free directory instead.

Neither fix is written into the repository, so nothing here depends on one machine's setup.

## Scope

These are development and packaging conveniences. Release signing, shrinking and the reproducible build command
belong to dev-plan task 518; the continuous integration pipeline belongs to task 516. Nothing here replaces
`dart run tool/verify.dart`, which stays the gate.
