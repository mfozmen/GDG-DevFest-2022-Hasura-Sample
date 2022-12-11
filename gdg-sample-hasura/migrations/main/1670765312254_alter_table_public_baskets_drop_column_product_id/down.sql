comment on column "public"."baskets"."product_id" is E'Users\' baskets';
alter table "public"."baskets" alter column "product_id" drop not null;
alter table "public"."baskets" add column "product_id" int4;
