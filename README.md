# claude-skills

[Agent Skills](https://agentskills.io) for Claude, packaged as a Claude Code
plugin marketplace. Each skill is a folder under `skills/`, with a `SKILL.md`
and a README of its own.

| Skill | What it does |
| --- | --- |
| [catch-me-up](skills/catch-me-up/) | Catches you up in a skimmable format: an emoji checklist and a numbered "Need from you" list first, then the details. Modes: `now` (short), `waiting`, `since <time>`, `project` and `on everything` |

## Install

In Claude Code, run this in a session (Claude Code 2.1.275 or later):

```
/plugin install catch-me-up --marketplace rtompkins17/claude-skills
```

In the Claude apps, go to **Customize → Plugins → Add → Add marketplace** and
enter `rtompkins17/claude-skills`.

For Cursor, Codex and other tools that read Agent Skills:

```bash
npx skills add rtompkins17/claude-skills
```

The [catch-me-up README](skills/catch-me-up/README.md) covers every install
option, including copying the folder by hand and uploading it to the Claude
apps as a skill.

## Tests

`evals/` holds a test suite for
[`claude plugin eval`](https://code.claude.com/docs/en/plugin-evals.md)
(Claude Code 2.1.269 or later). Five cases check that the skill loads for
status questions and that the reply keeps its shape. Three check that it
stays out of unrelated questions. The status cases build a small example git
repository first, so they need `--scaffold` and the shell, which runs inside the test sandbox:

```bash
claude plugin eval . --scaffold --allow-tools Bash --ablation none --runs 2 --no-publish --max-cost-usd 5
```

Every run is a real model call and counts against your plan or API bill.

## Changes

See [CHANGELOG.md](CHANGELOG.md).

## License

MIT. See [LICENSE](LICENSE).
