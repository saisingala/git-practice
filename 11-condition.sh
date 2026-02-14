#!bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];
then
echo "Please run the script with root privilages"
exit 1
fi

dnf list installed git
if [ $? -ne 0 ]; then
     echo "Installing git"
     dnf install git -y
else 
    echo " Git is already installed nothing to do..."
fi


