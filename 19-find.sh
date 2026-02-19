#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You need root privilages"
    exit 1
fi

SRC_DIR=/var/log/sai

if [ ! -d $SRC_DIR ]
then echo "Mentioned direcory is not present"
     exit 1
else     
    echo "Mentioned direcory is present"
fi

FILES=$(find $SRC_DIR -mtime -10)

echo "$FILES"