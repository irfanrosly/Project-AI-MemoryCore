---
jira_keys: [WEBSITE]
local_path: /Users/i.rosly/IR/xsolla-com-v6
origin_url: https://gitlab.loc/common/xsolla-com-v6.git
default_branch: master
---

# xsolla-com-v6

Xsolla corporate website — xsolla.com. Universal (SSR) React app.

## Stack
- **Frontend**: React 16, Redux, React Router, styled-components, React-Intl
- **SSR**: Express + React server-side rendering
- **Styling**: SCSS + Stylus
- **Build**: Webpack (custom config in `tools/webpack/`)
- **Testing**: Mocha + Enzyme
- **Language**: JavaScript ES6+ (no TypeScript)
- **Node**: 16

## Structure
```
src/
  scenes/        # ~55 page-level components (one per route)
  components/    # Reusable UI components
  state/         # Redux (modules pattern — reducers per domain)
  routes/        # React Router route definitions
  entry/         # client.js + server.js entry points
  hooks/         # React hooks
  utils/         # Shared utilities
  styles/        # Global SCSS/Stylus styles
  assets/        # Static assets
server/
  index.js       # Express server
  api/           # Server-side API routes
  middleware/    # Express middleware
  utils/
public/
  locales/       # i18n locale files + localesMap.json
tools/           # Webpack build scripts
```

## Git flow
- Feature branches: `WEBSITE-XXXX` or `WEBSITE-XXXX-short-description`
- Release branches: `release-YYYY-MM-DD-v1` (e.g. `release-2026-04-27-v1`)
- MR target: **master**
- Commits: `TICKET-ID fix(scope): description` — no body, no co-author trailer

## CI/CD (GitLab CI — `.gitlab-ci.yml`)
- **Stage deploy**: branches matching `build-stage` or `stage-*`
- **Prod deploy**: release branches merged to master
- Build stages: `translations → dependencies → build → build-stage → upload → deploy-static → deploy`
- Prod URL pattern: `https://<branch-name>.www.xsolla.com`

## Dev commands
```bash
yarn           # install deps
cp .env.example .env
yarn dev       # dev server on port 3000
yarn build     # production build
yarn start     # serve production build on port 5004
yarn test      # mocha tests
yarn lint      # eslint
```

## Key integrations
- Xsolla API: `https://api.xsolla.com`
- Blog API (Webflow): `https://test-blog.xsolla.com`
- YouCanBook.me: `https://api.youcanbook.me/v1`
- Partner Network: `https://partner-network.xsolla.com/api`
- NewRelic (newrelic.js)
- @xsolla/gdpr, @xsolla/metrika packages

## i18n
React-Intl. Locales in `public/locales/`. `localesMap.json` maps language codes. SSR reads `Accept-Language` header.

## State management
Redux. Modules in `src/state/modules/`: intl, ui, header/footer, analytics, blog, careers, banner, etc.

## Notes
- Internal GitLab at `gitlab.loc` (not github.com)
- `.env.example` has all required vars; copy to `.env` before dev
- DLL optimization in `tools/webpack/createWebpackConfig.js` for fast dev rebuilds
