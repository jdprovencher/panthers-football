# Project Report: Plymouth State Panthers Football Website & Research Paper

**Authors:** Jacob Provencher and Logan Burke
**Date:** October 5, 2026
**Repository:** <https://github.com/jdprovencher/panthers-football>
**Live site:** <https://jdprovencher.github.io/panthers-football/>

---

## Executive Summary

We designed, built, and deployed a complete fan website about **Plymouth State
University Panthers football** (NCAA Division III, MASCAC), and wrote a companion
**academic-style research paper** on how a player's college major relates to on-field
production. The website is a static, responsive site published with GitHub Pages; the
paper is available both as a web page and as a typeset PDF produced with pandoc.

All content is grounded in real, sourced data — Plymouth State's actual 2026 schedule
and results, MASCAC weekly award releases, and academic majors pulled from official
athletics rosters. This report summarizes what we built and, specifically, the
improvements we made along the way.

---

## 1. Project Overview

Our goals were to:

1. Build an accurate, attractive fan site about the Plymouth State football program.
2. Keep every fact tied to a real, citable source.
3. Add a genuine analytical component rather than only descriptive content.
4. Make the whole thing easy to publish and maintain on GitHub Pages.

The result has two halves:

- **A seven-page website** with news, schedule, team profiles, opponent scouting,
  program history, game-day information, and a research section.
- **An academic paper** (Markdown + HTML + PDF) analyzing major choice versus athletic
  performance using real 2026 data.

---

## 2. Website Development

### 2.1 Site structure

| Page | Purpose |
| --- | --- |
| `index.html` | Landing page: hero, season snapshot, kickoff countdown, latest headlines, results, program overview |
| `schedule.html` | Full 2026 schedule and results with MASCAC context |
| `team.html` | Coaches, players to watch, and 2025 All-MASCAC honors |
| `opponents.html` | Scouting report: one standout player from each 2026 opponent |
| `history.html` | Program timeline, 14 conference titles, playoff history, notable alumni |
| `gameday.html` | Panther Field, home dates, tailgating, directions, how to watch |
| `paper.html` | The academic paper, styled to match the site, with a PDF download |
| `404.html` | Custom not-found page |

Supporting assets: `styles.css`, `script.js`, `favicon.svg`, and `.nojekyll`.

### 2.2 Design and user experience

- A consistent **green-and-white** identity that reflects Plymouth State's colors,
  with an original "PS" monogram (no university trademarks were used).
- A **sticky header** with a mobile-friendly hamburger menu.
- A **hero section** with a field-line motif and a live **countdown** to the next
  kickoff.
- A **scoreboard card** showing the current season record and next opponent.
- Reusable card, table, timeline, and badge components used consistently across pages.
- Responsive layouts verified across desktop, tablet, and mobile breakpoints.

### 2.3 Content and data

- **2026 season, updated through October 3:** the Panthers sat at **2–2 overall and
  1–2 in MASCAC play**, with a 28–14 win over New England College, losses to Worcester
  State and Bridgewater State, and a 14–0 Homecoming shutout of Dean.
- **Upcoming games** listed with dates, sites, and kickoff times.
- **Real player profiles** drawn from MASCAC weekly awards and official recaps (for
  example, Jackson Mahoney, Mekhi Wilson, Jayden Barber, Lance Williams, Michael
  Marcucella).
- **Program history**: the 1970 inaugural season, the Jay Cottone dynasty, Joe Dudek's
  ninth-place Heisman finish, the 1994 playoff win, the 2008 and 2017 titles, the 2022
  New England Bowl championship, and the shared 2025 MASCAC crown.

### 2.4 Accessibility and quality

- Semantic HTML landmarks and a "skip to content" link on every page.
- `aria` labels on navigation, menus, and interactive elements.
- `prefers-reduced-motion` support to respect user motion settings.
- Internal link and markup integrity checked programmatically — no broken links or
  unbalanced tags.

### 2.5 Deployment

- Published to GitHub Pages at **<https://jdprovencher.github.io/panthers-football/>**.
- After the legacy Pages builder stalled, we moved to a **GitHub Actions workflow**
  (`.github/workflows/deploy-pages.yml`) using the official `upload-pages-artifact` and
  `deploy-pages` actions for reliable, observable deployments.

---

## 3. The Academic Paper

### 3.1 Purpose and scope

**Title:** *Academic Major and Athletic Production in NCAA Division III Football: An
Exploratory Case Study of Plymouth State University's 2026 MASCAC Schedule.*

The paper asks a descriptive question: among the players who distinguished themselves
in 2026, which academic majors are most prevalent, and does any major "produce" better
players?

### 3.2 Data and methodology

- **Sampling frame:** Plymouth State's nine 2026 opponents plus the Panthers.
- **Performance data:** MASCAC weekly award releases (Player of the Week and Honor
  Roll) from September 8, 14, 21, and October 5.
- **Academic majors:** pulled from official 2026 team rosters and player biographies
  for 30+ players. No majors were imputed.
- **Grouping:** majors were coded into five fields (Business & Management; Health &
  Human Performance; Engineering & Applied Technology; Communication & Social
  Sciences; Undeclared/Unknown).

### 3.3 Structure

Abstract · Introduction · Context · Data and Methods · Results (4.1–4.5) · Discussion ·
Limitations · Conclusion · References.

### 3.4 The statistical analysis we added

