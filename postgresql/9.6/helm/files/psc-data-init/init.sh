#!/bin/sh

echo "------------------------- Downloading PSC JAVA_HOME ZIP -------------------------";
curl --location --request GET "${JFROG_PSC_JAVA_HOME_URL}" --header "${JFROG_BASIC_AUTH_HEADER}" --output "/repo/psc-data/psc-java-home.zip";
echo "------------------------- Finished Downloading PSC JAVA_HOME ZIP -------------------------";
echo "------------------------- Downloading PSC MQ_HOME ZIP -------------------------";
curl --location --request GET "${JFROG_PSC_MQ_HOME_URL}" --header "${JFROG_BASIC_AUTH_HEADER}" --output "/repo/psc-data/psc-mq-home.zip";
echo "------------------------- Finished Downloading PSC MQ_HOME ZIP -------------------------";
echo "------------------------- Extracting PSC JAVA_HOME ZIP -------------------------";
mkdir -p "${JAVA_HOME}" "${MQ_HOME}";
unzip /repo/psc-data/psc-java-home.zip -d "${JAVA_HOME}";
echo "------------------------- Finished Extracting PSC JAVA_HOME ZIP -------------------------";
echo "------------------------- Extracting PSC MQ_HOME ZIP -------------------------";
unzip /repo/psc-data/psc-mq-home.zip -d "${MQ_HOME}";
echo "------------------------- Finished Extracting PSC MQ_HOME ZIP -------------------------";