
printUsage(){
	echo
	echo ====================== USAGE ===========================
	echo Usage: "<entryForMDMInstance>  <PATH_TO_CREATE>"
	echo --------------------------------------------------------
}

PROPFILENAME=$1; 
export PROPFILENAME;

if [ -z "$PROPFILENAME" ]; then
	printUsage;
	exit ;
fi

$JAVA_HOME/bin/java -classpath "$MQ_HOME"/lib/mq/ECMClasses.jar -DMQ_HOME="$MQ_HOME" com.tibco.mdm.infrastructure.propertymgr.UUIDGenForDBInstance $PROPFILENAME

exit;
