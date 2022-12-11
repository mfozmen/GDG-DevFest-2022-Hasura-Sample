CREATE TABLE "public"."baskets_products" ("id" serial NOT NULL, "basket_id" integer NOT NULL, "product_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("basket_id") REFERENCES "public"."baskets"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."baskets_products" IS E'Products in User Baskets';