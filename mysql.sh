#!/bin/bash
DB_USER=logging 
DB_PASSWD=AO6fQd69 
DB_NAME=logging


#
touch file.sql

# 
ps -e -o command >> file.sql
var=$(<file.sql)

# Import file to mysql 
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO info (timestamp, processes) VALUES (now(), "$var");
EOF

# Clean up file
true > file.sql
