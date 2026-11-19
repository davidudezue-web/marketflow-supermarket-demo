-- MARKETFLOW CLOUD DATABASE STARTER (NOT A COMPLETE PRODUCTION BACKEND)
-- Requires a Supabase project, security review, protected server endpoints and an external payment integration.
-- Deliberately grants NO anonymous order creation, stock adjustments or admin access.
-- Test on a staging project first; do not execute on unrelated business databases.

create extension if not exists pgcrypto;
create table if not exists public.market_outlets (
  id uuid primary key default gen_random_uuid(),
  name text not null, active boolean not null default true,
  created_at timestamptz not null default now());
create table if not exists public.market_products (
  id uuid primary key default gen_random_uuid(),
  sku text unique not null, name text not null, category text not null,
  price numeric(14,2) not null check(price >= 0),
  active boolean not null default true,
  created_at timestamptz not null default now());
create table if not exists public.market_inventory (
  outlet_id uuid references public.market_outlets(id) on delete cascade,
  product_id uuid references public.market_products(id) on delete cascade,
  available_quantity integer not null default 0 check(available_quantity >= 0),
  updated_at timestamptz not null default now(),
  primary key(outlet_id,product_id));
create table if not exists public.market_orders (
  id uuid primary key default gen_random_uuid(),
  customer_ref uuid references auth.users(id) on delete set null,
  outlet_id uuid not null references public.market_outlets(id),
  status text not null default 'pending' check(status in ('pending','paid','packing','ready','completed','cancelled','refunded')),
  total numeric(14,2) not null default 0 check(total >= 0),
  currency text not null default 'NGN',
  payment_reference text unique,
  created_at timestamptz not null default now());
create table if not exists public.market_order_lines (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.market_orders(id) on delete cascade,
  product_id uuid not null references public.market_products(id),
  quantity integer not null check(quantity > 0),
  unit_price numeric(14,2) not null check(unit_price >= 0),
  line_total numeric(14,2) generated always as (quantity * unit_price) stored);
create table if not exists public.market_staff (
  user_id uuid primary key references auth.users(id) on delete cascade,
  outlet_id uuid references public.market_outlets(id),
  role text not null check(role in ('owner','manager','cashier','stock_officer')),
  active boolean not null default true);
create table if not exists public.market_inventory_events (
  id uuid primary key default gen_random_uuid(),
  outlet_id uuid not null references public.market_outlets(id),
  product_id uuid not null references public.market_products(id),
  quantity_delta integer not null,
  event_type text not null check(event_type in ('receipt','sale','return','damage','waste','adjustment')),
  order_id uuid references public.market_orders(id),
  staff_id uuid references auth.users(id),
  created_at timestamptz not null default now());
create index if not exists market_orders_created_idx on public.market_orders(created_at desc);
create index if not exists market_order_lines_order_idx on public.market_order_lines(order_id);
create index if not exists market_inventory_events_created_idx on public.market_inventory_events(created_at desc);

alter table public.market_outlets enable row level security;
alter table public.market_products enable row level security;
alter table public.market_inventory enable row level security;
alter table public.market_orders enable row level security;
alter table public.market_order_lines enable row level security;
alter table public.market_staff enable row level security;
alter table public.market_inventory_events enable row level security;

-- Published catalogue: public read access only. Inventory quantities remain protected.
create policy "public active outlets" on public.market_outlets for select to anon,authenticated using (active);
create policy "public active products" on public.market_products for select to anon,authenticated using (active);

-- Staff may read their own staff profile; no client-authoritative write privileges are granted.
create policy "staff own record" on public.market_staff for select to authenticated using(user_id = auth.uid());

-- RLS blocks unreviewed direct client writes; production orders must go through a verified server-side workflow.
-- TODO: Add tested RLS policies for scoped staff read access, authenticated order history,
-- payment event verification, inventory movement auditing and row-locked order placement.
-- TODO: Configure secure Edge Functions with idempotency keys, IP rate limiting, server-side totals,
-- atomic stock reservations and an approved payment provider webhook.
