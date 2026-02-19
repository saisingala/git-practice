#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You need root privilages"
    exit 1
fi

SRC_DIR=/home/ec2-user/git-practice
if [ ! -d $SRC_DIR ]
then echo "Mentioned direcory is not present"
     exit 1
else     
    echo "Mentioned direcory is present"
fi

FILES=$(find $SRC_DIR -type f *.log -mtime -10)

echo "$FILES"