-- ============================================================
-- ORDERINN COFFEE — ADMIN LOGIN REBRAND
-- ------------------------------------------------------------
-- The local files now seed the admin as admin@orderinn.com,
-- but the LIVE Supabase bb_accounts table still has the old
-- admin@bossb.com row. Run this once to rebrand it on the server.
--
-- How: Supabase dashboard -> SQL Editor -> New query -> paste -> Run.
--
-- OPTION A (recommended): rename in place. Keeps the existing
-- password hash, so the password stays "admin1234" and nothing
-- else needs to change.
-- ------------------------------------------------------------
update bb_accounts
   set email = 'admin@orderinn.com'
 where id = 'u_seed_admin'
    or email = 'admin@bossb.com';

-- ------------------------------------------------------------
-- OPTION B (delete + let the app re-seed a fresh admin).
-- Only use this INSTEAD of Option A if you'd rather wipe the
-- old record. After running it, load the site once while online
-- and the app re-creates admin@orderinn.com / admin1234.
-- (Uncomment the line below to use this path.)
-- ------------------------------------------------------------
-- delete from bb_accounts where email = 'admin@bossb.com';
