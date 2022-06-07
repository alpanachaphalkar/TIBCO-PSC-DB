#!/bin/bash
echo "Environment variables for PostgreSQL"



if [ -z "$PGHOME" ]; then
	export PGHOME=../../../bin/pgsql
fi

export MDM_HOME=$1
if test -n "$MDM_HOME"
then 	
	export PGHOME=$MDM_HOME/bin/pgsql	
fi	

export PATH="${PGHOME}/bin":$PATH:

export PGDATA="${PGHOME}/data"

# Start the server.
"${PGHOME}/bin/pg_ctl" start -D "${PGDATA}" -l "${PGHOME}/startup.log" -w 

echo "PostgreSQL Server started successfully!!!"
