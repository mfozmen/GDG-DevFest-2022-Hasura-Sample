CREATE TABLE "public"."baskets" ("id" serial NOT NULL, "product_id" integer NOT NULL, "user_id" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."baskets" IS E'Users\' baskets';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_baskets_updated_at"
BEFORE UPDATE ON "public"."baskets"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_baskets_updated_at" ON "public"."baskets" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
