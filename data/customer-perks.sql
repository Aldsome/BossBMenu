-- ============================================================
-- ORDERINN COFFEE — CUSTOMER PERKS
-- ------------------------------------------------------------
-- Adds a single jsonb column to bb_accounts that stores a
-- signed-in customer's loyalty data:
--   { points: int, lifetimePoints: int, vouchers: [ ... ] }
--
-- The app self-heals if this column is absent (it strips it and
-- syncs the rest), so perks work LOCALLY without this migration —
-- but they only follow a customer ACROSS DEVICES once it's run.
--
-- Run in Supabase -> SQL Editor -> New query -> Run. Safe to re-run.
-- ============================================================

alter table public.bb_accounts
  add column if not exists perks jsonb;
