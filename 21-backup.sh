#!/bin/bash

SRC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #this is optional if user provides ok otherwise it will take 14 days
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)

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

FILES=$(find ${SRC_DIR} -name "*.log" -mtime +$DAYS)

echo "files: $FILES"

if [ ! -z "$FILES" ] #true if files are empty,! makes expression false
then
   echo " Files are found"
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   find ${SRC_DIR} -name "*.log" -mtime +$DAYS| zip "$ZIP_FILE" -@

   #check if zip file is created or not
   if [ -f $ZIP_FILE ]
   then
       echo "Successfully zipped files older than $DAYS"
       while IFS= read -r file # IFS internal field separator, empty it will ignore while space. -r for not  to ignore special characters like /#
          do
             echo "Deleting file : $file"
            rm -rf $file
          done <<< "$FILES"
    else
       echo -e "Zipping the files is $R Failed $N" 
       exit 1 
   fi  

else
    echo "No files is older than $DAYS"
fi



# SRC_DIR="$1"
# DEST_DIR="$2"
# DAYS=${3:-14}
# TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)

# R="\e[31m"
# G="\e[32m"
# N="\e[0m"
# Y="\e[33m"

# USAGE() {
#     echo -e "$G Usage: $Y <Source> <Destination> <DAYS optional>$N"
# }

# if [ $# -lt 2 ]; then
#     USAGE
#     exit 1
# fi

# if [ ! -d "$SRC_DIR" ]; then
#     echo -e "$SRC_DIR $R does not exist $N"
#     exit 1
# fi

# if [ ! -d "$DEST_DIR" ]; then
#     echo -e "$DEST_DIR $R does not exist $N"
#     exit 1
# fi

# # IMPORTANT: use +$DAYS, not $DAYS
# FILES=$(find "$SRC_DIR" -name "*.log" -mtime +$DAYS)

# echo "files:"
# echo "$FILES"

# if [ -n "$FILES" ]; then
#     echo "Files found"
#     ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"

#     find "$SRC_DIR" -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@

#     if [ -f "$ZIP_FILE" ]; then
#         echo "Successfully zipped files older than $DAYS days"

#         while IFS= read -r file; do
#             echo "Deleting: $file"
#             rm -f "$file"
#         done <<< "$FILES"

#     else
#         echo -e "Zipping files $R FAILED $N"
#         exit 1
#     fi
# else
#     echo "No files older than $DAYS days."
# fi