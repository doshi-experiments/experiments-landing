# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

The experiments index at experiments.rishabhdoshi.com: one static page in `public/` listing the calculators, the visualizations and Mr. Shake. No build step; Cloudflare deploys `public/` on push to `main`. Author commits as `doshi-experiments <311927837+doshi-experiments@users.noreply.github.com>`.

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
