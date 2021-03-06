#!/bin/bash

#
# Rotate dump in a folder keeping the number you want to have stored.
#
# author: Piergiorgio Faraglia (http://piergiorgiofaraglia.it)
#

###############################################################################
# Dependencies
###############################################################################

# bc

###############################################################################
# Variables
###############################################################################

# Set your db dump folder
BASEDIR="";

# Set maximum number of dump you want stored in folder
KEEP_ALIVE_DUMPS=10;

###############################################################################
# Execution
###############################################################################
NUM_DUMPS=`ls -1 "${BASEDIR}" | wc -l`
DUMP_TO_DELETE=$(echo "${NUM_DUMPS}-${KEEP_ALIVE_DUMPS}"|bc)

echo "`date +%Y%m%d%H%M%S` - BEGIN execution.";

if [ $DUMP_TO_DELETE -eq 0 ]; then
    echo "`date +%Y%m%d%H%M%S` - No exceeded dump found. Nothing to delete."
    exit
fi

for i in `ls -1 ${BASEDIR} | head -${DUMP_TO_DELETE}`; do
    echo "`date +%Y%m%d%H%M%S` - removing item: ${BASEDIR}$i"
    rm -v "${BASEDIR}$i"
done

echo "`date +%Y%m%d%H%M%S` - END execution.";
echo "";
