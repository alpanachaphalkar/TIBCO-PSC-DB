#!/bin/sh

pg_ctl -o "-c listen_addresses='localhost'" -w restart

mkdir -p "${MDMDBDATATBSSTORAGE}" && mkdir -p "${MDMDBINDEXTBSSTORAGE}"

echo "---------------------------------------------------"
echo "MDM DB Installation Starts"
echo "---------------------------------------------------"
cd "/repo/postgresql/dbscripts/mdm/install"
sh ./install.sh
echo "---------------------------------------------------"
echo "MDM DB Installation Finished"
echo "---------------------------------------------------"

echo "---------------------------------------------------"
echo "FC DB Installation Starts"
echo "---------------------------------------------------"
cd "/repo/postgresql/dbscripts/fc/install"
sh ./install_ac.sh
echo "---------------------------------------------------"
echo "FC DB Installation Finished"
echo "---------------------------------------------------"