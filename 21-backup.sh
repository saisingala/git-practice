#!bin/bash

SRC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #this is optional if user provides ok otherwise it will take 14 days

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$G Usage $Y <Source> <Destination> <DAYS optional>$N"
}

#CHECK THE SOURCE AND DESTINATION ARE PROVIDED

if [ $# -lt 2 ] # or we can write -z is empty or not
then
    USAGE
fi

if [ ! -d $SRC_DIR ]
then 
   echo -e "$SRC_DIR $R not exists.. $N please check"
fi

if [ ! -d $DEST_DIR ]
then 
   echo -e "$DEST_DIR $R not exists.. $N please check"
fi

FILES=$(find ${SRC_DIR} -name "*.log" -mtime $DAYS)

if [ -n $FILES ]
then
   echo " Files are found"
else
    echo "No files is older than $DAYS found"
fi