# skills

[![Agent Skill](https://shieldcn.dev/badge/agent-skill-spec-000000.svg?variant=branded)](https://agentskills.io)
[![license](https://shieldcn.dev/badge/license-MIT-22c55e.svg)](LICENSE)

> [Agent Skills](https://agentskills.io) by **jal-co** for deciding *what* to build — and *how*. Badges by [shieldcn.dev](https://shieldcn.dev). Per-skill install counts populate after skills.sh indexes each skill (first `npx skills add`).

The hard part of building isn't building anymore — execution is mostly handled. The bottleneck moved upstream, to the decisions: which idea is worth chasing, and what to build it with. This is a small collection of skills for exactly those calls.

## The flagship: `ship-or-skip`

[![installs](https://shieldcn.dev/skills/installs/jal-co/skills/ship-or-skip.svg?variant=branded)](https://www.skills.sh/jal-co/skills/ship-or-skip)

A realistic co-founder critic for software ideas. You bring an idea, it tells you whether to ship it, shape it, or skip it.

I have a lot of ideas. What I don't have is the headspace to figure out which ones are worth chasing.

The hard part of building isn't building anymore. Models got good enough that execution is mostly handled, so the bottleneck moved. Now it's finding an idea that hasn't already shipped, in a niche big enough to matter, that someone will actually pay for.

This is the gut-check I wanted. You bring an idea, it does the research instead of guessing, and it tells you honestly where the competition is too big, the niche too small, or there's no path to revenue. When tokens are the only currency, your ideas matter.

## Skills

| Skill | What it does | Install |
|---|---|---|
| [`ship-or-skip`](skills/ship-or-skip) | Realistic co-founder critic: 8-axis scorecard → **Ship / Shape / Skip** verdict, competitor research, positioning, naming + domain checks. | `npx skills add jal-co/skills --skill ship-or-skip` |
| [`stack-up`](skills/stack-up) | Pragmatic staff-engineer advisor: recommends a tech stack, compares frameworks/DBs/hosting, and audits an existing repo for legacy or risky choices. | `npx skills add jal-co/skills --skill stack-up` |

The two pair up: `ship-or-skip` decides **whether** to build, `stack-up` decides **what to build it with** — and both append to the same `docs/<idea-slug>.md`.

## Install

```bash
npx skills add jal-co/skills --skill ship-or-skip
```

Works in any [Agent Skills](https://agentskills.io)–compatible client (Claude Code, Cursor, Codex, Gemini CLI, opencode, pi, and more). It benefits most from an agent with **live web search** for current competitor, pricing, market, and domain data.

**Manual install (Claude Code):**
```bash
cp -r skills/ship-or-skip ~/.claude/skills/
```

## Usage

Describe an idea, or name a module:

- *"Ship or skip: an AI tool that writes podcast show notes."* → full triage + scorecard + verdict
- *"Who are the competitors for this?"* → competitive landscape
- *"Critique this idea hard."* → deep teardown
- *"Sharpen the positioning."* → wedge & niche
- *"Name this product and check domains."* → naming + availability

### Modules (in `ship-or-skip`)

| Module | Does |
|---|---|
| `triage` *(default)* | Scorecard across 8 axes → **SHIP / SHAPE / SKIP** verdict |
| `critique` | Hard teardown: riskiest assumption, how it dies, "why now" |
| `competitors` | Direct + adjacent competitors, pricing, is the space too crowded / too empty |
| `position` | Beachhead user, the 10x job, the "only we…" sentence |
| `name` | Candidate names + domain/handle availability |

Every module appends to one report per idea at `docs/<idea-slug>.md`, so your evaluations accumulate into a paper trail (shared with `stack-up`).

### The scorecard (1–5 each)

1. Problem severity
2. Market size / niche viability
3. Competition intensity *(too crowded **and** too empty are both bad)*
4. Differentiation / moat
5. Willingness-to-pay / monetization
6. Distribution & GTM reachability
7. Founder-fit / unfair advantage
8. Name & domain availability *(lighter weight)*

The score informs a **holistic** verdict — it doesn't mechanically decide it.

### `stack-up`

Once an idea is worth building, decide what to build it with:

- *"What stack should I use for this?"* → full stack recommendation across every layer
- *"Postgres vs Mongo for this?"* → focused head-to-head for your context
- *"Audit my repo's stack."* → flags legacy / unmaintained choices + modern alternatives
- *"Give me the setup plan."* → ordered scaffold commands and first-deploy steps

| Module | Does |
|---|---|
| `recommend` *(default)* | Picks language, framework, data, auth, hosting + tradeoffs |
| `compare` | Head-to-head on one decision, for your specific context |
| `audit` | Reviews an existing repo for legacy/risky choices |
| `scaffold` | Concrete init commands + first-deploy checklist |

`stack-up` appends to the same `docs/<idea-slug>.md`, so one idea ends up with its verdict **and** its stack in a single document.

## Repository layout

```
skills/                           # repo root (jal-co/skills)
├── README.md                     # this file
├── AGENTS.md                     # guide for authoring skills here
├── skills.sh.json                # skills.sh grouping metadata
├── LICENSE
└── skills/
    ├── ship-or-skip/
    │   ├── SKILL.md              # metadata + instructions
    │   ├── references/
    │   │   ├── scorecard.md      # the 8-axis rubric
    │   │   ├── research.md       # search-first research playbook
    │   │   └── naming.md         # naming + domain availability
    │   ├── assets/
    │   │   └── report-template.md
    │   └── scripts/
    │       └── check-domain.sh   # best-effort whois/dig domain check
    └── stack-up/
        ├── SKILL.md              # metadata + instructions
        ├── references/
        │   ├── stack-layers.md   # the layers to cover + right-sizing
        │   ├── requirements.md   # what to ask before recommending
        │   └── research.md       # search-first ecosystem research
        ├── assets/
        │   └── stack-template.md
        └── scripts/
            └── scan-stack.sh     # best-effort manifest/dependency scan
```

## License

MIT — see [LICENSE](LICENSE).
