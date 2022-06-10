CREATE ROLE :psc_mdmdb_user PASSWORD :psc_mdmdb_password NOSUPERUSER NOCREATEDB CREATEROLE INHERIT LOGIN;
GRANT :psc_mdmdb_user TO :psc_super_user;

CREATE SCHEMA :psc_mdmdb_schema;
ALTER SCHEMA :psc_mdmdb_schema OWNER TO :psc_mdmdb_user;
GRANT ALL ON SCHEMA :psc_mdmdb_schema TO :psc_super_user;
GRANT ALL ON SCHEMA :psc_mdmdb_schema TO :psc_mdmdb_user;

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
