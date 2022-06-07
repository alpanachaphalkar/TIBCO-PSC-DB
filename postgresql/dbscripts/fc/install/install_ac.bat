@ECHO OFF

REM Clear off the previously set variables.
SET LOGGER=./logs/DbSetup_Ouputs.log


SET PGHOME=
SET PGHOST=
SET PGPORT=
SET PGDATABASE=
SET PGUSER=
SET PGPASSWORD=

SET PGHOME=%1%
SET PGHOST=%2%
SET PGPORT=%3%
SET PGDATABASE=%4%
SET PGUSER=%5%
SET PGPASSWORD=%6%


ECHO ----------------------------------------------------
ECHO Using PGHOME=%PGHOME%                
ECHO Using PGSQL=%PGSQL%                              
ECHO Using PGHOST=%PGHOST%                               
ECHO Using PGPORT=%PGPORT%                                 
ECHO Using PGDATABASE=%PGDATABASE%                       
ECHO Using PGUSER=%PGUSER%                            
ECHO ---------------------------------------------------- 

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
	ECHO Specify the  Postgres MDM Database [velodb] : 
	SET /p PGDATABASE=
)

IF "X%PGDATABASE%" == "X" (
	SET PGDATABASE=velodb
)
REM Set the Env variable PGUSER.
IF "X%PGUSER%" == "X" (
	ECHO Specify the Postgres MDM user : 
	SET /p PGUSER=
)


REM Set the Env variable PGPASSWORD.
IF "X%PGPASSWORD%" == "X" (
	ECHO Specify the Postgres MDM user password : 
	SET /p PGPASSWORD=
)

ECHO ---------------------------------------------------- > %LOGGER%  
ECHO Using PGHOME=%PGHOME%    >> %LOGGER%                                
ECHO Using PGSQL=%PGSQL%      >> %LOGGER%                               
ECHO Using PGHOST=%PGHOST%    >> %LOGGER%                               
ECHO Using PGPORT=%PGPORT%    >> %LOGGER%                                 
ECHO Using PGDATABASE=%PGDATABASE%    >> %LOGGER%                       
ECHO Using PGUSER=%PGUSER%        >> %LOGGER%                            
ECHO ---------------------------------------------------- >> %LOGGER% 


"%PGSQL%" -ef ./install_ac.sql >> %LOGGER% 

echo Script executed successfully. Please check the logs.

 REM EXIT
