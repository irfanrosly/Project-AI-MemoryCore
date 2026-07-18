---
jira_keys: ["WEBSITE"]
local_path: ~/IR/sb-custom-blocks
origin_url: (check git remote)
default_branch: main
status: active
last_active: 2026-07-16
---

# sb-custom-blocks

pnpm + Turborepo monorepo of SiteBuilder federated blocks.

## Irfan's focus
`projects/xsolla-com/` — 16 blocks for xsolla.com site.

## Git flow
- Branch: `TICKET-ID__short-description`
- Commit: `[TICKET-ID] Description`
- MR target: `main`
- Unstable release: `X.Y.Z-website-NNNN.N`

## Key docs (read before working)
- `CLAUDE.md` — commands, architecture, naming
- `QODO.MD` — top review failures checklist
- `docs/BLOCK-ANATOMY.md` — four required files per block
- `docs/GITFLOW.md` — release and branch conventions

## WEBSITE-4609 — feedback-form block (branch: WEBSITE-4609__Form-block)
**Status (2026-06-10):** Figma alignment fixes done, lint clean, not yet committed.

Completed work across multiple sessions:
- Initial block: block.tsx, settings.tsx, schema.ts, block.css.ts, translations
- API: plain POST (not Discord webhook), `apiUrl` field, no mock API
- Post-submit: `window.open(downloadUrl)` on success
- Form height preserved during success via `visibility: hidden` + absolute overlay pattern
- Security: ReDoS fix (removed custom regex), `crypto.randomUUID()` replaces `Math.random()`
- Figma alignment fixes (6 discrepancies corrected): nameRow breakpoint, button width, consent gap, consent label color, consentRow gap, Message textarea in defaultData

## WEBSITE-4659 — blog-hero block (branch: WEBSITE-4659__Blog-hero)
**Status (2026-06-22):** Built, lint+prettier clean, client+SSR build green. Not committed.

Block: `projects/xsolla-com/blog-hero/` — article hero from Figma `h3iJsMmeVtDvD6e47MwLpe`. 1440 desktop only.
- Hero: tags chips → title → description → meta (date·readtime). Each section own show/hide toggle (showTags/showDescription/showMeta).
- Section 1 "Related blogs" (Figma `3006:14374`): 756/376 two-col, featured tile + 2 popular cards, fully editable (image/url/text/tags), gated showRelated.
- Section 2 "Article banner" (Figma `3006:14739`): 1022px banner image + dynamic editor-configurable social-share rail (X/FB/LinkedIn/Reddit/copy via schema array, SHARE_REGISTRY), gated showBanner. Top spacer removed per request.
- Part 5 description (Figma `3006:14281`): Pilat Book 18px paragraph under title, showDescription toggle default true.

Gotchas learned:
- New localizedValueRef field added to existing block instances → stored data lacks ref → `TextEditor id={undefined}` crashes "reading texts". Fix: render guard `show && ref &&` in block.tsx + seed via localizedValue in settings toggle onChange when ref missing. defaultData only seeds fresh instances.

## steps block — label toggle + light/dark theme (branch: xsolla-com-main)
**Status (2026-07-02):** Both features done, build green (client+SSR), Figma colors cross-checked. Not committed.

Block: `projects/xsolla-com/steps/`. Two features:
- **showStepLabel** toggle (schema bool default true): hide "Step N" label. Card must NOT grow when hidden — shift up instead.
- **theme** light/dark (schema enum default 'light'): replaced local hardcoded dark `palette` with shared `@xsolla-com/common/theme` `vars`; root className swaps `lightTheme`/`darkTheme`. Migration: existing live blocks (no stored theme) flip dark→light via `?? 'light'` — flag to QA.

Gotchas learned:
- **Vanilla Extract CSS source order = tiebreaker.** Equal-specificity rules → later definition wins. `autoHeight` (minHeight:auto @ tablet2, applied when label hidden) MUST be defined AFTER stepTile/carouselRow/carouselWrapper or their `minHeight:299px` wins and card still grows. Moved autoHeight to END of block.css.ts to fix.
- Card height control: stepContent keeps own minHeight 270px; tile/row/wrapper carry the 299px min that must be neutralized to auto when label hidden.
- Figma color cross-check (node 2921-1413, light variant): section bg = `bg/tertiary` #ECEDE9 (NOT bg.primary/white — section is darker than the #F5F6F4 cards). card = `bg.secondary`, heading = `content.primary`, title+desc = `content.secondary`. Theme contract values in `projects/xsolla-com/common/src/theme.css.ts`.

## video-player block — NEW block (branch: xsolla-com-main)
**Status (2026-07-06):** Built + dark/light toggle added. Build green (client+SSR), lint+prettier clean. NOT committed, no Jira ticket yet.

