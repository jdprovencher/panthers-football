#!/usr/bin/env bash
#
# Build an academic-style PDF of paper.md with pandoc.
#
# Usage:
#   ./build-pdf.sh [output.pdf]
#
# Requirements: pandoc and a LaTeX engine. The script defaults to `tectonic`
# (a self-contained TeX engine); override with PDF_ENGINE=xelatex if a full
# TeX distribution is installed.
#
set -euo pipefail
cd "$(dirname "$0")"

ENGINE="${PDF_ENGINE:-tectonic}"
OUT="${1:-paper.pdf}"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "error: pandoc is required" >&2
  exit 1
fi
if ! command -v "$ENGINE" >/dev/null 2>&1; then
  echo "error: PDF engine '$ENGINE' not found on PATH" >&2
  echo "hint: put a tectonic binary on PATH or set PDF_ENGINE=xelatex" >&2
  exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Academic title metadata (rendered by pandoc's LaTeX template).
cat > "$TMP/metadata.yaml" <<'YAML'
---
title: "Academic Major and Athletic Production in NCAA Division III Football"
subtitle: "An Exploratory Case Study of Plymouth State University's 2026 MASCAC Schedule"
author: "Panthers Football Fan Hub — Independent Research Note"
date: "October 5, 2026 · Data through October 3, 2026"
lang: en-US
toc-title: "Contents"
colorlinks: true
linkcolor: "NavyBlue"
urlcolor: "NavyBlue"
header-includes:
  - \usepackage{etoolbox}
  - \usepackage{xurl}
  - \AtBeginEnvironment{longtable}{\scriptsize}
  - \setlength{\LTleft}{0pt}
  - \setlength{\LTright}{0pt}
  - \renewcommand{\arraystretch}{1.15}
---
YAML

# Drop the Markdown title block (everything up to and including the first rule)
# and the standalone horizontal rules, so the YAML metadata supplies the title.
awk 'seen{print} /^---$/{seen=1}' paper.md | grep -vE '^---$' > "$TMP/body.md"

pandoc \
  "$TMP/metadata.yaml" "$TMP/body.md" \
  --from markdown \
  --toc --toc-depth=2 \
  --shift-heading-level-by=-1 \
  --pdf-engine="$ENGINE" \
  -V documentclass=article \
  -V fontsize=12pt \
  -V geometry:margin=1in \
  -V linestretch=1.15 \
  -V indent=false \
  -V mainfont="DejaVu Serif" \
  -V sansfont="DejaVu Sans" \
  -V monofont="DejaVu Sans Mono" \
  -o "$OUT"

echo "Wrote $OUT"