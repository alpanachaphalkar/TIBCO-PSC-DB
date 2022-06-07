#!/bin/sh

if [ $# != 12 ]
then
    echo " USAGE : install.sh /apps/PostgreSQL/9.1 HostName Port DBName AdminUser AdminPassword MDMDBUser password /apps/PostgreSQL/9.1/tablespaces/velodbdata /apps/PostgreSQL/9.1/tablespaces/velodbindex MDM-Instance-name MDM-Instance-Desc"
fi

LOGGER=./logs/DbSetup_Ouputs.log

# Clear off the previously set variables.
#PGHOME=
#PGHOST=
#PGPORT=
#PGDATABASE=
#PGUSER=
#PGPASSWORD=
#MDMDBUSER=
#MDMDBPASSWORD=
#MDMDBSCHEMA=
#MDMDBDATATBSSTORAGE=
#MDMDBINDEXTBSSTORAGE=
#MDMINSTANCENAME=
#MDMINSTANCEDESCRIPTION=
#MDMINSTANCEUUID=

#PGHOME=$1
#PGHOST=$2
#PGPORT=$3
#PGDATABASE=$4
#PGUSER=$5
#PGPASSWORD=$6
#MDMDBUSER=$7
#MDMDBPASSWORD=$8
#MDMDBSCHEMA=$9
#MDMDBDATATBSSTORAGE=${10}
#MDMDBINDEXTBSSTORAGE=${11}
#MDMINSTANCENAME=${12}
#MDMINSTANCEDESCRIPTION=${13}
#MDMINSTANCEUUID=${14}

# Check if the ENV variable already exits. If it exists, then use it and prompt otherwise.
# Set the Env variable PGHOME.
if [ "${PGHOME}" = "X" ]
then
    echo "Specify the Postgres Home [/apps/PostgreSQL/9.1] : "
    read PGHOME
fi
if [ "${PGHOME}" = "X" ]
then 
    PGHOME=/apps/PostgreSQL/9.1
fi
PGSQL=${PGHOME}/bin/psql

# Set the Env variable PGHOST.
if [ "${PGHOST}" = "X" ]
then
    echo "Specify the Postgres Host [localhost] : "
    read PGHOST
fi
if [ "${PGHOST}" = "X" ]
then
    PGHOST=localhost
fi

# Set the Env variable PGPORT.
if [ "${PGPORT}" = "X" ]
then
    echo "Specify the Postgres Port [5432] : "
    read PGPORT
fi
if [ "${PGPORT}" = "X" ]
then
    PGPORT=5432
fi

# Set the Env variable PGDATABASE.
if [ "${PGDATABASE}" = "X" ]
then
    echo "Specify the Postgres Initial Database [postgres] : "
    read PGDATABASE
fi
if [ "${PGDATABASE}" = "X" ]
then
    PGDATABASE=postgres
fi

# Set the Env variable PGUSER.
if [ "${PGUSER}" = "X" ]
then
    echo "Specify the Postgres admin user [postgres] : "
    read PGUSER
fi
if [ "${PGUSER}" = "X" ]
then
    PGUSER=postgres
fi

# Set the Env variable PGPASSWORD.
if [ "${PGPASSWORD}" = "X" ]
then
    echo "Specify the Postgres admin user password : "
    read PGPASSWORD
fi
if [ "${PGPASSWORD}" = "X" ]
then
    PGPASSWORD=P1password1
fi

# Set the Env variable MDMDBUSER.
if [ "${MDMDBUSER}" = "X" ]
then
    echo "Specify the Postgres mdm user [mdmuser] : "
    read MDMDBUSER
fi
if [ "${MDMDBUSER}" = "X" ]
then
    MDMDBUSER=mdmuser
fi

# Set the Env variable MDMDBPASSWORD.
if [ "${MDMDBPASSWORD}" = "X" ]
then
    echo "Specify the Postgres mdm user password [mdmpassword] : "
    read MDMDBPASSWORD
fi
if [ "${MDMDBPASSWORD}" = "X" ]
then
    MDMDBPASSWORD=mdmpassword
fi

# Set the Env variable MDMDBSCHEMA
if [ "${MDMDBSCHEMA}" = "X" ]
then
    echo "Specify the Postgres mdm user schema [veloschema] : "
    read MDMDBSCHEMA
fi
if [ "${MDMDBSCHEMA}" = "X" ]
then
    MDMDBSCHEMA=veloschema
fi

# Set the Env variable MDMDBDATATBSSTORAGE.
if [ "${MDMDBDATATBSSTORAGE}" = "X" ]
then
    echo "Specify the storage for the Data tablespace for MDM database [${PGHOME}/tablespaces/velodbdata] : "
    read MDMDBDATATBSSTORAGE
fi
if [ "${MDMDBDATATBSSTORAGE}" = "X" ]
then
    MDMDBDATATBSSTORAGE=${PGHOME}/tablespaces/velodbdata
fi

# Set the Env variable MDMDBINDEXTBSSTORAGE.
if [ "${MDMDBINDEXTBSSTORAGE}" = "X" ]
then
    echo "Specify the storage for the Index tablespace for MDM database [${PGHOME}/tablespaces/velodbindx] : "
    read MDMDBINDEXTBSSTORAGE
fi
if [ "${MDMDBINDEXTBSSTORAGE}" = "X" ]
then 
    MDMDBINDEXTBSSTORAGE=${PGHOME}/tablespaces/velodbindx
fi
# Set the Env variable PGHOST.
if [ "${MDMINSTANCENAME}" = "X" ]
then
    echo "Specify the name for the MDM instance :"
    read MDMINSTANCENAME

fi
# Set the Env variable PGHOST.
if [ "${MDMINSTANCEDESCRIPTION}" = "X" ]
then
    echo "Specify the Description for the MDM instance :"
    read MDMINSTANCEDESCRIPTION
fi


# delete the existing log file.
rm -f "${LOGGER}*"

echo "---------------------------------------------------"    > "${LOGGER}"
echo "Using PGHOME=${PGHOME}"                                 >> "${LOGGER}"
echo "Using PGSQL=${PGSQL}"                                   >> "${LOGGER}"
echo "Using PGHOST=${PGHOST}"                                 >> "${LOGGER}"
echo "Using PGPORT=${PGPORT}"                                 >> "${LOGGER}"
echo "Using PGDATABASE=${PGDATABASE}"                         >> "${LOGGER}"
echo "Using PGUSER=${PGUSER}"                                 >> "${LOGGER}"
echo "Using MDMDBUSER=${MDMDBUSER}"                           >> "${LOGGER}"
echo "Using MDMDBSCHEMA=${MDMDBSCHEMA}"                       >> "${LOGGER}"
echo "Using MDMDBDATATBSSTORAGE=${MDMDBDATATBSSTORAGE}"       >>"${LOGGER}"
echo "Using MDMDBINDEXTBSSTORAGE=${MDMDBINDEXTBSSTORAGE}"     >> "${LOGGER}"
echo "Using MDMINSTANCENAME=${MDMINSTANCENAME}"               >>"${LOGGER}"
echo "Using MDMINSTANCEDESCRIPTION=${MDMINSTANCEDESCRIPTION}" >> "${LOGGER}"
echo "---------------------------------------------------"    >> "${LOGGER}"

# EXPORT ENV variables.
export PGHOME="${PGHOME}"
export PGSQL="${PGSQL}"
export PGHOST="${PGHOST}"
export PGPORT="${PGPORT}"
export PGDATABASE="${PGDATABASE}"
export PGUSER="${PGUSER}"
export PGPASSWORD="${PGPASSWORD}"
export MDMDBUSER="${MDMDBUSER}"
export MDMDBPASSWORD="${MDMDBPASSWORD}"
export MDMDBSCHEMA="${MDMDBSCHEMA}"
export MDMDBDATATBSSTORAGE="${MDMDBDATATBSSTORAGE}"
export MDMDBINDEXTBSSTORAGE="${MDMDBINDEXTBSSTORAGE}"
export MDMINSTANCENAME="${MDMINSTANCENAME}"
export MDMINSTANCEDESCRIPTION="${MDMINSTANCEDESCRIPTION}"
export LOGGER="${LOGGER}"

if [ "$MQ_ON_TROPOS" = "true" ]
then
    echo "Replacing the string VELODBDATA,VELODBINDX with '' "
    # making replacements in the PGSQL DB scripts.
    sed -i 's/TABLESPACE VELODBDATA;/;/' ./scripts/ddl/create_tables.sql
    sed -i 's/TABLESPACE VELODBINDX;/;/' ./scripts/ddl/create_indexes.sql
    sed -i 's/USING INDEX TABLESPACE VELODBINDX;/;/' ./scripts/ddl/create_PK.sql
else 
    echo "skipping of replacing the string VELODBDATA,VELODBINDX with '' "
fi

echo "before generate_create_tablespaces_sql"
echo "if ! test -n $MQ_ON_TROPOS "

if ! test -n "$MQ_ON_TROPOS"
then
echo "inside generate_create_tablespaces_sql"
    ./generate_create_tablespaces_sql.sh
    "${PGSQL}" -ef ./../configure/create_tablespaces.sql >> "${LOGGER}"
fi
echo "After generate_create_tablespaces_sql"

./generate_create_users_sql.sh
"${PGSQL}" -ef ./../configure/create_users.sql >> "${LOGGER}"

if ! test -n "$MQ_ON_TROPOS"
then
    ./generate_create_database_sql.sh
    "${PGSQL}" -ef ./../configure/create_database.sql >> "${LOGGER}"
    
    # Switch to VELODB.
    export PGDATABASE=velodb
fi

./generate_create_schema_sql.sh
"${PGSQL}" -ef ./../configure/create_schema.sql >> "${LOGGER}"

# Create the required extentions.
"${PGSQL}" -ef ./../configure/create_extentions.sql >> "${LOGGER}"

# Switch to MDMDBUSER.
export PGUSER=${MDMDBUSER}
export PGPASSWORD=${MDMDBPASSWORD}

./generate_create_alter_searchpath_sql.sh
"${PGSQL}" -ef ./../configure/alter_searchpath.sql >> "${LOGGER}"


# if [ "X${MDMINSTANCEUUID}" == "X" ]
#     then
#         echo "Name:$MDMINSTANCENAME">$MQ_HOME/db/postgreSQL/install/mdmInstance.prop
#         echo "description:$MDMINSTANCEDESCRIPTION">>$MQ_HOME/db/postgreSQL/install/mdmInstance.prop
#         echo "filePAth:db/postgreSQL/install">>$MQ_HOME/db/postgreSQL/install/mdmInstance.prop
# 
#         . $MQ_HOME/db/postgreSQL/install/entryForMDMInstance.sh "$MQ_HOME"/db/postgreSQL/install/mdmInstance.prop
#     else
#         echo "Insert into MDMINSTANCE  (ID, NAME, DESCRIPTION) VALUES('$MDMINSTANCEUUID','$MDMINSTANCENAME','$MDMINSTANCEDESCRIPTION');" >./MDMInstance.sql
#         echo "COMMIT; ">>./MDMInstance.sql
# fi

echo "Insert into MDMINSTANCE  (ID, NAME, DESCRIPTION) VALUES (gen_random_uuid(),'$MDMINSTANCENAME','$MDMINSTANCEDESCRIPTION');" >./MDMInstance.sql
echo "COMMIT; ">>./MDMInstance.sql

./insert_seeddata.sh
