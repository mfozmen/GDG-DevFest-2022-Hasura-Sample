CREATE TABLE "public"."users" ("id" serial NOT NULL, "username" text NOT NULL, "password" text NOT NULL, "name" text NOT NULL, "surname" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("username"));
