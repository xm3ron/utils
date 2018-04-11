#!/bin/bash

#
# This script dumps your database in a folder on your server.
# 
# Set your cron to schedule dump periodically
#

###############################################################################
# Variables
###############################################################################

# Set your database name 
db_name='';

# Set your system's path where store dumps
dumps_dir="";

# Set your dump command
dump_command_path='/usr/bin/pg_dump';

# Set your compression command
zip_command_path='/bin/gzip';

###############################################################################
# Execution
###############################################################################

# Get the current datatime
CURRENT_DATETIME=`date +%Y%m%d%H%M%S`;

dump_name="${CURRENT_DATETIME}.${db_name}.dump.sql";
dump_path="${dumps_dir}${dump_name}";

# Database's dump
"${dump_command_path}" "${db_name}" > "${dump_path}";

# Dump compression using gzip
${zip_command_path} "${dump_path}";
