---
name: catch-me-up
description: "Skimmable status: emoji checklist, then 'Need from you'. Use for catch me up, status, what's left or next, what's waiting on me, what changed. Modes: now, waiting, since, on everything."
license: MIT
---

# Catch me up

The reader runs many threads at once and triages by skimming. Give them the
state in a few seconds, then the detail below a divider for when they want it.
In every mode, start with the content: no intro sentence, and no closing recap
or offer.

## Modes

Read the words after the command, or in the request itself. With none of these
words, give the full update for the current session.

| Words | Mode |
| --- | --- |
| `now`, `quick`, `short`, `tldr` | **Now:** the checklist and one-line asks only |
| `waiting` | **Waiting:** only what is waiting on the user |
| `since <time>` | **Since:** only what changed since then |
| `on everything`, `all`, `overall` | **Everything:** every session and project |

Modes combine. For example, `now on everything` gives one line per project,
and `waiting on everything` gives every ask from every thread. Each mode has
its own section below.

## Before you write: verify

Report checked state, never memory alone. Now mode runs a lighter version.

- Branches: fetch, then list unmerged work against the default branch
  (`git branch -a --no-merged main`, `git log main..<branch> --oneline`).
- Deploys, CI, pull requests, tickets: check them with the tools the project
  uses (for example `gh pr list`, `gh run list`, the hosting provider's CLI).
- Notes, task lists and memory are leads to confirm, not facts.
- If you can't check something, label it "not verified". If you can only see
  your own thread, say so.

## The full shape

```markdown
**<Thread or topic>**

✅ <done, in plain words>
🔄 <in progress or up next>
⏳ <queued for later>
⛔ <blocked, or waiting on the user>

**Need from you**
1. <the most blocking ask, in one sentence>
2. <the next ask>

---

**Specifics**

| Branch | What it does | Needs |
| --- | --- | --- |
| `<branch>` | <one line> | <test, review, merge or a decision> |

Still to build:
1. <next item>
2. <later item>

Good to know: <one-line rule or gotcha>
```

### 1. Skim block

- One bold line naming the thread or topic.
- One line per item. Plain words: no branch names, file paths, ids or jargon.
  Say what the user would notice ("Sign-in works again"), not how it was done.
- Group items in legend order, so the blocked items sit just above the asks.

| Emoji | Means |
| --- | --- |
| ✅ | Done: shipped, merged or verified |
| 🔄 | In progress, or next up |
| ⏳ | Queued for later |
| ⛔ | Blocked, or waiting on the user |

Only use ✅ for work that is done and verified. Built but untested is 🔄, and
the line says what it is waiting on ("built, waiting on your phone test").

### 2. Need from you

- A numbered list of only the asks that block progress, most blocking first.
- One sentence each, saying exactly what to do.
- Optional or FYI items go after the list, or get dropped.
- If nothing blocks, write `**Need from you:** nothing right now.`

### 3. Specifics

After a `---` divider, include whichever of these apply and skip the rest:

- A table of built but unmerged work: branch, what it does, what it needs.
- A numbered list of what is still to build, in order.
- One-line rules the user should know, such as a gotcha in how a tool works.
- Text the user will copy and paste. See the style rules.

## Style rules

- Keep the skim block (bold line, checklist and asks) under about 12 lines.
- Minimal prose: no paragraphs, and no story of how the work got done.
- Say plainly what is not done or not verified.
- Anything the user will paste (a prompt for another agent, a reply to send,
  store or release notes) goes in a fenced code block, one block per
  destination, under a one-line label saying where it goes. Keep markdown
  styling out of the block unless the destination renders it.
- Several threads: one bold line and checklist per thread, then one combined
  **Need from you** list in priority order (name the thread when it isn't
  obvious), then a single Specifics section.

## Now mode

Fast to make and fast to read.

- Run only quick checks: local branches and status, plus what this session
  already knows. Skip deploy, CI and pull request lookups. Anything you didn't
  check can't be ✅.
- Write the bold line, then the checklist in short `<thing>: <state>` lines,
  then the asks on one line, a few words each.
- No divider, no Specifics and no FYI lines. If nothing is waiting on the user,
  write `**Waiting on you:** nothing`.

```markdown
**<Thread or topic>**

✅ <thing>: <state>
🔄 <thing>: <state>
⛔ <thing>: <what it needs from the user>

**Waiting on you:** 1. <ask> · 2. <ask>
```

With everything mode, write one line per thread, then the quiet ones:

```markdown
**<Thread>** ✅ 2 🔄 2 ⛔ 1 · waiting on you: <ask>, <ask>
**<Thread>** ✅ 3 · nothing needed
**Quiet:** <thread>, <thread>
```

## Waiting mode

- Give only the numbered **Need from you** list, most blocking first. Leave out
  the checklist and the Specifics.
- Across several threads, start each ask with the thread name in bold.
- If an ask needs text to paste, put its code block under the list.
- If nothing is waiting, write `Nothing is waiting on you.`

## Since mode

- Report only what changed after the time given, such as "this morning",
  "yesterday" or "Friday". If the time is missing or unclear, use the last
  catch-up in this session, or else the last 24 hours, and say which you used.
- Check what happened after that time: commits, merges, deploys and session
  activity.
- Use the full shape with only the changed items. Put everything else on one
  line: `Unchanged: <thing>, <thing>`.

## Everything mode

Gather before you write:

- **Sessions:** if your tools can list or read other sessions (some apps give
  Claude a sessions list or shared notes), check each one's latest state.
- **Projects:** for each repository you can reach, check unmerged branches,
  uncommitted changes, recent commits and open pull requests.
- **Notes:** task lists, notes and memory across projects are leads to
  confirm, not facts.
- **Gaps:** name what you couldn't see in one line, such as "Couldn't see
  sessions outside this app."

Then write:

- One bold line and checklist per thread or project, with the ones that need
  the user first. Keep each to its three to five most important lines.
- Put threads with nothing new on one line: `Quiet: <thread>, <thread>`.
- One combined **Need from you** list, naming the thread in each ask.
- One Specifics section. Add a Project column to the branch table.

## Example

A fictional habit-tracker app with one feature live, two branches waiting on
a phone test, one item blocked on the user, and a build list:

````markdown
**Habit tracker: 1.4 release**

✅ Dark mode is live for everyone
🔄 Offline check-ins are built, waiting on your phone test
🔄 The sign-in loop fix is built, waiting on your phone test
⏳ Push reminders come after 1.4 ships
⛔ The weather widget is waiting on an account key from you

**Need from you**
1. Test offline check-ins and the sign-in fix on your phone (steps in the table below).
2. Add the weather service key to the hosting settings, then tell me.

FYI: the release notes are drafted and ready to paste.

---

**Specifics**

| Branch | What it does | Needs |
| --- | --- | --- |
| `feature/offline-checkins` | Saves check-ins with no signal and syncs them later | Phone test: airplane mode on, check in, reconnect |
| `fix/sign-in-loop` | Stops the sign-in screen reopening after sign-in | Phone test: sign out, then sign back in |

Still to build:
1. Push reminders
2. Weather widget, once the key is in
3. Weekly summary email

Good to know: new hosting settings only take effect on the next deploy, so I'll redeploy once the key is in.

Release notes, for the app store listing:

```
Check in without a signal: your habits sync when you're back online.
Fixed a sign-in loop some people hit after updating.
```
````

The same update in now mode:

```markdown
**Habit tracker: 1.4 release**

✅ Dark mode: live
🔄 Offline check-ins: built, needs your phone test
🔄 Sign-in fix: built, needs your phone test
⏳ Push reminders: after 1.4
⛔ Weather widget: needs your key

**Waiting on you:** 1. Phone test both fixes · 2. Add the weather key
```
