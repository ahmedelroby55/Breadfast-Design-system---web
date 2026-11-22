#!/usr/bin/env bash
# Build (if needed) and zip a prototype's production-ready static output.
# The zip has index.html at its root and contains no source code or dependencies.
#
# Usage: package.sh [project_dir]
# Prints the absolute path of the zip on the last line of stdout.
set -euo pipefail

PROJECT_DIR="$(cd "${1:-.}" && pwd)"
cd "$PROJECT_DIR"

log() { echo "[package] $*" >&2; }
die() { echo "[package] ERROR: $*" >&2; exit 1; }

OUT_DIR=""

has_build_script() {
  [ -f package.json ] && python3 -I -c 'import json,sys; sys.exit(0 if "build" in json.load(open("package.json")).get("scripts",{}) else 1)'
}

if has_build_script; then
  # Pick the package manager from the lockfile.
  if [ -f pnpm-lock.yaml ]; then PM=pnpm
  elif [ -f yarn.lock ]; then PM=yarn
  elif [ -f bun.lockb ] || [ -f bun.lock ]; then PM=bun
  else PM=npm; fi
  command -v "$PM" >/dev/null || die "$PM is not installed"

  if [ ! -d node_modules ]; then
    log "Installing dependencies with $PM..."
    if [ "$PM" = npm ] && [ -f package-lock.json ]; then npm ci >&2; else "$PM" install >&2; fi
  fi

  log "Building with '$PM run build'..."
  "$PM" run build >&2

  # Find the build output: the most recently modified known output folder with an index.html.
  for d in dist build out .output/public public-build www; do
    if [ -f "$d/index.html" ]; then
      if [ -z "$OUT_DIR" ] || [ "$d/index.html" -nt "$OUT_DIR/index.html" ]; then OUT_DIR="$d"; fi
    fi
  done
  [ -n "$OUT_DIR" ] || die "Build finished but no output folder with index.html was found (looked in dist, build, out, .output/public). If this is a Next.js app, set output: 'export' in next.config."
  log "Using build output: $OUT_DIR/"
else
  [ -f index.html ] || die "No build script in package.json and no index.html at $PROJECT_DIR. Point me at the folder that contains index.html."
  OUT_DIR="."
  log "Plain static site - zipping the folder as it is."
fi

NAME="$(basename "$PROJECT_DIR" | tr -c 'A-Za-z0-9_-' '-' | sed 's/-*$//')"
STAMP="$(date +%Y%m%d-%H%M%S)"
ZIP_DIR="${TMPDIR:-/tmp}/breadfast-publish"
mkdir -p "$ZIP_DIR"
ZIP="$ZIP_DIR/${NAME}-${STAMP}.zip"

(
  cd "$OUT_DIR"
  # Exclusions matter most for plain-HTML folders, where the project folder IS the output.
  zip -qr "$ZIP" . \
    -x '.*' -x '*/.*' \
    -x 'node_modules/*' -x '*/node_modules/*' \
    -x '*.zip' -x '.env*' \
    -x 'package.json' -x 'package-lock.json' -x 'pnpm-lock.yaml' -x 'yarn.lock' \
    -x 'CLAUDE.md' -x 'README.md' -x '*.map'
)

unzip -Z1 "$ZIP" | grep -qx 'index.html' || die "index.html is not at the root of the zip"
SIZE=$(du -h "$ZIP" | cut -f1)
COUNT=$(unzip -Z1 "$ZIP" | grep -vc '/$' || true)
log "Created zip: $COUNT files, $SIZE"
echo "$ZIP"
