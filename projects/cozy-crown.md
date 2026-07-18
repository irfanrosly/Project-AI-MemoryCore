---
jira_keys: []
local_path: ~/IR/cozy-crown
origin_url: none (local only, no remote yet)
default_branch: main
status: stale — last active 2026-06-17 (31+ days)
last_active: 2026-06-17
---

# Cozy Crown

Receipt-splitting PWA. Photo → OCR → bill split → per-person PNG export.

## Stack

| Layer | Choice |
|---|---|
| Framework | Next.js 15 + TypeScript (App Router) |
| Styling | Tailwind CSS + shadcn/ui (base-ui/react primitives) |
| PWA | @ducanh2912/next-pwa |
| OCR | Tesseract.js (browser-side, lazy-loaded) |
| Auth + DB | Supabase (Postgres + Supabase Auth) via @supabase/ssr v0.10.3 |
| State | Zustand (wizard store, persisted to sessionStorage) |
| PNG Export | html-to-image (was dom-to-image-more — swapped 2026-06-17, see Last Work). ExportCard uses inline styles only — no Tailwind |
| Hosting | Vercel (target) |

## Routes

```
/                          → redirect (authed → /dashboard, else → /login)
/login                     → Supabase Auth magic link
/signup
/dashboard                 → session list (Server Component)
/sessions/new              → 5-step wizard
/sessions/[sessionId]      → summary + PNG export (Server Component)
/sessions/[sessionId]/edit → TODO (Phase 4)
```

## Wizard Steps

1. Upload — file input, blob preview
2. Review Items — editable item list post-OCR
3. Add People — participant chips + split mode toggle (Equal / Per Item)
4. Assign Items — per-item person selector (only if Per Item mode)
5. Charges — service % + tax % sliders, live total preview → Supabase batch write

## Key Files

| File | Purpose |
|---|---|
| `src/types/database.ts` | Supabase DB types — must use `type` (not `interface`) and include `Relationships: []` per table + `Views: {}`/`Functions: {}` on schema |
| `src/lib/split/calculator.ts` | Core split math — pure function |
| `src/stores/sessionWizardStore.ts` | Zustand wizard state |
| `src/components/session/summary/ExportCard.tsx` | PNG capture target — inline styles ONLY. fontFamily = `var(--font-nunito)` (NOT literal 'Nunito Sans' — that never matches next/font) |
| `src/lib/export/captureElement.ts` | html-to-image wrapper: `captureToBlob` (for Web Share File) + `captureElement` (download) |
| `src/components/session/summary/ExportAll.tsx` | per-person share row (WhatsApp text / share image / download) + "Share summary to group" wa.me link |
| `src/components/session/summary/PaymentDetails.tsx` | owner form: pay_name/bank/account + DuitNow QR upload → savePaymentDetails + router.refresh() |

## Design Tokens

| Token | Value |
|---|---|
| primary | `#C2410C` (orange-rust) |
| background | `#FFFBEB` (cream) |
| success | `#059669` |
| border | `#F1E8E2` |

Fonts: Varela Round (headings) + Nunito Sans (body)

## Known Gotchas

- **`@base-ui/react/button` has no `asChild` prop** — use `<Link className={buttonVariants()}>` directly instead of `<Button asChild><Link>`
- **Slider `onValueChange`** passes `number | readonly number[]`, not array — use `fromSlider()` helper: `Array.isArray(v) ? v[0] : v`
- **Supabase `never` type bug**: `Database` must be `type` (not `interface`), each table needs `Relationships: []`, schema needs `Views` and `Functions` keys — all required by `GenericSchema`. Missing any = all `from()` calls resolve to `never`
- **ExportCard**: zero Tailwind classes — capture lib can't resolve CSS vars. Inline styles only. BUT font-family MUST be `var(--font-nunito)` (resolves to the real next/font family in computed style) — a literal `'Nunito Sans'` never matches the generated next/font name → falls back to serif in the SVG foreignObject → text reflow + overlap.
- **Capture lib**: dom-to-image-more mangled the card (card #FAFAFA bg rendered only behind some elements = white boxes, plus serif reflow). Replaced with html-to-image. Off-screen QR `<img>` must be a data URL (cross-origin canvas taint) — ExportAll preloads pay_qr_url → blob → readAsDataURL before capture.
- **`createClient` naming**: server.ts exports `createClient` — import as `createClient as createServerClient` to avoid conflict with browser client

## Supabase Schema

Tables: `sessions`, `participants`, `items`, `item_assignments`
RLS: owner-only on all tables via `auth.uid() = user_id`
Schema SQL: see plan file at `~/.claude/plans/i-want-to-create-cozy-crown.md`

**Setup required (not yet done):**
- Run schema SQL in Supabase dashboard
- Fill `.env.local` with `NEXT_PUBLIC_SUPABASE_URL` + `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## Git Flow

No Jira. Branch freely. No remote. `main` is default.

## Phase Status

- Phase 1 (Foundation): done
- Phase 2 (Wizard Steps 1–5): done
- Phase 3 (Summary + Export): done
- Phase 4 (Dashboard + Polish): dashboard done; `/sessions/[sessionId]/edit` TODO
- Phase 5 (Hardening): not started

## Last Work (2026-06-17)

**Per-person payment + share feature** (plan: `~/.claude/plans/check-another-branch-and-gentle-clover.md`):
- New `sessions` columns: `pay_name`, `pay_bank`, `pay_account`, `pay_qr_url` (all nullable text). Decided per-session (not profile). QR = uploaded DuitNow image (can't fabricate EMVCo payload from acct number), reuses `receipts` bucket at `${userId}/${sessionId}-payqr.${ext}`.
- `PaymentDetails.tsx` owner form; `uploadPaymentQr` + `savePaymentDetails` in saveSessionFromWizard.ts.
- ExportCard "Pay to" block (name/bank/account + QR img). ExportAll: per-person WhatsApp text / share-image (Web Share API, wa.me can't attach files) / download, PLUS "Share summary to group" = single wa.me text listing everyone + one pay-to line (for group chats).
- **Swapped dom-to-image-more → html-to-image** + fixed font literal — fixed garbled card export (white boxes / serif reflow / overlap). Removed `dom-to-image-more.d.ts`.

Also done this session (uncommitted): password show/hide toggle (PasswordInput.tsx on Login+Signup), admin-approval gate, Mint Slate recolor.

**PENDING — owner must run SQL in Supabase dashboard before feature works:**
```sql
alter table public.sessions
  add column if not exists pay_name    text,
  add column if not exists pay_bank    text,
  add column if not exists pay_account text,
  add column if not exists pay_qr_url  text;
```
**All work UNCOMMITTED** — awaiting Irfan's go-ahead. `tsc --noEmit` clean.

## Last Work (2026-06-09)

Fixed root TS error: `Database` type missing `Relationships`/`Views`/`Functions` — all `from()` calls were `never`. Fixed. `tsc` exits 0. Added session `loading.tsx`, PWA icons generated.
