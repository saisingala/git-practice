#!bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ];
      then
      echo "Please run the script with root privilages"
      exit 1
    fi
}

VALIDATE (){
   
    if [ $1 -ne 0 ]; then
        echo " $2 is ...Failed"
        exit 1
    else 
        echo "$2 is ....Success"
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
 

dnf list installed mysql
if [ $? -ne 0 ]; then
   echo "Mysql is not installed.. going to install it"
   dnf install mysql -y
   VALIDATE $? "Listing MYSQL "
else
  echo "mysql is already installed"
fi


   

