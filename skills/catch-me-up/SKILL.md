---
name: catch-me-up
description: "Skimmable status: an emoji checklist and numbered 'Need from you', then specifics. Use for catch me up, status, what's left or next, what's needed. 'On everything' covers all sessions and projects."
license: MIT
---

# Catch me up

The reader runs many threads at once and triages by skimming. Give them the
state in a few seconds, then the detail below a divider for when they want it.

## Scope: this thread, or everything

- **Default:** the current session or thread.
- **Everything:** when the request says "everything", "all", "overall" or
  "every session" (for example `/catch-me-up on everything`), cover every
  session, project and repository you can reach. See "Everything mode" below.

## Before you write: verify

Report checked state, never memory alone.

- Branches: fetch, then list unmerged work against the default branch
  (`git branch -a --no-merged main`, `git log main..<branch> --oneline`).
- Deploys, CI, pull requests, tickets: check them with the tools the project
  uses (for example `gh pr list`, `gh run list`, the hosting provider's CLI).
- Notes, task lists and memory are leads to confirm, not facts.
- If you can't check something, label it "not verified". If you can only see
  your own thread, say so.

## The shape

Start with the bold line: no intro sentence, and no closing recap or offer.

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
