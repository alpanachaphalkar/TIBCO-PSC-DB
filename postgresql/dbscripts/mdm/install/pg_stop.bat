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

REM Stop the running server.
"%PGHOME%\bin\pg_ctl" stop -D "%PGDATA%" -m i

IF %ERRORLEVEL% GTR 0 goto :FAILED

ECHO PostgreSQL Server stopped successfully!
goto :EOF

:FAILED
ECHO Failed to stop PostgreSQL Server!

:EOF
 