# Stack layers

The layers a `recommend` pass should cover. Not every project needs every layer — skip the ones that don't apply and say so. For each applicable layer give a **primary pick + one-line reason + runner-up**.

| Layer | What it decides | Notes |
|---|---|---|
| **Language / runtime** | The core language and runtime | Bias toward the team's strongest unless the problem demands otherwise. |
| **Frontend framework** | UI rendering & routing | Only if there's a UI. Consider SSR/SSG/SPA needs, SEO, interactivity. |
| **Backend / API style** | How the server is built and exposed | REST vs RPC vs GraphQL; monolith vs serverless functions. Default to a monolith early. |
| **Data layer** | Primary database + access | Default to a relational DB (Postgres) unless data shape/scale says otherwise. Include ORM/query builder choice. |
| **Auth** | Identity & sessions | Prefer a managed provider or a maintained library over rolling your own. Never roll your own crypto. |
| **Hosting / deploy** | Where it runs | Match to budget, ops appetite, and scale. Note free-tier cliffs and lock-in. |
| **Background work** | Jobs, queues, cron | Only if needed. Don't add a queue before there's a job to run. |
| **Storage / media** | Files, blobs, CDN | Object storage + CDN if the app handles user media. |
| **Observability** | Logs, errors, metrics | At least error tracking from day one. |
| **CI/CD** | Build, test, deploy automation | Keep it minimal early; a single pipeline is fine. |

## Right-sizing

- **Pre-launch / MVP:** the smallest stack that ships. One app, one database, one host. No microservices, no Kubernetes, no multi-region unless there's a hard requirement.
- **Growing:** add caching, background jobs, and observability as real load appears — not before.
- **Scale:** decompose only when a specific bottleneck demands it, and name the bottleneck.

## Defaults worth defending

Treat these as the boring default to beat, not a mandate — override with a stated reason:

- Relational DB (Postgres) over NoSQL until the data shape clearly isn't relational.
- A single deployable app over services until team/scale forces a split.
- A managed/hosted option over self-managed infra for small teams.
- A maintained auth provider/library over a hand-rolled one, always.
