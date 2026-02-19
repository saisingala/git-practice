#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You need root privilages"
    exit 1
fi

SRC_DIR=/home/ec2-user/logs

if [ -d $SRC_DIR ]
then echo "$SRC_DIR direcory is present"
     
else     
    echo "$SRC_DIR direcory is not present"
    exit 1
fi

FILES=$(find $SRC_DIR -name "*.log" -mtime +10)

echo "Files: $FILES"

while IFS= read -r line # IFS internal field separator, empty it will ignore while space. -r for not  to ignore special characters like /#
do
   echo "Deleting line : $line"
   rm -rf
done <<< $FILES


