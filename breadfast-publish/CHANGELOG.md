# Changelog — breadfast-publish

## V1.0 — 2026-11-22
- First release in the breadfast-skills package.
- SKILL.md: deploy a prototype to Breadfast's prototype hosting (publish.apps.breadfast.com) — build, zip the static output with index.html at the root, create a new site or upload a new release.
- `scripts/deploy.sh`, `scripts/package.sh`, `scripts/save-cookie.sh`. The login cookie is stored privately in `~/.config/breadfast-publish/cookie` and is never part of this repo.
