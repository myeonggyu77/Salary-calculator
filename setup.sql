-- 급여 계산기 — Supabase 초기 설정 스크립트
-- Supabase 대시보드 > SQL Editor 에서 이 내용을 붙여넣고 실행하세요 (최초 1회).

create table if not exists salary_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  settings jsonb not null default '{}'::jsonb,
  work_logs jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table salary_data enable row level security;

create policy "select own salary data"
  on salary_data for select
  using (auth.uid() = user_id);

create policy "insert own salary data"
  on salary_data for insert
  with check (auth.uid() = user_id);

create policy "update own salary data"
  on salary_data for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "delete own salary data"
  on salary_data for delete
  using (auth.uid() = user_id);
