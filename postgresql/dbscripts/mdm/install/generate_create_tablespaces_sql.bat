SET SQLFILE=./../configure/create_tablespaces.sql

echo -- Copyright (c) 2000-2009 TIBCO Software Inc. All Rights Reserved.                > %SQLFILE%
echo --  This work is subject  to  U.S. and  international  copyright  laws  and        >> %SQLFILE%
echo --     treaties. No part  of  this  work may be  used,  practiced,  performed      >> %SQLFILE%
echo --     copied, distributed, revised, modified, translated,  abridged, condensed,   >> %SQLFILE%
echo --     expanded,  collected,  compiled,  linked,  recast, transformed or adapted   >> %SQLFILE%
echo --     without the prior written consent of TIBCO Software Inc. any use or         >> %SQLFILE%
echo --     exploitation of this work without authorization could subject the           >> %SQLFILE%
echo --     perpetrator to criminal and civil liability.                                >> %SQLFILE%
echo --                                                                                 >> %SQLFILE%
echo -- Note   : Please DO NOT edit the script.                                         >> %SQLFILE%

if %MQ_ON_TROPOS%X==X (
    echo DROP TABLESPACE IF EXISTS velodbdata;                                          >> %SQLFILE%
    echo DROP TABLESPACE IF EXISTS velodbindx;                                          >> %SQLFILE%
    echo CREATE TABLESPACE velodbdata LOCATION '%MDMDBDATATBSSTORAGE%';      		>> %SQLFILE%
    echo CREATE TABLESPACE velodbindx LOCATION '%MDMDBINDEXTBSSTORAGE%';     		>> %SQLFILE% 
)

SET SQLFILE=
