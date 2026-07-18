---
jira_keys: []
local_path: ~/Downloads/api-logger
origin_url: ""
default_branch: ""
status: done — utility tool, no active development
last_active: 2026-05-01
---

# api-logger (logcatcher)

Lightweight dev tool — captures and inspects POST requests locally. No git, no DB, no auth, no tests.

## Stack
- Node.js, Express 5, CORS
- Single file: `server.js` (~510 lines)
- Port: `3099` (hardcoded)
- Package manager: pnpm

## Endpoints
| Method | Path | Purpose |
|--------|------|---------|
| POST | `/log` | Primary capture endpoint |
| POST | `*` | Catch-all — captures any path |
| GET | `/logs` | Returns all logs as JSON array |
| DELETE | `/logs` | Clears all logs (resets counter) |
| GET | `/` | Live dashboard UI |

## Data model
```js
{ id, timestamp, method, path, headers, body }
```
In-memory only — resets on server restart. Counter (`logId`) resets on DELETE /logs.

## Dashboard
- Polls `/logs` every 800ms
- Left sidebar: request list (reversed, latest first)
- Right panel: selected request detail (body + abridged headers)
- Pause/Resume + Clear buttons
- Syntax highlights JSON

## Run
```bash
pnpm start      # node server.js
pnpm dev        # node --watch server.js (auto-restart)
```
