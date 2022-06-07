@ECHO OFF

REM USAGE : install.bat "C:\Apps\PostgreSQL\9.1" HostName Port DBName AdminUser AdminPassword MDMDBUser password DataTablespacePath  IndexTablespacePath MDM_Instnacename MDM_InstanceDesc

SET LOGGER=./logs/DbSetup_Ouputs.log

REM Clear off the previously set variables.
SET PGHOME=
SET PGHOST=
SET PGPORT=
SET PGDATABASE=
SET PGUSER=
SET PGPASSWORD=
SET MDMDBUSER=
SET MDMDBPASSWORD=
SET MDMDBSCHEMA=
SET MDMDBDATATBSSTORAGE=
SET MDMDBINDEXTBSSTORAGE=

SET MDMINSTANCENAME=
SET MDMINSTANCEDESCRIPTION=
SET MDMINSTANCEUUID=

SET PGHOME=%1
SET PGHOST=%2
SET PGPORT=%3
SET PGDATABASE=%4
SET PGUSER=%5
SET PGPASSWORD=%6
SET MDMDBUSER=%7
SET MDMDBPASSWORD=%8
SET MDMDBSCHEMA=%9
REM DOS has limitation of 9 args so it needs to be shifted.
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SET MDMDBDATATBSSTORAGE=%1
SET MDMDBINDEXTBSSTORAGE=%2
SET MDMINSTANCENAME=%3
SET MDMINSTANCEDESCRIPTION=%4
SET MDMINSTANCEUUID=%5

REM Check if the ENV variable already exits. If it exists, then use it and prompt otherwise.
REM Set the Env variable PGHOME.
IF "X%PGHOME%" == "X" (
    ECHO Specify the Postgres Home Directory [.\..\..\..\bin\pgsql] : 
    SET /p PGHOME=
)
IF "X%PGHOME%" == "X" ( 
    SET PGHOME=.\..\..\..\bin\pgsql
)
SET PGSQL=%PGHOME%\bin\psql.exe

REM pushd/popd to get the abs path.
PUSHD .
CD "%PGHOME%"
SET PGHOME=%CD%
POPD

REM Set the Env variable PGHOST.
IF "X%PGHOST%" == "X" (
    ECHO Specify the Postgres Host [localhost] : 
    SET /p PGHOST=
)
IF "X%PGHOST%" == "X" ( 
    SET PGHOST=localhost
)

REM Set the Env variable PGPORT.
IF "X%PGPORT%" == "X" (
    ECHO Specify the Postgres Port [5432] : 
    SET /p PGPORT=
)
IF "X%PGPORT%" == "X" (
    SET PGPORT=5432
)

REM Set the Env variable PGDATABASE.
IF "X%PGDATABASE%" == "X" (
    ECHO Specify the Postgres Initial Database [postgres] : 
    SET /p PGDATABASE=
)
IF "X%PGDATABASE%" == "X" (
    SET PGDATABASE=postgres
)

REM Set the Env variable PGUSER.
IF "X%PGUSER%" == "X" (
    ECHO Specify the Postgres admin user [postgres] : 
    SET /p PGUSER=
)
IF "X%PGUSER%" == "X" (
    SET PGUSER=postgres
)

REM Set the Env variable PGPASSWORD.
IF "X%PGPASSWORD%" == "X" (
    ECHO Specify the Postgres admin user password : 
    SET /p PGPASSWORD=
)
IF "X%PGPASSWORD%" == "X" ( 
    SET PGPASSWORD=P1password1
)

REM Set the Env variable MDMDBUSER.
IF "X%MDMDBUSER%" == "X" (
    ECHO Specify the Postgres mdm user [mdmuser] : 
    SET /p MDMDBUSER=
)
IF "X%MDMDBUSER%" == "X" ( 
    SET MDMDBUSER=mdmuser
)

REM Set the Env variable MDMDBPASSWORD.
IF "X%MDMDBPASSWORD%" == "X" (
    ECHO Specify the Postgres mdm user password [mdmpassword] : 
    SET /p MDMDBPASSWORD=
)
IF "X%MDMDBPASSWORD%" == "X" ( 
    SET MDMDBPASSWORD=mdmpassword
)

REM Set the Env variable MDMDBSCHEMA.
IF "X%MDMDBSCHEMA%" == "X" (
    ECHO Specify the Postgres mdm user schema [veloschema] : 
    SET /p MDMDBSCHEMA=
)
IF "X%MDMDBSCHEMA%" == "X" ( 
    SET MDMDBSCHEMA=veloschema
)

REM Set the Env variable MDMDBDATATBSSTORAGE.
IF "X%MDMDBDATATBSSTORAGE%" == "X" (
    ECHO Specify the storage for the Data tablespace for MDM database [%PGHOME%\tablespaces\velodbdata] : 
    SET /p MDMDBDATATBSSTORAGE=
)
IF "X%MDMDBDATATBSSTORAGE%" == "X" ( 
    SET MDMDBDATATBSSTORAGE=%PGHOME%\tablespaces\velodbdata
)
IF NOT EXIST "%MDMDBDATATBSSTORAGE%" (
    ECHO Creating the missing directory "%MDMDBDATATBSSTORAGE%"
    MKDIR "%MDMDBDATATBSSTORAGE%"
)
CACLS "%MDMDBDATATBSSTORAGE%" /T /E /P %USERNAME%:F

