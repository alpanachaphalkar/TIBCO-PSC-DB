#!/bin/sh

mkdir -p "${JAVA_HOME}" "${MQ_HOME}"

echo "------------------------- Downloading PSC JAVA_HOME ZIP -------------------------"
curl --location --request GET "${JFROG_PSC_JAVA_HOME_URL}" --header "${JFROG_BASIC_AUTH_HEADER}" --output "${JAVA_HOME}.zip"
echo "------------------------- Finished Downloading PSC JAVA_HOME ZIP -------------------------"

echo "------------------------- Downloading PSC MQ_HOME ZIP -------------------------"
curl --location --request GET "${JFROG_PSC_MQ_HOME_URL}" --header "${JFROG_BASIC_AUTH_HEADER}" --output "${MQ_HOME}.zip"
echo "------------------------- Finished Downloading PSC MQ_HOME ZIP -------------------------"

echo "------------------------- Extracting PSC JAVA_HOME ZIP -------------------------"
unzip "${JAVA_HOME}.zip" -d "/psc-data" && rm "${JAVA_HOME}.zip"
echo "------------------------- Finished Extracting PSC JAVA_HOME ZIP -------------------------"

echo "------------------------- Extracting PSC MQ_HOME ZIP -------------------------"
unzip "${MQ_HOME}.zip" -d "/psc-data" && rm "${MQ_HOME}.zip"
echo "------------------------- Finished Extracting PSC MQ_HOME ZIP -------------------------"