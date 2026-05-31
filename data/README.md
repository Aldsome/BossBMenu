# BossB Coffee Shop — Data files

## Two storage modes

1. **Local mode** (default, no setup): everything lives in `localStorage`.
   Real cross-device sync does not work — `localStorage` is per-browser.
   The JSON files in this folder are the cold-start seed.

2. **Supabase mode**: the app talks to a hosted Postgres + realtime
   websocket. Customer and admin tabs on different devices see each
   other's updates within ~100ms. Enable it by pasting your project's
   URL + anon key into `config.js`.

## Switching to Supabase mode (one-time setup)

1. Create a free Supabase project at https://supabase.com (Sign in with
   GitHub — same account as your repo).
2. Open the SQL Editor in the dashboard and paste the entire contents
   of `data/supabase.sql`. Hit Run. This creates the four tables,
   enables realtime, and sets up RLS.
3. Open Project Settings → API. Copy the `URL` and the `anon public`
   key into `config.js` at the project root.
4. Refresh the app. It should now switch to Supabase mode automatically.

To go back to local mode, set `SUPABASE_URL: ''` in `config.js`.



These JSON files are the **seed source** for the app. On first load, when
`localStorage` is empty, the browser fetches these and uses them to populate
the in-memory store.

## Why JSON?

Both MongoDB (`mongoimport --jsonArray`) and MySQL 8+ (`JSON_TABLE`, or a
small ETL script) can import a JSON array of documents directly. When the
prototype is replaced with a real backend, these files become the seed
fixtures — no schema rewrite needed.

## Files

### `accounts.json`

One file for **all** roles (admin + future customer accounts). The `role`
field discriminates. Decision rationale: a single source of truth for email
uniqueness, easier referential integrity once a real DB lands.

```json
{
  "id":           "u_xxx",
  "email":        "user@example.com",
  "name":         "Display name",
  "role":         "admin" | "customer",
  "passwordHash": "sha256(password + PEPPER), hex",
  "createdAt":    "ISO 8601 timestamp"
}
```

The default admin (`admin@bossb.com` / `admin1234`) is pre-seeded with its
hash already computed against the pepper in `store.js`. **Change the
pepper and re-hash before going to production.**

### `products.json`

The menu catalog. Each entry:

```json
{
  "id":       "lowercase-id",
  "name":     "Display name",
  "category": "coffee" | "tea" | "cold" | "pastry",
  "price":    90,
  "emoji":    "☕",
  "desc":     "Short description",
  "tag":      "Bestseller",
  "img":      "https://...",
  "options": { "size": true, "temp": false, "milk": true, "sugar": true }
}
```

## Updating

Edit the files directly. The next browser session that has an empty
`localStorage` (or a wiped one via Factory Reset) will pick up the changes.
For live updates without wiping, use the Admin Panel — it writes to
`localStorage`. Then use **Settings → Export accounts.json / products.json**
to dump the live state back to these files.
