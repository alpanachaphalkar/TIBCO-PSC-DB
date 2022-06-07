@ECHO OFF

REM Environment variables for PostgreSQL Init

SET PGHOME=%1
IF "X%PGHOME%" == "X" (
    SET PGHOME=.
)

SET PATH="%PGHOME%\bin";%PATH%

SET PGDATA=%PGHOME%\data

SET PGDATABASE=postgres

SET PGUSER=%USERNAME%

SET PGPORT=5432

SET PGLOCALEDIR=%PGHOME%\share\locale

REM Stop running server.
IF EXIST "%PGDATA%/postmaster.pid" (
    "%PGHOME%\bin\pg_ctl" stop -D "%PGDATA%" 
)
	
REM Delete existing data files.
IF EXIST "%PGDATA%" (
	RD /s /q "%PGDATA%"
    DEL "%PGHOME%\startup.log"
)

REM - Initialize the database.
"%PGHOME%\bin\initdb" -E UTF8 -U %USERNAME% -A trust

REM - Start the server.
"%PGHOME%\bin\pg_ctl" start -D "%PGDATA%" -l "%PGHOME%\startup.log" -w 

IF %ERRORLEVEL% GTR 0 goto :FAILED

ECHO PostgreSQL Server started successfully!
goto :EOF

:FAILED
ECHO Failed to Start PostgreSQL Server!

:EOF