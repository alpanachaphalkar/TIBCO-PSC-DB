#!/bin/bash

LOGGER=./logs/DbSetup_Ouputs.log

# Clear off the previously set variables.
PGHOME=
PGHOST=
PGPORT=
PGDATABASE=
PGUSER=
PGPASSWORD=

PGHOME=$1
PGHOST=$2
PGPORT=$3
PGDATABASE=$4
PGUSER=$5
PGPASSWORD=$6



echo "---------------------------------------------------"
echo "Using PGHOME=${PGHOME}"
echo "Using PGSQL=${PGSQL}"
echo "Using PGPORT=${PGHOST}"
echo "Using PGPORT=${PGPORT}"
echo "Using PGDATABASE=${PGDATABASE}"
echo "Using PGUSER=${PGUSER}"
echo "---------------------------------------------------"

# Check if the ENV variable already exits. If it exists, then use it and prompt otherwise.
# Set the Env variable PGHOME.

if [ "X${PGHOME}" == "X" ] 
then
    echo "Specify the Postgres Home [/apps/PostgreSQL/9.1] : "
    read PGHOME
fi
if [ "X${PGHOME}" == "X" ] 
then 
    PGHOME=/apps/PostgreSQL/9.1
fi
PGSQL=${PGHOME}/bin/psql

# Set the Env variable PGHOST.
if [ "X${PGHOST}" == "X" ]
then
    echo "Specify the Postgres Host [localhost] : "
    read PGHOST
fi
if [ "X${PGHOST}" == "X" ]
then
    PGHOST=localhost
fi

# Set the Env variable PGPORT.
if [ "X${PGPORT}" == "X" ]
then
    echo "Specify the Postgres Port [5432] : "
    read PGPORT
fi
if [ "X${PGPORT}" == "X" ]
then
    PGPORT=5432
fi

# Set the Env variable PGDATABASE.
if [ "X${PGDATABASE}" == "X" ]
then
    echo "Specify the Postgres MDM Database [velodb] : "
    read PGDATABASE
fi
if [ "X${PGDATABASE}" == "X" ]
then
    PGDATABASE=velodb
fi

# Set the Env variable PGUSER.
if [ "X${PGUSER}" == "X" ]
then
    echo "Specify the Postgres MDM user : "
    read PGUSER
fi


# Set the Env variable PGPASSWORD.
if [ "X${PGPASSWORD}" == "X" ]
then
    echo "Specify the Postgres MDM user password : "
    read PGPASSWORD
fi



# delete the existing log file.
rm -f "${LOGGER}*"

echo "---------------------------------------------------" >> "${LOGGER}"
echo "Using PGHOME=${PGHOME}" >> "${LOGGER}"
echo "Using PGSQL=${PGSQL}" >> "${LOGGER}"
echo "Using PGPORT=${PGHOST}" >> "${LOGGER}"
echo "Using PGPORT=${PGPORT}" >> "${LOGGER}"
echo "Using PGDATABASE=${PGDATABASE}" >> "${LOGGER}"
echo "Using PGUSER=${PGUSER}" >> "${LOGGER}"
echo "---------------------------------------------------" >> "${LOGGER}"

# EXPORT ENV variables.
export PGHOME="${PGHOME}"
export PGSQL="${PGSQL}"
export PGHOST="${PGHOST}"
export PGPORT="${PGPORT}"
export PGDATABASE="${PGDATABASE}"
export PGUSER="${PGUSER}"
export PGPASSWORD="${PGPASSWORD}"

if [ "$MQ_ON_TROPOS" = "true" ]
then
    echo "Replacing the string VELODBDATA with '' "
    # making replacements in the PGSQL DB scripts.
    sed -i 's/TABLESPACE VELODBDATA;/;/' ./scripts/seed/create_tabs.sql
else 
    echo "skipping of replacing the string VELODBDATA with '' "
fi

"${PGSQL}" -ef ./install_ac.sql >> "${LOGGER}"

echo "Script executed successfully. Please check the logs."