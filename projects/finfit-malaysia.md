---
jira_keys: []
local_path: ~/finfit-malaysia
origin_url: none (local only, no remote yet)
default_branch: main
---

# FinFit Malaysia

Financial fitness web app for Malaysian pay structures. Free, private, in-browser estimates of
net salary (after EPF/SOCSO/EIS/LHDN tax), debt-service ratio (DSR), and monthly surplus.
Built from PRD `~/Downloads/Financial-lead.md` v3.0.

## Stack

| Layer | Choice |
|---|---|
| Framework | Next.js 16.2.10 (App Router, Turbopack default) |
| UI | React 19.2.4, TypeScript 5, Tailwind v4, lucide-react |
| State | Zustand 5 + persist → sessionStorage |
| Money | integer sen everywhere; decimal.js for exact rates; Intl en-MY at boundary (`formatMYR`) |
| Validation | zod |
| Tests | vitest |
| Package mgr | yarn |

## Next 16 gotchas (AGENTS.md: "NOT the Next.js you know" — read node_modules/next/dist/docs/ first)

- `params`/`searchParams`/`cookies()`/`headers()` now Promises — must `await`.
- `middleware.ts` → `proxy.ts` (nodejs runtime only, no edge).
- `dynamic(..., {ssr:false})` allowed ONLY inside a `'use client'` file (throws in Server Component).
- Turbopack magic comments: `turbopackOptional`/`turbopackIgnore` (NOT `webpack*`).
- `next lint` removed. Route-handler caching caveats with `cacheComponents`.

## Architecture

- **Engine** (`src/engine/`) is pure + authoritative. UI never restates statutory constants.
  - `index.ts`: `calcNetFromGross(grossSen)→NetResult`, `useTakeHome(netSen)→NetResult`,
    `reverseGross(targetNetSen)`. Re-exports dsr, money, MANIFEST/VALIDATION_LABEL.
  - `dsr.ts`: `assess(netSen, commitmentsSen, livingSen)→Assessment` (surplus, dsr, band,
    negativeCashflow). Band table (lower/moderate/high/critical/exceeds) hardcoded EN labels.
  - `epf.ts`/`socso.ts`/`eis.ts`/`tax.ts`: per-statute calcs.
  - `fixtures/`: JSON band tables + `manifest.ts`.
  - `reverse.worker.ts` + `useReverseGross.ts`: net→gross scan in Web Worker.
- **Funnel** = single-page step machine (`FunnelContainer.tsx`, `useState(1..4)`). NO `/result` route.
  - Page1Income → Page2Outflow → Page3Assessment (RESULT screen) → Page4Contact (mock, demo-only).
- **Store** `src/store/funnel.ts`: sessionStorage key `finfit-funnel`, 30-min inactivity TTL,
  `partialize`. Persona/band derived, not stored.

## Git flow

- Local only, no remote yet. Branch `main`. Commit when user asks.

## Session log

### 2026-07-10 — M1 data-swap (DONE, verified)

Swapped placeholder statutory fixtures for real formula-derived **2026** tables.

- **FORMULA-2026 release**: band tables formula-generated from confirmed official 2026 rates +
  rounding rules — KWSP Third Schedule (EPF), PERKESO Act 4 (SOCSO) + Act 800 (EIS), LHDN YA2026 tax
  (new 26%/28% brackets). Real data, but **NOT compliance-signed-off** — human must verify vs
  official PDFs and clear the stamp before non-demo use.
- Manifest: `releaseId:"M1-FORMULA-2026"`, `verifiedBy:"FORMULA-2026"`,
  `verifiedAt:"2026-07-10T00:00:00Z"`, 3 sourceUrls (kwsp/perkeso/hasil).
- `VALIDATION_LABEL = "based on 2026 published rates — pending official gazette sign-off"`.
- Golden vectors (RM5,000 gross): EPF 55000, SOCSO 2475, EIS 990, net 430535, `formatMYR`="RM 4,305.35".
- **Verified**: `npx tsc --noEmit` clean, `npx vitest run` 32/32 green, build clean.

### 2026-07-10 — V2 "Planning Confidence" (client features, pass 1) — DONE (auto-verified; manual E2E pending)

Scope (user-approved plan `~/.claude/plans/yes-use-for-building-eventual-kahn.md`): 2 pure-client
features, **no backend, no legal gate**.

- **Feature A — Multi-scenario what-if simulator** ✓ shipped:
  - `src/engine/scenario.ts` (pure): `computeScenario(base, overrides)` → `{inputs,net,assessment}`;
    3 stress presets (`income-drop` −20%, `new-commitment` +RM1,000, `living-up` +15%). Overrides
    stored as ABSOLUTE sen (engine purity), clamped ≥0. Imports `./index`+`./dsr` only; `index.ts`
    does NOT re-export scenario (avoids const-eval cycle) — UI/tests import `@/engine/scenario`.
  - Store slice `scenarios: Scenario[]` + add/update/remove in `src/store/funnel.ts`, in `partialize`.
  - `src/components/funnel/ScenarioSimulator.tsx` (`'use client'`): base card + editable scenario
    cards (income/debt/living), preset chips, per-scenario `TrafficLight` + surplus delta-vs-now.
  - Replaced inline single what-if at `Page3Assessment.tsx:96-126` (pruned `useState`/`assess`/
    `parseRinggitInput`/`toSen`/`Input` imports there).
  - 9 unit tests added (`scenario.test.ts`): no-override≡`assess()`, income−20% lowers net/raises
    DSR, +RM1k shifts surplus, clamps, throws on net≤0, preset ids/values.
- **Feature B — Banker-Ready PDF report** ✓ shipped:
  - `src/components/report/BankerReport.tsx` (pure): `@react-pdf/renderer` `<Document>` — income
    breakdown from `NetResult.deductions`, DSR/band/surplus, scenario table, `assumptions[]`, fixed
    footer w/ `VALIDATION_LABEL`+`releaseId`+"not financial advice" disclaimer. All amounts `formatMYR`.
  - `src/components/report/ReportDownload.tsx` (`'use client'`, default export): holds the `@react-pdf`
    import + `PDFDownloadLink`; pulls data from store, computes scenarios. This is the async-chunk
    boundary.
  - `src/components/funnel/ReportButton.tsx` (`'use client'`): `dynamic(() => import(ReportDownload),
    {ssr:false})` — the client-only dynamic rule. Renders on result screen.
  - `@react-pdf/renderer` added to deps (yarn).
- **OUT this pass**: profile-save, BM toggle, bank comparison, any server route.
- **Limitation**: what-if uses engine's actual inputs (income + total monthly commitment amount +
  living), NOT loan amortization/interest/term math. Stated in UI copy + report footer.

**Verified**: `npx tsc --noEmit` clean; `npx vitest run` **41/41** green (32 existing + 9 new);
`npm run build` clean. @react-pdf isolated in ONE async chunk (`17k…js`, 1.47MB) referenced only by
a 7KB loader chunk, **0 refs in build-manifest.json** → NOT in any initial route bundle (<150KB
budget held; entry chunks 74/112/146KB raw). No network calls in any new file (grep-confirmed).
**Still pending**: manual `npm run dev` /check E2E click-through + real PDF open (can't drive browser
headless).
