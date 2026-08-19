# experiments-landing

The experiments wing of [rishabhdoshi.com](https://rishabhdoshi.com) — an index
of the things I've built, grouped by discipline.

Live at **experiments.rishabhdoshi.com**.

Vanilla HTML, CSS and JS. Styled with
[Feltwork](https://github.com/doshi-experiments/feltwork), the shared design
system — "Dieter Rams meets plushie."

## Build

This site used to have no build step, and `public/` was uploaded as-is. It has
one now for exactly one reason: so the Feltwork tokens are authored once, in
one repo, instead of being copy-pasted into four and drifting apart.

The **output is still a single self-contained HTML file** plus its fonts and
one texture — no runtime dependency, no framework, no bundler.

```
npm install
npm run build      # src/index.html -> dist/
npm run serve      # http://localhost:8099
```

`feltwork build --mode inline` writes the CSS and the SVG filter defs into the
HTML and replaces the `<!--iso:name-->` markers with the real icons.

> The icons have to be **inlined**. An SVG behind `<img src>` is an isolated
> document, cannot see the host page's custom properties, and renders solid
> black.

## Adding a project

Everything is rendered from the `MODULES` array near the top of the `<script>`
block in `src/index.html`. Adding a project is adding one object — there is
nothing else to touch. The live count derives from the array, so it cannot
fall out of sync.

```js
{
  code  : '01.2',
  name  : 'Mortgage Stress Test',
  status: 'live',                      // 'live' | 'wip' | 'planned'
  url   : 'https://example.workers.dev',
  blurb : 'What it does and why it exists.'
}
```

A whole new discipline is a module:

```js
{
  code : '05', name: 'Writing',
  hue  : 'oxford',                     // see below
  icon : 'robot',                      // rocket | robot | cash | laptop
  blurb: 'One line on what belongs here.',
  items: []                            // empty renders as an invitation
}
```

### About `hue`

Feltwork §2 gives each hue one permanent meaning — canary shipped, oxford
written, eucalyptus work, blush the workshop. Those are *portfolio* categories,
and by them every discipline on this page is "the workshop", because this whole
site is the workshop. So the four ramps are rebound here to the four
disciplines, and **that binding is local to this page**. The portfolio still
uses the §2 meanings.

| | |
|---|---|
| eucalyptus | Calculators |
| blush | Tools |
| oxford | Visualizations |
| canary | Games |

Status is never carried by hue — hue already means the discipline here. A live
item is shown by a filled dot plus the word, so the two states never differ by
colour alone.

## Deploy

Deployed as a **Worker serving static assets** on push to `main`.
`wrangler.jsonc` declares `dist/` as the asset directory.

If deployed via **Pages** instead:

| Setting | Value |
| --- | --- |
| Framework preset | None |
| Build command | `npm run build` |
| Build output directory | `dist` |

## Notes

- Each section deep-links: `/#01` lands with that section already open, and
  opening one updates the URL so it stays shareable.
- Collapsed panels get `inert`, so their links aren't keyboard-reachable while
  hidden.
- `<noscript>` carries direct links to every live project.
- The light/dark choice rides a `sheet-theme` cookie scoped to
  `.rishabhdoshi.com`, so it follows the visitor across the portfolio, this
  index and the apps. Feltwork's dark theme flips the ground only — the felt
  surfaces are unchanged, so every text-on-felt contrast ratio is identical in
  both themes.
- Respects `prefers-reduced-motion`.
