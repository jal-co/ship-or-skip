# AGENTS.md

Guidance for AI coding agents (Claude Code, Cursor, Copilot, etc.) working in this repository.

## Repository Overview

A collection of [Agent Skills](https://agentskills.io) for **deciding what to build** — honest idea critique, competitor research, positioning, and naming. Skills are packaged instructions and scripts that extend agent capabilities. Structure and conventions follow [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills).

## Creating a New Skill

### Directory Structure

```
skills/
  {skill-name}/           # kebab-case directory name (must match SKILL.md `name`)
    SKILL.md              # Required: skill definition
    references/           # Optional: supporting docs loaded on demand
    assets/               # Optional: templates, schemas, static resources
    scripts/              # Optional: executable scripts
      {script-name}.sh    # Bash scripts
```

### Naming Conventions

- **Skill directory**: `kebab-case` (e.g., `ship-or-skip`), matching the `name` in `SKILL.md`
- **SKILL.md**: always uppercase, always this exact filename
- **Scripts**: `kebab-case.sh` (e.g., `check-domain.sh`)

### SKILL.md Format

Follow the [Agent Skills specification](https://agentskills.io/specification). Frontmatter requires `name` and `description`; `metadata` and others are optional.

```markdown
---
name: {skill-name}
description: {What it does AND when to use it, with trigger phrases.}
license: MIT
metadata:
  author: jal-co
  version: "1.0.0"
---

# {Skill Title}

{Brief description.}

## Modules / How It Works
## Workflow
## Edge cases
```

### Best Practices for Context Efficiency

Only the skill `name` and `description` load at startup; the full `SKILL.md` loads when the agent activates the skill. To minimize context:

- **Keep SKILL.md under 500 lines** — push detail into `references/`
- **Write specific descriptions** — so the agent knows exactly when to activate
- **Use progressive disclosure** — reference supporting files read only when needed
- **Prefer scripts over inline code** — execution doesn't consume context, only output does
- **File references work one level deep** — link directly from `SKILL.md`

### Script Requirements

- Bash scripts: use `#!/usr/bin/env bash` and `set -euo pipefail`
- Write status/diagnostic messages to stderr; machine-readable output to stdout
- Include a cleanup trap for temp files when scripts create them
- Reference scripts by relative path, e.g. `scripts/check-domain.sh`
- Scripts must be best-effort and degrade gracefully when a tool is missing

### Registering the Skill

Add the skill slug to a grouping in `skills.sh.json` so it appears correctly on skills.sh.

### End-User Installation

Document skills.sh installation for public skills:

```bash
npx skills add jal-co/ship-or-skip --skill {skill-name}
```

**Manual (Claude Code):**
```bash
cp -r skills/{skill-name} ~/.claude/skills/
```

If a skill requires network access, instruct users to enable required domains in their agent's settings.
