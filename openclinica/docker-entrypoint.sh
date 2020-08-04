#!/bin/bash -x

# set up a properties based on environment
function set_properties {
    : "${DEFAULT_LOCALE:=en}"
    : "${DBSERVER:=db}"
    : "${DBPORT:=5432}"
    : "${DBUSER:=clinica}"
    : "${DBNAME:=${DBUSER}}"
    : "${DBPASS:=${DBUSER}}"

}

set_properties
exec /usr/local/tomcat/bin/catalina.sh run
