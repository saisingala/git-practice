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

if [ $# -lt 2 ]
then
    USAGE
fi