Beyond describing award winners, we added a **Normalized Single-Game Production (NSP)**
index to compare stats across positions on a common 0–100 scale, using
position-specific benchmarks (e.g., running backs: rushing yards ÷ 2; defenders:
weighted tackles, tackles for loss, sacks, interceptions). This produced two new
results tables:

- **Table 3 — category leaders:** passing/total offense (Marcucella, Accounting),
  rushing (Wilson, Communications), receiving (Fowler, Marketing), tackles (Mahoney /
  Noel, Marine Engineering / Engineering), and more.
- **Table 4 — production by major field:** Business posted the largest scored pool (14
  players) and the most "elite" games; Engineering & Applied Technology posted the
  highest average production per player.

### 3.5 PDF production

We generated a typeset academic PDF with **pandoc**:

- Because no LaTeX distribution or PDF engine was installed (and there was no `sudo`),
  we used **Tectonic**, a self-contained TeX engine, as the pandoc PDF engine.
- We wrote a reusable build script, **`build-pdf.sh`**, that injects proper YAML
  metadata, promotes headings, adds a table of contents, and applies academic
  formatting (1-inch margins, 12 pt serif, line spacing, styled tables).
- The result is **`paper.pdf`**: 11 pages, US Letter, with a title block, contents
  page, numbered sections, four data tables, and a references list — built with **zero
  LaTeX overflow warnings**.

---

## 4. Improvements We Made

The project grew from a simple static page into a full site plus a research paper. The
most important improvements:

| Area | Before | After |
| --- | --- | --- |
| **Content depth** | A single-page overview | Seven-page site: schedule, team, opponents, history, game day, research |
| **Opponent coverage** | None | A scouting page profiling one standout player from each 2026 opponent, with their real season accomplishments |
| **Analysis** | Descriptive facts only | An academic paper with a defined sample, coded variables, and a quantitative production index |
| **Statistics** | Award lists | A position-normalized **NSP index** ranking majors by statistical output (paper §4.5, Tables 3–4) |
| **Paper output** | Markdown only | Web page **and** a typeset PDF via pandoc + Tectonic |
| **PDF tooling** | None | Reproducible `build-pdf.sh`; works with tectonic or xelatex |
| **Deployment** | Manual/legacy Pages build | Automated **GitHub Actions** deployment workflow |
| **Portability of the 404 page** | Root-absolute asset paths (broken on project sites) | Relative paths that work under `/<repo>/` |
| **LaTeX table layout** | Wide tables overflowed the margin | Table font tuned so Tables 1–4 fit cleanly, no overflow warnings |
| **Title page** | Author line overflowed the right margin | Metadata shortened and centered cleanly |
| **README** | Basic overview | Adds the paper, PDF build instructions, and the new pages |
| **Integrity** | Not checked | Automated checks for broken internal links and unbalanced tags |

Net change: roughly **2,000+ lines** added across the first site build alone, plus the
opponent scouting report, the research paper (~280 lines of Markdown, ~355 lines of
HTML), and the statistics section (~126 added lines) — all tracked in version control.

---

## 5. Technical Stack and File Inventory

**Stack:** semantic HTML5, hand-written CSS (custom properties, grid, flexbox),
vanilla JavaScript, Markdown, pandoc, Tectonic/LaTeX, GitHub Pages, GitHub Actions.

**Key files:**

- `index.html`, `schedule.html`, `team.html`, `opponents.html`, `history.html`,
  `gameday.html`, `paper.html`, `404.html`
- `styles.css`, `script.js`, `favicon.svg`
- `paper.md` (paper source), `paper.pdf` (typeset output), `build-pdf.sh`
- `README.md` (setup/build docs), `REPORT.md` (this document)
- `.nojekyll`, `.github/workflows/deploy-pages.yml`

---

## 6. Challenges and Resolutions

| Challenge | Resolution |
| --- | --- |
| No LaTeX or PDF engine installed, no `sudo` | Downloaded the static **Tectonic** binary and used it as pandoc's PDF engine |
| GitHub Actions **degraded performance**, leaving deploys stuck in "queued" | Waited out the incident; re-triggered the workflow; confirmed the site went live (HTTP 200) |
| Legacy Pages builder stalled | Migrated to a GitHub Actions Pages workflow |
| Wide markdown tables overflowed LaTeX margins | Reduced table font sizing and adjusted cell labels; verified visually page by page |
| Consistency of the research data | Pulled majors only from official rosters and recorded "not published" rather than guessing |

---

## 7. Results

- A complete, responsive site is live and publicly accessible.
- The site is accurate to the 2026 season as of October 3, 2026.
- The academic paper is available as an HTML page and a polished 11-page PDF.
- The paper's clear conclusion: **business-related majors are the plurality among the
  conference's most decorated and most statistically productive players, but this
  reflects how common those majors are rather than proving they produce better players**
  — with institution-specific programs (e.g., Marine Engineering at Mass. Maritime)
  showing the most distinct patterns.

---

## 8. Future Work

- Update the site weekly as the 2026 season progresses and add playoff coverage if the
  Panthers qualify.
- Expand the paper's dataset to all MASCAC teams across multiple seasons for a stronger
  statistical design.
- Add per-game box scores and player photos (subject to rights).
- Optionally export the paper to `.docx` and `.tex` for easier submission elsewhere.

---

## 9. Attribution

Website design, research, and the academic paper were produced by **Jacob Provencher**
and **Logan Burke**.

**Disclaimer:** This is an unofficial fan project. It is not affiliated with Plymouth
State University or the MASCAC. All statistics and majors reflect public sources
available as of October 5, 2026 and are subject to correction.
