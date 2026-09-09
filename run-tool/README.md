# run-tool

Scripts that run Tapture locally and produce the three deployable artefacts. Every script is plain Python 3 with no
third-party packages, is safe to run twice, and resolves paths from the repository root — run them from anywhere.

## Run it locally

```bash
python run-tool/run_web.py                 # open the web app in Chrome
python run-tool/run_web.py --server        # serve on 0.0.0.0 for another device
python run-tool/run_web.py --port 8080 --release
```

## Build the deployables

| Artefact        | Build                                       | Update                                       |
| --------------- | ------------------------------------------- | -------------------------------------------- |
| Android APK     | `python run-tool/deploy/build_android.py` | `python run-tool/deploy/update_android.py` |
| Web bundle      | `python run-tool/deploy/build_web.py`     | `python run-tool/deploy/update_web.py`     |
| Backend`.zip` | `python run-tool/deploy/build_backend.py` | `python run-tool/deploy/update_backend.py` |

Every artefact lands in `run-tool/dist/`, which is ignored by git:

```text
run-tool/dist/
├── android/    app-release.apk
├── web/        index.html and the static site
└── backend/    tapture-backend-<date>.zip
```

The `build_*` scripts compile what is there now. The `update_*` scripts refresh what they compile *from* —
dependencies, and the generated platform folders — so run the update when `pubspec.yaml` changes, after a Flutter
upgrade, or when a platform folder is missing.

Useful flags: `--debug` and `--split` on Android, `--base-href /path/` on web, `--name` on the backend archive,
`--clean` on either update script. Pass `--help` to any of them.

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
