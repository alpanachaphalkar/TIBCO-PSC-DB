#!/bin/sh

echo "---------------------------------------------------"
echo "DB Initialization Started"
echo "---------------------------------------------------"
pg_ctl -o "-c listen_addresses='localhost'" -w restart

mkdir -p "${MDMDBDATATBSSTORAGE}" && mkdir -p "${MDMDBINDEXTBSSTORAGE}"
chown postgres:postgres "${MDMDBDATATBSSTORAGE}" && chown postgres:postgres "${MDMDBINDEXTBSSTORAGE}"

DB_SCRIPTS_PATH="/repo/postgresql/dbscripts"
echo "---------------------------------------------------"
echo "DB Installation Starts"
echo "---------------------------------------------------"
cd "${DB_SCRIPTS_PATH}"
sh ./install.sh
echo "---------------------------------------------------"
echo "DB Installation Finished"
echo "---------------------------------------------------"

echo "---------------------------------------------------"
echo "DB Initialization Finished"
echo "---------------------------------------------------"