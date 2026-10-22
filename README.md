# claude-skills

[Agent Skills](https://agentskills.io) for Claude. Each one is a folder under
`skills/`, with a `SKILL.md` and a README of its own.

| Skill | What it does |
| --- | --- |
| [catch-me-up](skills/catch-me-up/) | Catches you up in a skimmable format: an emoji checklist and a numbered "Need from you" list first, then the details. Modes: `now` (short), `waiting`, `since <time>` and `on everything` |

## Install a skill

For Claude Code, clone the repo and copy the skill folder into your personal
skills directory:

```bash
git clone https://github.com/rtompkins17/claude-skills.git
```

```bash
mkdir -p ~/.claude/skills && cp -R claude-skills/skills/catch-me-up ~/.claude/skills/
```

Each skill's README also covers installing it for a single project, inside a
plugin, or in the Claude apps.

## License

MIT. See [LICENSE](LICENSE).
