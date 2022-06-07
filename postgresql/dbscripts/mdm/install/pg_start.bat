@ECHO OFF

REM Environment variables for PostgreSQL

SET PGHOME_INLINE=%1

IF NOT "X%PGHOME_INLINE%" == "X" (
    SET PGHOME=%PGHOME_INLINE%
)

IF "X%PGHOME%" == "X" (
    SET PGHOME=..\..\..\bin\pgsql
)

SET PATH="%PGHOME%\bin";%PATH%

SET PGDATA=%PGHOME%\data

REM - Start the server.
"%PGHOME%\bin\pg_ctl" start -D "%PGDATA%" -l "%PGHOME%\startup.log" -w 

IF %ERRORLEVEL% GTR 0 goto :FAILED

ECHO PostgreSQL Server started successfully!
goto :EOF

:FAILED
ECHO Failed to Start PostgreSQL Server!

:EOF