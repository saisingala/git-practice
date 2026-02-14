#!bin/bash
USERID=$(id -u)

VALIDATE (){
    echo "exit status: $1"
}
if [ $USERID -ne 0 ];
 then
   echo "Please run the script with root privilages"
   exit 1
fi

dnf list installed git

VALIDATE $?

# if [ $? -ne 0 ]; then
#      echo "Installing git"
#      dnf install git -y
#    if [ $? -ne 0 ]; then
#          echo "git installation is not success. check it"
#          exit 1
#    else
#          echo "git installation success" 
#     fi
# else 
#     echo " Git is already installed nothing to do..."
# fi
 

# dnf list installed mysql
# if [ $? -ne 0 ]; then
#    echo "Mysql is not installed.. going to install it"
#    dnf install mysql -y
#   if [ $? -ne 0 ]; then
#       echo "Installation is not success. check it"
#       exit 1
#   else
#       echo "Mysql installation is success"
#    fi
# else
#   echo "mysql is already installed"
# fi


   

