# GDG-DevFest-2022-Hasura-Sample

## Installing Dependencies

The following commands must be executed first to install dependencies

```bash
npm i
cd gdg-sample-api
npm i
```

## Run

The following command can be executed to up a local environment:

```bash
docker-compose up -d
```

## How to Reach Hasura Console

The following command can be executed to reach Hasura Console with migrations

```bash
cd gdg-sample-hasura
npx hasura console --admin-secret secret
```

## How to Reach PG Admin

The following url can be used to reach PG Admin to reach Postgres Databases

http://localhost:5050

Email: admin@admin.com
Password: admin
