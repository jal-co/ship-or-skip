#!/usr/bin/env bash
set -euo pipefail

# scan-stack.sh — best-effort inventory of an existing project's stack.
# Detects manifests/lockfiles and prints what it finds for the `audit` module.
# Degrades gracefully when tools or files are missing. Machine-ish output to
# stdout; diagnostics to stderr.

root="${1:-.}"
cd "$root" 2>/dev/null || { echo "scan-stack: cannot enter '$root'" >&2; exit 1; }

echo "# stack scan: $(pwd)" >&2

found=0
emit() { found=1; printf '%s\n' "$1"; }

# --- language / package manifests ---
[ -f package.json ]        && emit "node: package.json"
[ -f deno.json ] || [ -f deno.jsonc ] && emit "deno: deno.json"
[ -f requirements.txt ]    && emit "python: requirements.txt"
[ -f pyproject.toml ]      && emit "python: pyproject.toml"
[ -f Pipfile ]             && emit "python: Pipfile"
[ -f go.mod ]              && emit "go: go.mod"
[ -f Cargo.toml ]          && emit "rust: Cargo.toml"
[ -f Gemfile ]             && emit "ruby: Gemfile"
[ -f composer.json ]       && emit "php: composer.json"
[ -f pom.xml ]             && emit "java: pom.xml"
[ -f build.gradle ] || [ -f build.gradle.kts ] && emit "java/kotlin: gradle"
[ -f pubspec.yaml ]        && emit "dart/flutter: pubspec.yaml"

# --- lockfiles (signal of package manager) ---
[ -f package-lock.json ]   && emit "lock: npm"
[ -f pnpm-lock.yaml ]      && emit "lock: pnpm"
[ -f yarn.lock ]           && emit "lock: yarn"
[ -f bun.lockb ] || [ -f bun.lock ] && emit "lock: bun"
[ -f poetry.lock ]         && emit "lock: poetry"
[ -f uv.lock ]             && emit "lock: uv"

# --- infra / deploy ---
[ -f Dockerfile ]          && emit "deploy: Dockerfile"
[ -f docker-compose.yml ] || [ -f compose.yaml ] && emit "deploy: docker-compose"
[ -f vercel.json ]         && emit "deploy: vercel"
[ -f netlify.toml ]        && emit "deploy: netlify"
[ -f fly.toml ]            && emit "deploy: fly.io"
[ -f railway.json ] || [ -f railway.toml ] && emit "deploy: railway"
[ -d .github/workflows ]   && emit "ci: github-actions"

# --- node deps (top-level only, best-effort) ---
if [ -f package.json ]; then
  if command -v node >/dev/null 2>&1; then
    node -e 'try{const p=require("./package.json");const d={...p.dependencies,...p.devDependencies};for(const k of Object.keys(d||{}))console.log("dep: "+k+" "+d[k])}catch(e){}' 2>/dev/null || true
  elif command -v jq >/dev/null 2>&1; then
    jq -r '(.dependencies // {}) * (.devDependencies // {}) | to_entries[] | "dep: \(.key) \(.value)"' package.json 2>/dev/null || true
  fi
fi

if [ "$found" -eq 0 ]; then
  echo "scan-stack: no recognizable manifests found in $(pwd)" >&2
  exit 0
fi
