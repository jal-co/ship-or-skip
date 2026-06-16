# ship-or-skip

[![installs](https://shieldcn.dev/skills/installs/jal-co/ship-or-skip/ship-or-skip.svg?variant=branded)](https://www.skills.sh/jal-co/ship-or-skip/ship-or-skip)
[![rank](https://shieldcn.dev/skills/rank/jal-co/ship-or-skip/ship-or-skip.svg?variant=secondary)](https://www.skills.sh/jal-co/ship-or-skip/ship-or-skip)
[![trending](https://shieldcn.dev/skills/trending/jal-co/ship-or-skip/ship-or-skip.svg?variant=outline)](https://www.skills.sh/trending)
[![Agent Skill](https://shieldcn.dev/badge/agent-skill-spec-000000.svg?variant=branded)](https://agentskills.io)
[![license](https://shieldcn.dev/badge/license-MIT-22c55e.svg)](LICENSE)

> Badges by [shieldcn.dev](https://shieldcn.dev). Install/rank/trending populate once skills.sh indexes the skill (after its first `npx skills add`).

A realistic **co-founder critic** for software and product ideas, packaged as an [Agent Skill](https://agentskills.io). You bring an idea; it helps you decide **Ship**, **Shape**, or **Skip** — backed by a numbered scorecard, real (search-first) research, naming + domain checks, and a saved report you build on over time.

Built for the founder problem of *too many ideas, not enough signal*: it tells you, honestly, when the competition is too large, the niche too small, or there's no path to revenue — and helps sharpen the ones worth pursuing.

## Install

```bash
npx skills add jal-co/ship-or-skip
```

Works in any [Agent Skills](https://agentskills.io)–compatible client (Claude Code, Cursor, Codex, Gemini CLI, opencode, pi, and more). It benefits most from an agent with **live web search** for current competitor, pricing, market, and domain data.

## Usage

Just describe an idea, or invoke a module:

- *"Ship or skip: an AI tool that writes podcast show notes."* → full triage + scorecard + verdict
- *"Who are the competitors for this?"* → competitive landscape
- *"Critique this idea hard."* → deep teardown
- *"Sharpen the positioning."* → wedge & niche
- *"Name this product and check domains."* → naming + availability

### Modules

| Module | Does |
|---|---|
| `triage` *(default)* | Scorecard across 8 axes → **SHIP / SHAPE / SKIP** verdict |
| `critique` | Hard teardown: riskiest assumption, how it dies, "why now" |
| `competitors` | Direct + adjacent competitors, pricing, is the space too crowded / too empty |
| `position` | Beachhead user, the 10x job, the "only we…" sentence |
| `name` | Candidate names + domain/handle availability |

Every module appends to one report per idea at `ship-or-skip-reports/<idea-slug>.md`, so your evaluations accumulate into a paper trail.

## The scorecard (1–5 each)

1. Problem severity
2. Market size / niche viability
3. Competition intensity *(too crowded **and** too empty are both bad)*
4. Differentiation / moat
5. Willingness-to-pay / monetization
6. Distribution & GTM reachability
7. Founder-fit / unfair advantage
8. Name & domain availability *(lighter weight)*

The score informs a **holistic** verdict — it doesn't mechanically decide it.

## What's inside

```
ship-or-skip/
├── SKILL.md                  # metadata + instructions
├── references/
│   ├── scorecard.md          # the 8-axis rubric
│   ├── research.md           # search-first research playbook
│   └── naming.md             # naming + domain availability
├── assets/
│   └── report-template.md    # per-idea report scaffold
└── scripts/
    └── check-domain.sh       # best-effort whois/dig domain check
```

## License

MIT — see [LICENSE](LICENSE).
