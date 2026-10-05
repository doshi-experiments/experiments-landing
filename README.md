# Experiments

A direct directory of Rishabh Doshi’s calculators, interactive visualizations, and Mr. Shake. All three projects are accessible immediately; native disclosures reveal calculator and visualization subpages.

`public/index.html` contains the real project content, so the directory works without JavaScript. Add a project section with a name, one short description, and a literal action. Add subpages inside a native `details` disclosure when needed. Empty categories are not advertised.

## Shared identity

Navigation, the labeled System/Light/Dark appearance control, Commissioner, colors, and controls come from `@doshi-experiments/design-system`. Change the source package and run its central rollout command to refresh `public/design-system/`. The generated `release.json` records version and file hashes.

The `sheet-theme` preference uses a `.rishabhdoshi.com` cookie across public sites and localStorage as a fallback. The shared prepaint script applies it before styles paint. Existing `#E-01`, `#E-03`, and `#E-04` links continue to locate their projects.

## Preview and deploy

Serve `public/` with a local HTTP server, for example `python3 -m http.server 8080 --directory public`.

Cloudflare deploys pushes to `main`. `wrangler.jsonc` declares `public/` as the asset directory. The site has no build step.
