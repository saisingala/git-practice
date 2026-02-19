#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You need root privilages"
    exit 1
fi

SRC_DIR=/home/ec2-user/git-practice/logs

if [ -d $SRC_DIR ]
then echo "$SRC_DIR direcory is present"
     
else     
    echo "$SRC_DIR direcory is not present"
    exit 1
fi

FILES=$(find $SRC_DIR -name *.log -mtime -10 exec ls -lrt {} \;)

echo "$FILES"