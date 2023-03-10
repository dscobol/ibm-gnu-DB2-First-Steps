#!/bin/bash
# Compile script

# This is changed to the name of the program to compile
PGM=CONNDB

# Copylib
export SQLCOPY="$DB2_HOME/include/cobol_mf"
export COBCOPY="$SQLCOPY"
# DB2 Load Libraries
export LOADLIB="$DB2_HOME/lib64"

# Clean Up
rm $PGM
rm $PGM.bnd
rm $PGM.cbl

# Run the DB2 prep and bind
db2 -tvf $PGM.sql

# Pause to read the messages from prep and bind
read -n1 -r -p "Press any key to continue..." key

# Compile
cobc -std=default -x $PGM.cbl -static -I $COBCOPY -L $LOADLIB -l db2 -v -O 

if [ "$?" -eq 0 ]; then
    echo "Complier Return code was ZERO."
else
    echo "Complier Return code not ZERO."
fi