REM Set the Env variable MDMDBINDEXTBSSTORAGE.
IF "X%MDMDBINDEXTBSSTORAGE%" == "X" (
    ECHO Specify the storage for the Index tablespace for MDM database [%PGHOME%\tablespaces\velodbindx] : 
    SET /p MDMDBINDEXTBSSTORAGE=
)
IF "X%MDMDBINDEXTBSSTORAGE%" == "X" ( 
    SET MDMDBINDEXTBSSTORAGE=%PGHOME%\tablespaces\velodbindx
)
IF NOT EXIST "%MDMDBINDEXTBSSTORAGE%" (
    ECHO Creating the missing directory "%MDMDBINDEXTBSSTORAGE%"
    MKDIR "%MDMDBINDEXTBSSTORAGE%"
)
CACLS "%MDMDBINDEXTBSSTORAGE%" /T /E /P %USERNAME%:F

IF "X%MDMINSTANCENAME%" == "X" ( 
    ECHO Specify the name for the MDM instance :    
    SET /p MDMINSTANCENAME=
)

IF "X%MDMINSTANCEDESCRIPTION%" == "X" ( 
    ECHO Specify the Description for the MDM instance :  
    SET /p MDMINSTANCEDESCRIPTION=
)

ECHO ----------------------------------------------------   > %LOGGER%
ECHO Using PGHOME=%PGHOME%                                  >> %LOGGER%
ECHO Using PGSQL=%PGSQL%                                    >> %LOGGER%  
ECHO Using PGHOST=%PGHOST%                                  >> %LOGGER%  
ECHO Using PGPORT=%PGPORT%                                  >> %LOGGER%  
ECHO Using PGDATABASE=%PGDATABASE%                          >> %LOGGER%  
ECHO Using PGUSER=%PGUSER%                                  >> %LOGGER%   
ECHO Using MDMDBUSER=%MDMDBUSER%                            >> %LOGGER%  
ECHO Using MDMDBSCHEMA=%MDMDBSCHEMA%                        >> %LOGGER%  
ECHO Using MDMDBDATATBSSTORAGE=%MDMDBDATATBSSTORAGE%        >> %LOGGER%
ECHO Using MDMDBINDEXTBSSTORAGE=%MDMDBINDEXTBSSTORAGE%      >> %LOGGER%
ECHO Using MDMINSTANCENAME=%MDMINSTANCENAME%                >> %LOGGER%
ECHO Using MDMINSTANCEDESCRIPTION=%MDMINSTANCEDESCRIPTION%  >> %LOGGER%

ECHO ----------------------------------------------------   >> %LOGGER%

if %MQ_ON_TROPOS%X==X (
    CALL generate_create_tablespaces_sql.bat
    "%PGSQL%" -ef ./../configure/create_tablespaces.sql     >> %LOGGER%
)

CALL generate_create_users_sql.bat
"%PGSQL%" -ef ./../configure/create_users.sql               >> %LOGGER%

if %MQ_ON_TROPOS%X==X (
    CALL generate_create_database_sql.bat
    "%PGSQL%" -ef ./../configure/create_database.sql        >> %LOGGER%

    REM Switch to VELODB.
    SET PGDATABASE=velodb
)

CALL generate_create_schema_sql.bat
"%PGSQL%" -ef ./../configure/create_schema.sql              >> %LOGGER%

REM Create the required extentions.
"%PGSQL%" -ef ./../configure/create_extentions.sql          >> %LOGGER%

REM Switch to MDMDBUSER.
SET PGUSER=%MDMDBUSER%
SET PGPASSWORD=%MDMDBPASSWORD%

CALL generate_create_alter_searchpath_sql.bat
"%PGSQL%" -ef ./../configure/alter_searchpath.sql           >> %LOGGER%

IF "X%MDMINSTANCEUUID%" == "X" ( 

    ECHO Name:%MDMINSTANCENAME%>%MQ_HOME%/db/postgreSQL/install/mdmInstance.prop
    ECHO description:%MDMINSTANCEDESCRIPTION%>>%MQ_HOME%/db/postgreSQL/install/mdmInstance.prop
    ECHO filePAth:db/postgreSQL/install>>%MQ_HOME%/db/postgreSQL/install/mdmInstance.prop
    call "%MQ_HOME%"/db/postgreSQL/install/entryForMDMInstance.bat "%MQ_HOME%"/db/postgreSQL/install/mdmInstance.prop

) ELSE (
    echo Insert into MDMINSTANCE  ^(ID, NAME, DESCRIPTION^) VALUES ^( '%MDMINSTANCEUUID%' , '%MDMINSTANCENAME%' , '%MDMINSTANCEDESCRIPTION%' ^); >./MDMInstance.sql
    ECHO COMMIT; >>./MDMInstance.sql
)

CALL insert_seeddata.bat
