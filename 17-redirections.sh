#!bin/bash
LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ];
      then
      echo -e " $R Please run the script with root privilages $N" &>> $LOG_FILE
      exit 1
    fi
}

VALIDATE (){
   
    if [ $1 -ne 0 ]; then
        echo -e " $2 is ... $R Failed $N" &>> $LOG_FILE
        exit 1
    else 
        echo -e "$2 is .... $G Success $N" &>> $LOG_FILE
    fi        
}

CHECK_ROOT

for package in $@
 do
    dnf list installed $package
       if [ $? -ne 0 ]
       then
           echo "$package is not installed ... going to install" &>> $LOG_FILE
           dnf install $package -y  &>> $LOG_FILE
           VALIDATE $? "Listing $package" 
        else
           echo "$package is $Y already installed....nothing do $N" &>> $LOG_FILE
        fi      
 done