alter table "public"."baskets_products" add constraint "baskets_products_basket_id_product_id_key" unique ("basket_id", "product_id");
