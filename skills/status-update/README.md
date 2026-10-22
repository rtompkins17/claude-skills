# status-update

An [Agent Skill](https://agentskills.io) that changes how Claude answers "what's
the status?". You get a format you can read at a glance:

- **A skim block first.** One bold line per thread, then an emoji checklist in plain words:
  ✅ done, 🔄 in progress, ⏳ queued, ⛔ blocked or waiting on you.
- **Need from you.** A numbered list of only the asks that block progress.
- **Specifics, below a divider.** A table of unmerged branches with what each
  one needs, the list of what is still to build, and anything to copy and
  paste, in code blocks.

It is useful when you run several agent sessions, branches or projects at once
and need to see what needs you without reading paragraphs.

## Install

### Claude Code, all your projects

Clone the repo and copy the folder into your personal skills directory:

```bash
git clone https://github.com/rtompkins17/claude-skills.git
```

```bash
mkdir -p ~/.claude/skills && cp -R claude-skills/skills/status-update ~/.claude/skills/
```

### Claude Code, one project

Put the folder at `.claude/skills/status-update/` in the repository and commit
it, so everyone working in that repo gets it.

### Inside a plugin

Put the folder at `<your-plugin>/skills/status-update/`. The skill is then
invoked as `/<your-plugin>:status-update`.

### Claude apps

Upload it from Claude on the web or in the desktop app:

1. Turn on **Code execution and file creation** in Settings → Capabilities.
   Skills need it.
2. Zip the folder so that `status-update/` is at the top of the zip:

   ```bash
   cd claude-skills/skills && zip -r status-update.zip status-update
   ```

3. Go to **Customize → Skills**, click **+**, then **Create skill → Upload a
   skill**, and pick the zip.
4. Turn the skill on with its toggle.

Menu names change from time to time. If these don't match, see
[Using Skills in Claude](https://support.claude.com/en/articles/12512180-using-skills-in-claude).

## Use

Ask in your own words: "what's the status?", "what's left?", "what do you need
from me?", "what still needs merging?", or "I can't keep track of my
sessions". Claude loads the skill when the request matches. In Claude Code you
can also run `/status-update` directly.

## Customize

Everything lives in `SKILL.md`. Common changes:

- Rename the Specifics table columns, for example `Ticket` in place of `Branch`.
- Change the emoji legend. Keep it short so the checklist stays readable.
- Change the example to match your own work, so Claude copies the right tone.
