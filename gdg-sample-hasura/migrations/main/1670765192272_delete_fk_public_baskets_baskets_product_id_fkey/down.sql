alter table "public"."baskets"
  add constraint "baskets_product_id_fkey"
  foreign key ("product_id")
  references "public"."products"
  ("id") on update restrict on delete restrict;
