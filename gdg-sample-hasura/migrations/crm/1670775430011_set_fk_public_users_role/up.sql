alter table "public"."users"
  add constraint "users_role_fkey"
  foreign key ("role")
  references "public"."user_roles"
  ("role") on update restrict on delete restrict;
