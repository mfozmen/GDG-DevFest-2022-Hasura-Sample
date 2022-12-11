alter table "public"."users" alter column "name" drop not null;
alter table "public"."users" add column "name" text;
