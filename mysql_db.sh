#!/bin/bash
DB_USER=test
DB_PASSWD=testpass
MAINDB=testdb
MAINDB1=test1db

# Create first database
mysql --user=$DB_USER --password=$DB_PASSWD << EOF 
CREATE DATABASE $MAINDB;
CREATE DATABASE $MAINDB1;
EOF
