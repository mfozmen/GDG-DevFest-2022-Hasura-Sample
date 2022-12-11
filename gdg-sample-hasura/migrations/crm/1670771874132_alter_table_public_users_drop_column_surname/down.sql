alter table "public"."users" alter column "surname" drop not null;
alter table "public"."users" add column "surname" text;
