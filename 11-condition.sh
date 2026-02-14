#!bin/bash
USERID=$(id -u)
if [ $USERID = 0 ];
then
echo "you are connected to sudo user"
else 
echo "you are not connected to sudo user"
fi