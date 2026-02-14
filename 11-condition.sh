#!bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];
then
echo "Please run the script with root privilages"
exit 1
fi

dnf list installed gitt
if [ $? -ne 0 ]; then
     echo "Installing git"
     dnf install gitt -y
   if [ $? -ne 0 ]; then
         echo "git installation is not success. check it"
         exit 1
   else
         echo "git installation success" 
else 
    echo " Git is already installed nothing to do..."
fi


