-- Run this in Supabase → SQL Editor → New Query

create table if not exists fp_kv (
  key text primary key,
  value text,
  updated_at timestamptz default now()
);

-- Enable real-time updates
alter publication supabase_realtime add table fp_kv;

-- Allow public access (the app uses your anon key)
alter table fp_kv enable row level security;

create policy "Allow all" on fp_kv
  for all using (true) with check (true);
