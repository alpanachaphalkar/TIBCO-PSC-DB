SQLFILE=./../configure/create_users.sql
echo "-- Copyright (c) 2000-2009 TIBCO Software Inc. All Rights Reserved." > "${SQLFILE}"
echo "--  This work is subject  to  U.S. and  international  copyright  laws  and" >> "${SQLFILE}"
echo "--     treaties. No part  of  this  work may be  used,  practiced,  performed" >> "${SQLFILE}"
echo "--     copied, distributed, revised, modified, translated,  abridged, condensed," >> "${SQLFILE}"
echo "--     expanded,  collected,  compiled,  linked,  recast, transformed or adapted" >> "${SQLFILE}"
echo "--     without the prior written consent of TIBCO Software Inc. any use or" >> "${SQLFILE}"
echo "--     exploitation of this work without authorization could subject the" >> "${SQLFILE}"
echo "--     perpetrator to criminal and civil liability." >> "${SQLFILE}"
echo "--" >> "${SQLFILE}"
echo "-- Note - Please DO NOT edit the script." >> "${SQLFILE}"

if ! test -n "$MQ_ON_TROPOS"
then
    echo "DROP ROLE IF EXISTS ${MDMDBUSER};"                                                                  >> "${SQLFILE}"
fi

echo "CREATE ROLE ${MDMDBUSER} PASSWORD '${MDMDBPASSWORD}' NOSUPERUSER NOCREATEDB CREATEROLE INHERIT LOGIN;" >> "${SQLFILE}"

if ! test -n "$MQ_ON_TROPOS"
then
    echo "GRANT ALL PRIVILEGES ON TABLESPACE velodbdata TO ${MDMDBUSER} WITH GRANT OPTION;"                  >> "${SQLFILE}"
    echo "GRANT ALL PRIVILEGES ON TABLESPACE velodbindx TO ${MDMDBUSER} WITH GRANT OPTION;"                  >> "${SQLFILE}"
fi

SQLFILE=
