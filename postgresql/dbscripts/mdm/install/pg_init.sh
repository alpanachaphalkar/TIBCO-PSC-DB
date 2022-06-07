#!/bin/bash

echo "Environment variables for PostgreSQL Init"

PGHOME=$1
if [ "X${PGHOME}" == "X" ]; then
    PGHOME=.
fi

PGUSER="${USER}"
if [ "X${PGUSER}" == "X" ]; then
    PGUSER="postgres"
fi

PATH="${PGHOME}/bin":${PATH}:
PGDATA="${PGHOME}/data"
PGDATABASE=postgres
PGPORT=5432
PGLOCALEDIR="${PGHOME}/share/locale"

export PGHOME
export PATH
export PGDATA
export PGDATABASE
export PGUSER
export PGPORT
export PGLOCALEDIR

# Stop running server.
if [ -f "${PGDATA}/postmaster.pid" ]; then
    "${PGHOME}/bin/pg_ctl" stop -D "${PGDATA}" 
fi
	
# Delete existing data files.
if [ -f "${PGDATA}" ]; then
    rm -Rf "${PGDATA}"
fi

# Delete the log file.
if [ -f "${PGHOME}/startup.log" ]; then
    rm -f "${PGHOME}/startup.log"
fi

# Initialize the database.
"${PGHOME}/bin/initdb" -E UTF8 -U ${PGUSER} -A trust

# Start the server.
"${PGHOME}/bin/pg_ctl" start -D "${PGDATA}" -l "${PGHOME}/startup.log" -w 

echo "PostgreSQL Server started successfully!!!"