New block: `projects/xsolla-com/video-player/`. First xsolla-com video block.
- 2 fields: `videoUrl` (string) + `thumbnail` (imageValueRef). Shows thumbnail w/ centered play-icon overlay; click → inline player replaces thumbnail (NOT modal).
- Auto-detect source (`src/get-video-source.ts`, pure/SSR-safe): YouTube (youtu.be, watch?v=, /embed/, /shorts/) + Vimeo → iframe embed (autoplay); else `isSafeUrl` → native `<video>`; else invalid (stays on thumbnail). Uses `isSafeUrl` from `@xsolla-com/common/components/editor-safe-link` (blocks javascript:/data:).
- Dark/light: `theme` enum default 'dark' (preserves original dark styling). Same pattern as steps — `lightTheme`/`darkTheme` class + `vars` tokens. `ValueToggler` 'Dark Mode' in settings Appearance group. Play triangle stays black (#000) — sits on cyan brand circle, theme-independent.
- Translations: 1 key `play.label` (aria-label), wired via `@mit/intl`. No hardcoded JSX strings.
- SSR-safe: player mounts only after client click; no unguarded browser APIs (SSR build 66 modules green).

## Next (video-player)
- Manual QA in SiteBuilder Dev Mode: thumbnail on load, YouTube/Vimeo/mp4 playback, invalid URL stays on thumbnail, dark/light swap live.
- Commit when Irfan asks + provides ticket — format `[TICKET-ID] Description`, branch `TICKET-ID__...`, MR target main.

## Confluence block docs — 15 per-block pages + catalog (space XSOL)
**Status (2026-07-08):** Complete. All 15 xsolla-com per-block Confluence pages consistent with a golden template. No repo change (Confluence-only).

- **Block Catalog** page `24840175707` — all 18 blocks, name+version+description. Versions from `projects/xsolla-com/*/package.json` on `xsolla-com-main`.
- **Codebase setup** page `24450957353` — added §10 Creating a Merge Request (v4).
- **products-grid** page `24840011951` = gold-standard template. Canonical section order: header block (Package / Latest release · Source / Source path) → What it does → Editor settings → Configurable data → Schema field reference (nested block→row→card→button/badge/background) → Translations → Analytics events → Version history → Shared code used → Screenshot.
- Header cites BOTH latest-release (git tag) and source (package.json) version — they drift; package.json often stale vs released tag.
- **hero** page `24840175863` was sole drift — fixed to template, now v6.

Gotchas learned:
- **Confluence markdown table-cell newline bug:** ANY `\n` in a table cell — even doubled `\\n` — is parsed by the markdown→storage converter into a real newline, shattering the table row. Never put `\n` in a table cell; represent multi-line values as separate code spans + ` / ` slash separator.
- `updateConfluencePage` REPLACES the whole body and auto-bumps version on `current` pages. Can't publish-from-draft (sends v2, API wants v1) — use `createConfluencePage` for fresh pages.

## blog-latest-articles — tag-driven topic filter (2026-07-09)
**Status:** Implemented + green (prettier/lint/build). Uncommitted. Not authorized to commit yet.

- Model: "tag pills drive tabs". Article shows under a topic tab when one of its `tags` equals the topic `label`, case-insensitive (`tag.toLowerCase() === label.toLowerCase()`). Per-article Topic dropdown removed (killed double-entry).
- **Tags forced from `localizedValueRef` → plain `z.array(z.string())`.** Reason: block-helpers has NO synchronous ref→text resolver (only `useEditableText`, a hook — can't loop over variable-length tags array), so ref text can't be compared in the parent filter. Tradeoff Irfan accepted: tags edited in settings panel via `Input`, no on-canvas editing, no per-locale tag translation.
- Seed tags renamed to match topic labels exactly (match is exact-string lowercased, NOT substring): "Community Growth" / "Funding" / "Game Sales and Commerce" / "Industry".
- Seed articles 12 → 16 (4 per topic) for filter testing. pageSize 6 → All tab paginates, each topic tab shows 4 on one page.
- block.tsx renders tags as plain `{tag}` now (no `<TextEditor>`); title/heading/date/readingTime/"All" tab still use `<TextEditor id={ref}>`.

**Recurring gotcha Irfan hit 3x this session — SiteBuilder stale instance:**
`defaultData` seeds ONLY new block instances. An existing block on the canvas keeps its old saved data across schema changes. Symptoms all trace to one stale instance: (1) topic filter shows nothing/broken, (2) card tags render as raw `L:...` ref keys (old ref stored, new code prints string), (3) card count stuck at 12 despite schema bump to 16. **Fix for all three: delete + re-add the block on canvas → fresh defaultData seeds.** Or hand-edit each field in settings panel. Flag this early whenever schema-shape/seed edits "don't show up".

## Figma landing-page → block reusability analyses (Confluence, space XSOL) (2026-07-15)
**Status:** Complete. Two Confluence pages published; no repo change.

Analyzed two "Release Notes_OUT" Figma pages (file `UxZG02EWQVsq0D67bRV27M`), mapped each section to existing xsolla-com blocks, published a report per page.
- **XPN page** (node 2167-24071, 12 sections) → Confluence **24869962271**. ~fully composable, 9 blocks → 11/12 sections.
- **Payment page** (node 2125-4606, 11 sections +1 hidden) → Confluence **24870225492**. 8 block types → all 11; sections 4-8 all from one "Product Tile" → products-grid-block/product-spotlight.
- Both draw on: header, hero, products-grid-block, product-spotlight, cta-module, contact-us, footer, spacer.

**Reuse gap on BOTH pages: `video-player`** — exists only as built `dist/` (no `src/`). Deployable/placeable but not editable or restylable from this repo. (This is the block I built 2026-07-06 — source presumably on a different branch than xsolla-com-main; worth locating if it needs edits.)

## video-player — add asset-selector video source (branch: WEBSITE-4775__RW-video-block) (2026-07-15)
**Status:** Implemented, prettier/lint clean, client+SSR build green. NOT committed. Live Dev Mode QA still pending.

Requirement: block previously took video ONLY as a pasted URL (`videoUrl`). Add ability to pick an UPLOADED video from the SiteBuilder asset panel, via a source-type toggle (Link vs. Uploaded file — Irfan chose the toggle UX over precedence).

**Critical gotcha Irfan caught (saved me shipping it wrong):** `useOpenImageSettings` (block-helpers) is STRICTLY image-only — it never sets `canSetVideo` AND its callback hard-drops non-image results (`if (asset.type === "image")`). So reusing the thumbnail's `imageValueRef` picker CANNOT select a video. First implementation did exactly this and was wrong; reworked it.
- **Correct hook: `useOpenAssetSettings` from `@site-builder/block-utils`** (already a dep). Pass `canSetVideo: true`; `assetFunction` receives `MediaValueType` union incl. `VideoValue` (`.video` = uploaded CDN URL, `.fileName`). Filter `asset.type === 'video'`.
- No `videoValueRef`/`useResolveVideo` sugar exists, and NO in-repo precedent for `useOpenAssetSettings`.
- Media types/helpers (`MediaValueType`, `makeVideo`, `MediaTypes`) live in `@site-builder/common` — NOT in catalog, not a dep. Decided (Irfan): do NOT add it. Hand-build `currentAsset` literal and cast `as unknown as Asset` where `type Asset = Parameters<ReturnType<typeof useOpenAssetSettings>>[0]['currentAsset']`.
- Upload accept-list `.mp4,.webm` enforced host-side (`ACCEPT_VIDEO_FORMATS` in `@site-builder/common`).

Changes: schema — dropped `videoFile: imageValueRef()`, added `videoSourceType` enum('link'|'file') + `videoFileUrl` + `videoFileName` strings. settings.tsx — `ValueToggler` 'Upload video file' + new `VideoFileField` (uses `useOpenAssetSettings`). block.tsx — `effectiveUrl = videoSourceType==='file' ? videoFileUrl : videoUrl`, fed through existing `getVideoSource` → 'file' → native `<video>`.

**Pending live QA (can't verify from CLI):** (1) does `canSetVideo:true` actually open panel with video enabled; (2) does storing only the URL suffice for the panel to reflect current selection on reopen — if not, store more `VideoValue` fields.

Note: earlier note (2026-07-15 Figma analysis) said video-player had "no src, dist only" — that was on xsolla-com-main; the src lives on this WEBSITE-4775 branch.

Workflow gotchas (confirmed/added):
- `get_metadata` from Figma MCP is too large for context — always saved to a tool-results file. Parse with an Explore subagent (jq/python), not Read offset/limit. Full-page `get_screenshot` reads directly fine.
- Confirmed: can't publish a Confluence *draft* in place (updateConfluencePage sends v2, first-publish wants v1). Use `createConfluencePage` for a fresh published page in the same space.
- `createConfluencePage`/`updateConfluencePage` accept `contentFormat: "html"` with `data-type` panels (panel-success/note/warning) + status badges (`<span data-type="status" data-color="green">`) — renders cleanly. HTML tables survive (unlike the markdown table-cell `\n` bug).

---

## 2026-07-16 — xsolla-com onboarding docs (for 2 new grads)
Created onboarding material under `projects/xsolla-com/docs/`: `ONBOARDING.md` (5-phase learn-by-building program + gap-fillers), `TEXT-AND-IMAGE.md` (refs-vs-resolved mental model via real cta-module code), `create-block-skill/` (copied from ~/.claude/skills), and `projects/xsolla-com/README.md` pointer. Method: guided pairing (Irfan = buddy, daily), difficulty gradient spacer → video-player → header.
Key gap-fillers documented: complete `.npmrc` (adds missing `@publishing-platform` registry), canonical toolchain (Node 22.16.0 / pnpm 10.22 local, CI uses pnpm 9), federated-module mental model, glossary, known traps (broken `preview:dev`, CORS localhost, catalog: deps, SSR-at-publish).
INCIDENT: docs were untracked and got wiped by branch/demo switching + working-tree clean; recovered from context. MUST be committed to persist. As of wrap: uncommitted, current branch WEBSITE-4562 has an active merge conflict so needs a dedicated branch.
