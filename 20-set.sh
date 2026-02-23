#!bin/bash

set -e # setting the automatic exit  if we get any error e=exit, x=debug

failure(){
   echo "Failure at $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal

echo "Success"
echooo "FAILURE"
Echo "failure"
