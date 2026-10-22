# catch-me-up

An [Agent Skill](https://agentskills.io) that changes how Claude answers "catch
me up" or "what's the status?". You get a format you can read at a glance:

- **A skim block first.** One bold line per thread, then an emoji checklist in plain words:
  ✅ done, 🔄 in progress, ⏳ queued, ⛔ blocked or waiting on you.
- **Need from you.** A numbered list of only the asks that block progress.
- **Specifics, below a divider.** A table of unmerged branches with what each
  one needs, the list of what is still to build, and anything to copy and
  paste, in code blocks.

It covers the current session by default. Words after the command change
what you get (see Use below), such as `now` for the short version or `on
everything` for every session and project.

It is useful when you run several agent sessions, branches or projects at once
and need to see what needs you without reading paragraphs.

## Install

### Claude Code, all your projects

Clone the repo and copy the folder into your personal skills directory:

```bash
git clone https://github.com/rtompkins17/claude-skills.git
```

```bash
mkdir -p ~/.claude/skills && cp -R claude-skills/skills/catch-me-up ~/.claude/skills/
```

### Claude Code, one project

Put the folder at `.claude/skills/catch-me-up/` in the repository and commit
it, so everyone working in that repo gets it.

### Inside a plugin

Put the folder at `<your-plugin>/skills/catch-me-up/`. The skill is then
invoked as `/<your-plugin>:catch-me-up`.

### Claude apps

Upload it from Claude on the web or in the desktop app:

1. Turn on **Code execution and file creation** in Settings → Capabilities.
   Skills need it.
2. Zip the folder so that `catch-me-up/` is at the top of the zip:

   ```bash
   cd claude-skills/skills && zip -r catch-me-up.zip catch-me-up
   ```

3. Go to **Customize → Skills**, click **+**, then **Create skill → Upload a
   skill**, and pick the zip.
4. Turn the skill on with its toggle.

Menu names change from time to time. If these don't match, see
[Using Skills in Claude](https://support.claude.com/en/articles/12512180-using-skills-in-claude).

## Use

In Claude Code, type `/catch-me-up`, optionally followed by one of these:

| Add | You get |
| --- | --- |
| nothing | The full update for this session: checklist, asks, then specifics |
| `now` (or `quick`, `short`, `tldr`) | Just the checklist and one line of asks, with only fast checks |
| `waiting` | Only what is waiting on you |
| `since <time>` | Only what changed, for example `since this morning` |
| `project` (or `this project`, `repo`) | Every session and branch in the project you're in |
| `on everything` (or `all`, `overall`) | Every session and project |

They combine: `/catch-me-up now on everything` gives one line per project, and
`/catch-me-up waiting project` gives only what this project needs from you.

Or ask in your own words, in any Claude app: "catch me up", "quick status",
"what's waiting on me?", "what changed since yesterday?", "catch me up on this
project" or "catch me up on everything". Claude loads the skill when the
request matches.

How much "project" and "everything" can see depends on where Claude runs. An app that lets
Claude list your other sessions gives the fullest picture. Otherwise it checks
the projects and repositories it can reach, and says what it couldn't see.

## Customize

Everything lives in `SKILL.md`. Common changes:

- Rename the Specifics table columns, for example `Ticket` in place of `Branch`.
- Change the emoji legend. Keep it short so the checklist stays readable.
- Change the example to match your own work, so Claude copies the right tone.
