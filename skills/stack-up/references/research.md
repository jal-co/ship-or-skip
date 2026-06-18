# Research playbook (search first)

Before recommending or comparing any tool, verify its **current** state. A stack choice made on two-year-old knowledge is a liability.

## What to verify for every candidate tool

1. **Maintenance status** — last release date, commit activity, open-vs-closed issue trend. Abandoned = flag as legacy.
2. **Latest stable version** — and whether the ecosystem has moved to a new major.
3. **Momentum** — is adoption growing, flat, or declining? Where is the ecosystem heading?
4. **Known pitfalls** — well-documented footguns, scaling walls, or migration pain.
5. **Pricing** (for hosted/managed tools) — current tiers and the free-tier cliff.
6. **Ecosystem** — library maturity, docs quality, hiring pool.

## How to search

- Query the official site/repo for the current version and release cadence.
- Check the GitHub repo for last-release date and issue activity.
- Look for recent ("this year") comparisons and migration write-ups, not stale blog posts.
- For "X vs Y", search both the advocacy and the criticism of each.

## Sourcing rules

- When research is performed, cite source links inline.
- Prefer primary sources (official docs, the repo, the changelog) over aggregators.
- Treat anything older than ~2 years as possibly stale — confirm it still holds.
- If no web tool is available, proceed but label every maintenance/version/pricing claim `⚠️ unverified (from training knowledge — verify this)` and tell the user to confirm current state.

## Recency bias is correct here

Per the project's tooling guidance: prefer what the ecosystem is moving toward, flag legacy libraries as technical debt (don't migrate unasked), and check for a native runtime solution before adding a dependency.
