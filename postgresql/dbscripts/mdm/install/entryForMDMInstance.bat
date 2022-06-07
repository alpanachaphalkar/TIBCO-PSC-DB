@echo off

SET PROPFILENAME=%1

IF "X%PROPFILENAME%" == "X" (
	goto printUsage
)


"%JAVA_HOME%\bin\java" -classpath "%MQ_HOME%"/lib/mq/ECMClasses.jar -DMQ_HOME="%MQ_HOME%" com.tibco.mdm.infrastructure.propertymgr.UUIDGenForDBInstance %PROPFILENAME%


GOTO :EOF

:printUsage
echo.
echo ====================== USAGE ===========================
echo Usage: "<entryForMDMInstance> <PATH_TO_CREATE>"
echo --------------------------------------------------------
GOTO :EOF