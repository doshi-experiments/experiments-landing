# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

The experiments index at experiments.rishabhdoshi.com: one static page in `public/` listing the calculators, the visualizations and Mr. Shake. No build step; Cloudflare deploys `public/` on push to `main`. Author commits as `doshi-experiments <311927837+doshi-experiments@users.noreply.github.com>`.

## Never publish PII or sensitive information

Nothing personal or sensitive goes to GitHub, under any circumstances, without Rishabh's direct approval of that specific content. That covers commits, branches, pull requests, issues, comments, release notes, screenshots and test fixtures, and it applies even when the repository is private.

- Personal data: names other than Rishabh's public name, email addresses, phone numbers, home addresses, dates of birth.
- Financial data: account or card numbers, balances, real transactions, statements, payees, anything from bank exports or Actual Budget.
- Secrets and infrastructure: `.env` contents, API keys, tokens, passwords, private hostnames and IP addresses, Tailscale names.
- Anything copied from a real export, inbox, database or log.

Use synthetic fixtures instead. Before every commit and push, check the staged diff and any new untracked files for this kind of content. If something looks sensitive, or you are unsure, stop and ask; do not commit it, push it or open a pull request with it. Earlier approval of a different change does not cover this one.

## Commands

```sh
python3 -m http.server 8080 --directory public
```

CI re-verifies the hashes in `public/design-system/release.json`. The design-system repository's `scripts/check-index.mjs` covers this page in a browser (direct projects, legacy anchors, keyboard disclosures, overflow).

## Structure

- `public/index.html` holds the real content, so the page works without JavaScript. `public/index-components.css` holds the page's own styles over the shared tokens.
- `public/design-system/` is a generated snapshot of `@doshi-experiments/design-system`. Never edit it; upgrade through that repository's central `npm run rollout`.

## Rules

- Each project gets a name, the fixed short description from the design system's `docs/identity.md`, and a literal action ("Open calculator"). Subpages go in a native `<details>` disclosure. Never advertise empty categories.
- Keep the old `#E-01`, `#E-03` and `#E-04` anchors working.
- Links and disclosure text use `--ds-action-link`; the signal (`--ds-action-gradient` / `--ds-action-primary`) is a fill, never text.
- `public/design-system/prepaint.js` must load synchronously in `<head>` before styles. Keep the shared `sheet-theme` cookie scoped to `.rishabhdoshi.com`.
- Projects open in the same tab.
