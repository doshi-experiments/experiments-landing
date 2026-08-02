# experiments-landing

The experiments wing of [rishabhdoshi.com](https://rishabhdoshi.com) — an index
sheet listing the things I've built, grouped by discipline.

Live at **experiments.rishabhdoshi.com**. Companion to
[portfolio-landing](https://github.com/doshi-experiments/portfolio-landing)
(Sheet A-001); this is Sheet A-002.

Vanilla HTML, CSS and JS in a single `public/index.html`. No build step, no
dependencies, no framework.

## Adding a project

Everything on the page is rendered from the `MODULES` array near the top of the
`<script>` block in `public/index.html`. Adding a project is adding one object — there
is nothing else to touch. Counts, the title block and the "N drawings" labels
all derive from this array, so they can't fall out of sync.

To add a project to an existing module, push a drawing onto its `drawings` array:

```js
{
  code  : 'E-01.2',                    // sheet number, your own convention
  name  : 'Mortgage Stress Test',
  status: 'live',                      // 'live' | 'wip' | 'planned'
  url   : 'https://example.workers.dev',
  blurb : 'What it does and why it exists.'
}
```

To add a whole new discipline, add a module:

```js
{
  code : 'E-04',
  name : 'Writing',
  blurb: 'One line on what belongs on this sheet.',
  drawings: []                         // empty renders as "Not yet issued"
}
```

A module with an empty `drawings` array shows as a reserved sheet. Delete any
you don't want to advertise.

## Deploy

Connected to Cloudflare and deployed on push to `main` — usually live in about
a minute.

Deployed as a **Worker serving static assets**. `wrangler.jsonc` declares
`public/` as the asset directory, so Cloudflare needs no dashboard build
configuration — leave the build command empty.

If deployed via **Pages** instead, the equivalent settings are:

| Setting | Value |
| --- | --- |
| Framework preset | None |
| Build command | *(empty)* |
| Build output directory | `public` |

## Notes

- Each module deep-links: `experiments.rishabhdoshi.com/#E-01` lands with that
  sheet already open, and opening a sheet updates the URL so it stays shareable.
- Collapsed panels get the `inert` attribute, so their links aren't reachable by
  keyboard while hidden.
- `<noscript>` carries direct links to every live project, so the drawings stay
  reachable even if the index can't draw itself.
- Respects `prefers-reduced-motion`.
