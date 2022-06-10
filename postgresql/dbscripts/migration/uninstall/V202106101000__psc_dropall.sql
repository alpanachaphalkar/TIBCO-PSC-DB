DROP SCHEMA IF EXISTS veloschema CASCADE;
DROP DATABASE IF EXISTS velodb;
DROP OWNED BY :psc_mdmdb_user;
DROP ROLE IF EXISTS :psc_mdmdb_user;

DROP TABLE IF EXISTS "postgres"."flyway_psc_postgres_version";
