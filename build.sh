#!/bin/sh
# Builds the experiments index into dist/.
#
# This site had no build step, on purpose — public/ was uploaded as-is. It has
# one now only so the Feltwork tokens can be authored once, in one place,
# instead of being copy-pasted into four repos and drifting. The OUTPUT is
# still a single self-contained HTML file plus its fonts and one texture: no
# runtime dependency, no framework, no bundler.
set -e

ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

# Resolve the Feltwork CLI. Normally it is the installed dependency; during
# local development, before the package repo is pushed, a sibling checkout
# works too.
if [ -x node_modules/.bin/feltwork ]; then
  FW="node_modules/.bin/feltwork"
elif [ -f ../feltwork/bin/feltwork.mjs ]; then
  FW="node ../feltwork/bin/feltwork.mjs"
else
  echo "build: feltwork not found. Run 'npm install', or check out the" >&2
  echo "       feltwork repo next to this one." >&2
  exit 1
fi

rm -rf dist
mkdir -p dist

# inline mode: CSS and the filter defs are written into the HTML, and the
# <!--iso:name--> markers are replaced with the real icons. The icons MUST be
# inline — an SVG behind <img src> cannot see the ramp tokens and renders black.
$FW build --out dist --mode inline --html src/index.html

# static extras, copied verbatim
cp src/_headers dist/ 2>/dev/null || true

echo "build: dist/ ready ($(du -sh dist | cut -f1))"
