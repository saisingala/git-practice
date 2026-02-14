#!bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ];
      then
      echo "Please run the script with root privilages"
      exit 1
    fi
}

VALIDATE (){
   
    if [ $1 -ne 0 ]; then
        echo -e " $2 is ... $R Failed $N"
        exit 1
    else 
        echo -e "$2 is .... $G Success $N"
    fi        
}

CHECK_ROOT

dnf list installed git


if [ $? -ne 0 ]; then
     echo "Installing git"
     dnf install git -y

     VALIDATE $? "Listing GIT "
else 
    echo " Git is already installed nothing to do..."
fi
 

dnf list installed mysqlll
if [ $? -ne 0 ]; then
   echo "Mysql is not installed.. going to install it"
   dnf install mysqlll -y
   VALIDATE $? "Listing MYSQL "
else
  echo "mysql is already installed"
fi


   

