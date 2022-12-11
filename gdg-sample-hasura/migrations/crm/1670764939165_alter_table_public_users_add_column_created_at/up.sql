alter table "public"."users" add column "created_at" timestamptz
 null default now();
