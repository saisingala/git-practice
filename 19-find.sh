#!bin/bash
SRC_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SRC_DIR ]
then echo -e "$SRC_DIR $G is exists $N"
     
else     
    echo -e "$SRC_DIR $R is not exists $N"
    exit 1
fi

FILES=$(find ${SRC_DIR} -name "*.log" -mtime +1)

echo "Files: $FILES"

while IFS= read -r file # IFS internal field separator, empty it will ignore while space. -r for not  to ignore special characters like /#
do
   echo "Deleting file : $file"
   rm -rf $file
done <<< $FILES


