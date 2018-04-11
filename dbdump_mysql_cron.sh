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

# Set your username
db_user='';

# Set your password
db_pass='';

# Set your system's path where store dumps (add final /)
dumps_dir="";

# Set your dump command
dump_command_path='/usr/bin/mysqldump';

# Set your compression command
zip_command_path='/bin/gzip';

###############################################################################
# Execution
###############################################################################

# Get the current datatime
CURRENT_DATETIME=`date +%Y%m%d%H%M%S`;

echo "`date +%Y%m%d%H%M%S` - BEGIN execution.";

dump_name="${CURRENT_DATETIME}.${db_name}.dump.sql";
dump_path="${dumps_dir}${dump_name}";

# Database's dump
"${dump_command_path}" --single-transaction -u "${db_user}" -p${db_pass} "${db_name}" > "${dump_path}";
echo "`date +%Y%m%d%H%M%S` - Dumped db with command: ${dump_command_path} --single-transaction -u ${db_user} ${db_name} > ${dump_path}";

# Dump compression using gzip
${zip_command_path} "${dump_path}";
echo "`date +%Y%m%d%H%M%S` - Compressing dump with command: ${zip_command_path} ${dump_path}";

echo "`date +%Y%m%d%H%M%S` - END execution.";
echo ""
