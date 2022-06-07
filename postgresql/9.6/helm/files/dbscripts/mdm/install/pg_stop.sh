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

# Stop the server.
"${PGHOME}/bin/pg_ctl" stop -D "${PGDATA}" -m i

echo "PostgreSQL Server stoped successfully!!!"
