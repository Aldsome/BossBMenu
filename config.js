/* ==========================================================
   ORDERINN COFFEE — RUNTIME CONFIG
   ----------------------------------------------------------
   Paste your Supabase project's URL + anon (public) key
   below. Then the app automatically switches from
   localStorage-only mode into cross-device realtime mode.

   How to get the values:
     1. Open your Supabase project dashboard.
     2. Sidebar → Project Settings → API.
     3. Copy the "Project URL" into SUPABASE_URL.
     4. Copy the "Project API keys → anon  public" into
        SUPABASE_ANON_KEY.

   The anon key is SAFE to commit to a public repo — it is
   designed for browser use and is gated by the Row Level
   Security policies you set up in data/supabase.sql. The
   SERVICE ROLE key is the one you must never commit.

   To temporarily run offline / localStorage-only again, just
   set SUPABASE_URL back to '' (empty string).
   ========================================================== */

window.BB_CONFIG = {
  SUPABASE_URL:      'https://rpjlaaudtuaaycfmpoxy.supabase.co',
  SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwamxhYXVkdHVhYXljZm1wb3h5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODAyMjQ2NzgsImV4cCI6MjA5NTgwMDY3OH0.4bCJP8KSllMRUO1Bi2SXi8Nr3WrMLwVM0FpL_R_bf2s',
};
