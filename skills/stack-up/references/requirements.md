# Requirements gathering

Ask only what you can't reasonably infer. Lead with the highest-leverage gaps, a few at a time. Never dump all of these at once.

## The questions that actually move a stack choice

1. **What is it?** The app in one line — web app, API, CLI, mobile, data pipeline, etc.
2. **Team & skills.** Solo or team? What language(s) is the team strongest in? This often dominates the answer.
3. **Timeline.** Weekend prototype, MVP in weeks, or a system meant to last years? Time-to-first-ship vs long-term fit.
4. **Scale (honest).** Expected users/requests at launch and in ~12 months. Most projects are smaller than they think — don't over-build.
5. **Hard requirements.** Anything non-negotiable: realtime, offline-first, heavy SEO, mobile native, low latency, large file handling, ML inference.
6. **Compliance / data.** PII, payments, healthcare, residency rules — these can force specific hosting/data choices.
7. **Budget & ops appetite.** Free-tier hobby, lean startup, or funded? How much infra are they willing to operate themselves?
8. **Existing constraints.** Any current codebase, mandated cloud, company standards, or tools they must integrate with.

## How to use the answers

- **Team skill + timeline** usually set the language/framework. Don't fight them without a strong reason.
- **Scale + hard requirements** decide the data layer and whether anything exotic is justified.
- **Budget + ops appetite** decide hosting and how managed the stack should be.
- **Compliance** can override everything — surface it early.

If the user can't answer scale, assume small and design for the cheapest credible path to launch, with a noted point where they'd revisit.
