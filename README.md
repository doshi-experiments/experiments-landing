# Experiments

A direct directory of Rishabh Doshi’s calculators, interactive visualizations, and Mr. Shake. All three projects are accessible immediately; native disclosures reveal calculator and visualization subpages.

`index.html` contains the real project content, so the directory works without JavaScript. Add a project section with a name, one short description, and a literal action. Add subpages inside a native `details` disclosure when needed. Empty categories are not advertised.

## Shared identity

Navigation, the labeled System/Light/Dark appearance control, Host Grotesk, the Felt palette and texture, and controls come from `@doshi-experiments/design-system` (release 0.10.1), installed from the committed release tarball. The page is styled with Tailwind CSS v4 and Felt's utilities, written in `index.html`: `raised` and `pressed` surfaces, `text-ink-secondary`, `border-line`, `text-link`. `src/site.css` imports Tailwind, Felt's theme and, for the shared header, `components.css`. Links and the subpage disclosures use the design system's link red (`text-link`), never the signal fill, which is too light to read as text. Project dividers are stitched. Upgrade through the design system's central rollout command, which replaces the tarball and lockfile entry.

The `sheet-theme` preference uses a `.rishabhdoshi.com` cookie across public sites and localStorage as a fallback. The shared prepaint script applies it before styles paint: the design system's Vite plugin inlines it straight after `<meta charset>`. Existing `#E-01`, `#E-03`, and `#E-04` links continue to locate their projects.

## Preview and deploy

`npm ci`, then `npm run dev` for a live preview or `npm run build` to write `dist/` (`npm run preview` serves it). Node 22 (`.node-version`).

Cloudflare Workers Builds deploys pushes to `main`: the build command is `npm run build`, and `wrangler.jsonc` declares `dist/` as the asset directory.

## Licence

MIT, see [LICENSE](LICENSE). The exception: the Host Grotesk font files, which the build copies from the design-system tarball, are under the SIL Open Font License 1.1 (shipped as `fonts/host-grotesk-OFL.txt`).
