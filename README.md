# Plymouth State Panthers Football — Fan Hub

A static, responsive fan website about Plymouth State University Panthers football
(NCAA Division III, MASCAC). Built to be published directly with **GitHub Pages** —
no build step, no dependencies.

## Pages

| File | Description |
| --- | --- |
| `index.html` | Home page: hero, season snapshot, latest news, results and program overview |
| `schedule.html` | Full 2026 schedule with results and MASCAC notes |
| `team.html` | Coaching staff, players to watch and recent All-MASCAC honors |
| `opponents.html` | Scouting report: one player to know from each 2026 opponent |
| `paper.html` | Academic-style research paper on majors and player production (source in `paper.md`) |
| `history.html` | Program timeline, 14 conference titles, playoff history and notable alumni |
| `gameday.html` | Panther Field, home dates, tailgating, directions and how to watch |
| `404.html` | Custom not-found page for GitHub Pages |

Assets: `styles.css`, `script.js`, `favicon.svg`.

## Publish on GitHub Pages

1. Create a new repository on GitHub (for example, `panthers-football`).
2. Push the contents of this folder:

   ```bash
   git init
   git add .
   git commit -m "Add Plymouth State Panthers football fan site"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<your-repo>.git
   git push -u origin main
   ```

3. In the repository, go to **Settings → Pages**.
4. Under **Build and deployment**, set **Source** to *Deploy from a branch*, choose the
   **main** branch and the **/ (root)** folder, then **Save**.
5. Your site will be live at `https://<your-username>.github.io/<your-repo>/` within a
   minute or two.

> The included `.nojekyll` file tells GitHub Pages to serve the files as-is without
> running them through Jekyll.

### Optional: custom domain

Add a file named `CNAME` containing your domain (for example `panthers.example.com`)
and configure the DNS record with your registrar.

## Local preview

Open `index.html` directly in a browser, or serve the folder locally:

```bash
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Updating content

- **Scores and results:** edit the tables in `schedule.html` and the "Last Four" list in
  `index.html`.
- **Next-game countdown:** update the `data-kickoff` ISO date/time on the `.countdown`
  element in `index.html`.
- **Season record:** update the `.record` value in the hero scoreboard and the stat strip.
- **News cards:** swap the headline, date, summary and outbound link in `index.html`.
- **Opponent blurbs:** edit the `.scout-card` entries in `opponents.html` as the season
  progresses. Each card names one opposing player, their role, and a season highlight.
- **Research paper:** `paper.md` is the plain-text source; `paper.html` is the styled
  web version. Update both if you revise the study.

Prefer official sources for accuracy:
[PSU Athletics — Football](https://athletics.plymouth.edu/sports/football).

## Notes

- This is an **unofficial** fan site and is not affiliated with Plymouth State University.
- Logos are original CSS/SVG marks, not the university's official trademarks.
- Team data was compiled from PSU Athletics and Wikipedia.