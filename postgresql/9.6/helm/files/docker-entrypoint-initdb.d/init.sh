#!/bin/sh

echo "---------------------------------------------------"
echo "DB Initialization Started"
echo "---------------------------------------------------"
pg_ctl -o "-c listen_addresses='localhost'" -w restart

mkdir -p "${MDMDBDATATBSSTORAGE}" "${MDMDBINDEXTBSSTORAGE}"

DB_SCRIPTS_PATH="/repo/postgresql/dbscripts"
echo "---------------------------------------------------"
echo "MDM DB Installation Starts"
echo "---------------------------------------------------"
cd "${DB_SCRIPTS_PATH}/mdm/install"
sh ./install.sh
echo "---------------------------------------------------"
echo "MDM DB Installation Finished"
echo "---------------------------------------------------"

echo "---------------------------------------------------"
echo "FC DB Installation Starts"
echo "---------------------------------------------------"
cd "${DB_SCRIPTS_PATH}/fc/install"
sh ./install_ac.sh
echo "---------------------------------------------------"
echo "FC DB Installation Finished"
echo "---------------------------------------------------"

#echo "---------------------------------------------------"
#echo "DB Migration Started"
#echo "---------------------------------------------------"
#
#SCRIPTPATH="/repo/postgresql/dbscripts/migration"
#psc_mdmdb_user="${MDMDBUSER}"
#psc_mdmdb_password="${MDMDBPASSWORD}"
#psc_super_user="${PGUSER}"
#psc_mdmdb_schema="${MDMDBSCHEMA}"
#psc_mdmdb_database="${PGDATABASE}"
#psql -U "${PGUSER}" -d "${PGDATABASE}" -v psc_mdmdb_user="${psc_mdmdb_user}" -v psc_mdmdb_password="'${psc_mdmdb_password}'" -v psc_super_user="${psc_super_user}" -v psc_mdmdb_schema="${psc_mdmdb_schema}" -h "${PG_HOST}" -p "${PG_PORT}" -f "${SCRIPTPATH}/postgres/V202105101000__psc_initial.sql"
#
#for f in $SCRIPTPATH/mdmdb/*.sql;
#do
#    psql -U "${PGUSER}" -d "${PGDATABASE}" -v psc_mdmdb_user="${psc_mdmdb_user}" -v psc_mdmdb_password="'${psc_mdmdb_password}'" -v psc_super_user="${psc_super_user}" -v psc_mdmdb_schema="${psc_mdmdb_schema}" -v psc_mdmdb_database="'${psc_mdmdb_database}'" -h "${PG_HOST}" -p "${PG_PORT}" -f "$f"
#done
#
#for f in $SCRIPTPATH/fcdb/*.sql;
#do
#    psql -U "${PGUSER}" -d "${PGDATABASE}" -v psc_mdmdb_user="${psc_mdmdb_user}" -v psc_mdmdb_password="'${psc_mdmdb_password}'" -v psc_super_user="${psc_super_user}" -v psc_mdmdb_schema="${psc_mdmdb_schema}" -h "${PG_HOST}" -p "${PG_PORT}" -f "$f"
#done
#
#echo "---------------------------------------------------"
#echo "DB Migration Finished"
#echo "---------------------------------------------------"

echo "---------------------------------------------------"
echo "DB Initialization Finished"
echo "---------------------------------------------------"