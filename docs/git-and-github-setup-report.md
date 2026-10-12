# Git & GitHub Setup — Delivery Report

## What was set up

- **Local repo**: initialized with `git init`, default branch renamed to `main`.
- **`.gitignore`**: excludes `graphify-out/` (generated knowledge-graph output) and Claude Code artifacts (`.claude/`, `CLAUDE.md`) so neither is ever committed.
- **Commit authorship**: every commit is authored solely as `Sley HORTES <sleyhortes13@gmail.com>` — no co-author trailers.
- **Remote**: created `HSley13/my-team` on GitHub (public) via `gh repo create`, added as `origin`, pushed with `-u` so `main` tracks `origin/main`.
- **Branch workflow**: feature work happens on a short-lived branch, gets merged into `main`, then pushed — not committed straight to `main`.

## Repo layout committed

- Team charter and persona files (`AGENTS.md`, `leader.md`, `member.md`).
- OpenCode launcher config and `.cmd` launch scripts (`opencode.json`, `leader.cmd`, `member.cmd`).
- `workspace/inbox/`, `workspace/outbox/`, `workspace/shared/` scaffolding and their README files.
- `workspace/shared/activities.json` and `campus-picker.html` (shared source material).
- The BMI calculator task note, script, and handoff notes in `workspace/inbox/` and `workspace/outbox/`.

## Not committed (by design)

- `graphify-out/` — regenerated locally by `/graphify`, not source.
- Any Claude Code session/config files.
