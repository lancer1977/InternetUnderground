# AGENTS.md

## Repo purpose

Dev-Forge is the standards repository for developer-oriented workflow, agent tooling, skill templates, and repo-shape governance in the OpenClaw ecosystem.

## Stack

- Markdown/docs-first repository with Bash scripts, Python tooling, and a small C#/.NET ops-dashboard subtree.
- GitHub CLI, Git workflows, and Docker-based local tool deployment surfaces are part of the repo ecosystem.

## Important paths

- `README.md` — canonical repo framing and owner-facing quick start.
- `repo-state.md` — current durable state mirror.
- `docs/` — conventions, workflows, and execution model.
- `templates/` — reusable templates used by downstream repos.
- `tools/` and `scripts/` — operational and repo-shaping automation.
- `.github/` — workflow and GitHub metadata.

## Common commands

- Restore/install: `unknown`
- Build: `unknown`
- Test: `unknown`
- Lint/format: `unknown`
- Run locally: `unknown`

## Validation expectations

- Run issue-scoped validation and report commands with outcomes.
- For instruction doc work, verify files exist and required headings are present.
- For automation or workflow work, run the smallest meaningful command set and capture failures/output.
- Report: files changed, validation run, risks, unresolved questions.

## Coding conventions

- Keep edits focused and reviewable.
- Prefer small, explicit, issue-scoped changes.
- Preserve existing patterns unless there is a strong reason to change them.
- Do not invent commands or assumptions about runtime behavior.

## Agent boundaries

- Do not edit secrets, production credentials, callback/auth URLs, or deployment infra without explicit approval.
- Avoid broad repository refactors from narrow issue tickets.
- Do not alter `.env` values or secret material.
- Do not invent commands or add command claims not confirmed by repo artifacts.
- Do not rewrite shared history unless explicitly asked.

## Context strategy

- Read `README.md`, `docs/`, and relevant issue body first.
- Prefer repo-local docs over guessing.
- If a stack question is unclear, inspect a representative sample file before broad edits.
- Keep one issue packet per action.

## Task packet expectations

- Return a concise summary with changed files, commands run, risks, unresolved questions, and next recommended task.
